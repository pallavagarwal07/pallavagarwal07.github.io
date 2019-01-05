// +build js

package main

import (
	"html"
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
	re := regexp.MustCompile(`password:\s*"([^"]+)"`)
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
		html_str := js.Global.Get("document").Get("body").Get("innerHTML").String()
		re := regexp.MustCompile(
			`-{5}BEGIN ENCRYPTED CONTENT-{5}([\s\S]*?)-{5}END ENCRYPTED CONTENT-{5}`)
		match := re.FindStringSubmatch(html_str)
		if match == nil {
			println(`Unable to load encrypted content. Network issues maybe?`)
			println(html_str)
		}
		encrp := strings.TrimSpace(match[1])
		decrp := enc.Decrypt([]byte(pass), string(encrp))
		if extracted := extractPass(decrp); html.UnescapeString(extracted) == pass {
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
