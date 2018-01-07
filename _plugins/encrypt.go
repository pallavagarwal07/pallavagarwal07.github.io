// Derived from https://gist.github.com/manishtpatel/8222606
package main

import (
	"fmt"
	"io/ioutil"
	"os"

	enc "../_lib/encrypt"
)

func main() {
	var out []byte
	var err error
	if len(os.Args) > 1 {
		out, err = ioutil.ReadFile(os.Args[1])
	} else {
		out, err = ioutil.ReadAll(os.Stdin)
	}
	if err != nil {
		panic(err)
	}

	key := ""
	if key = os.Getenv("MASTER_KEY_VARSTACK"); key == "" {
		panic("MASTER_KEY_VARSTACK not set.")
	}

	header, out := enc.Split(out)

	//encrypt value to base64
	cryptoText := enc.Encrypt([]byte(key), string(out))
	cryptFile := string(header) + cryptoText

	if len(os.Args) > 1 {
		err = ioutil.WriteFile(os.Args[1]+".cpt", []byte(cryptFile), 0644)
	} else {
		fmt.Printf("%s", cryptFile)
	}
	if err != nil {
		panic(err)
	}
}
