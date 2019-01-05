package encrypt

import (
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"crypto/sha256"
	"encoding/base64"
	"fmt"
	"io"
	"regexp"
	"strings"
)

func Split(data []byte) ([]byte, []byte) {
	front_matter_pattern := regexp.MustCompile(`(?s)^\s*---\n(.*?)---\n`)
	index := front_matter_pattern.FindIndex(data)
	if index == nil {
		return nil, data
	}
	return data[:index[1]], data[index[1]:]
}

func pretty(content string) string {
	chunks := []string{}
	chunksize := 80
	for i := 0; i < len(content); i += chunksize {
		end := i + chunksize
		if end > len(content) {
			end = len(content)
		}
		chunks = append(chunks, content[i:end])
	}

	return strings.Join(chunks, "\n")
}

func ugly(content string) string {
	return strings.Join(strings.Split(content, "\n"), "")
}

func hash_sha256(key []byte) []byte {
	ans := sha256.Sum256(key)
	return ans[:]
}

// encrypt string to base64 crypto using AES
func Encrypt(key []byte, text string) string {
	key = hash_sha256(key)
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
	return pretty(base64.URLEncoding.EncodeToString(ciphertext))
}

// decrypt from base64 to decrypted string
func Decrypt(key []byte, cryptoText string) string {
	key = hash_sha256(key)
	ciphertext, _ := base64.URLEncoding.DecodeString(ugly(cryptoText))

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
