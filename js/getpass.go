// +build js

package main

import (
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"io"
	"regexp"
	"strings"

	enc "./_lib/encrypt"

	"github.com/gopherjs/gopherjs/js"
)

var location = js.Global.Get("location")

func setBodyInside(body string) {
	ctn := js.Global.Get("document").Call("getElementById", "content-holder")
	div := ctn.Get("firstElementChild")
	div.Set("innerHTML", body)
}

func extractPass(body string) string {
	re := regexp.MustCompile(`password:\s*([^\s*<>]+)`)
	match := re.FindStringSubmatch(body)
	if match == nil {
		return ""
	}
	return match[1]
}

func askpass() {
	var ready chan int
	var pass string

	pass = js.Global.Call("prompt", "Password required to access page content:", "").String()

	if pass == "" {
		return
	}

	go func() {
		path := location.Get("pathname").String()
		if path[len(path)-1] == '/' {
			path += "index.html"
		}
		html := js.Global.Get("document").Get("body").Get("innerHTML").String()
		re := regexp.MustCompile(
			`-{5}BEGIN ENCRYPTED CONTENT-{5}([\s\S]*?)-{5}END ENCRYPTED CONTENT-{5}`)
		match := re.FindStringSubmatch(html)
		if match == nil {
			println(`Unable to load encrypted content. Network issues maybe?`)
			println(html)
		}
		encrp := strings.TrimSpace(match[1])
		decrp := enc.Decrypt([]byte(pass), string(encrp))
		if extracted := extractPass(decrp); extracted == pass {
			setBodyInside(decrp)
		} else {
			js.Global.Call("alert", "Incorrect password")
		}
		ready <- 1
	}()

	<-ready
	println(pass)
}

func main() {
	js.Global.Get("window").Set("onload", askpass)
}

func pad(key []byte) []byte {
	if len(key) == 0 || len(key) > 32 {
		panic("Invalid key length: " + fmt.Sprint(len(key)))
	}
	for _, l := range []int{16, 24, 32} {
		if len(key) < l {
			key = append(key, make([]byte, l-len(key))...)
			break
		}
	}
	fmt.Println(len(key))
	return key
}

// encrypt string to base64 crypto using AES
func encrypt(key []byte, text string) string {
	key = pad(key)
	plaintext := []byte(text)

	block, err := aes.NewCipher(key)
	if err != nil {
		panic(err)
	}

	// The IV needs to be unique, but not secure. Therefore it's common to
	// include it at the beginning of the ciphertext.
	ciphertext := make([]byte, aes.BlockSize+len(plaintext))
	iv := ciphertext[:aes.BlockSize]
	if _, err := io.ReadFull(rand.Reader, iv); err != nil {
		panic(err)
	}

	stream := cipher.NewCFBEncrypter(block, iv)
	stream.XORKeyStream(ciphertext[aes.BlockSize:], plaintext)

	// convert to base64
	return base64.URLEncoding.EncodeToString(ciphertext)
}

// decrypt from base64 to decrypted string
func decrypt(key []byte, cryptoText string) string {
	key = pad(key)
	ciphertext, _ := base64.URLEncoding.DecodeString(cryptoText)

	block, err := aes.NewCipher(key)
	if err != nil {
		panic(err)
	}

	// The IV needs to be unique, but not secure. Therefore it's common to
	// include it at the beginning of the ciphertext.
	if len(ciphertext) < aes.BlockSize {
		panic("ciphertext too short")
	}
	iv := ciphertext[:aes.BlockSize]
	ciphertext = ciphertext[aes.BlockSize:]

	stream := cipher.NewCFBDecrypter(block, iv)

	// XORKeyStream can work in-place if the two arguments are the same.
	stream.XORKeyStream(ciphertext, ciphertext)

	return fmt.Sprintf("%s", ciphertext)
}
