// Taken from https://gist.github.com/manishtpatel/8222606
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
	var name string
	if len(os.Args) > 1 {
		name = os.Args[1]
		if name[len(name)-4:] != ".cpt" {
			panic("Not a .cpt file")
		}
		out, err = ioutil.ReadFile(os.Args[1])
	} else {
		out, err = ioutil.ReadAll(os.Stdin)
	}
	if err != nil {
		panic(err)
	}
	header, out := enc.Split(out)

	key := ""
	if key = os.Getenv("MASTER_KEY_VARSTACK"); key == "" {
		panic("MASTER_KEY_VARSTACK not set.")
	}

	//decrypt value
	cryptoText := string(header) + enc.Decrypt([]byte(key), string(out))

	if len(os.Args) > 1 {
		err = ioutil.WriteFile(name[:len(name)-4], []byte(cryptoText), 0644)
	} else {
		fmt.Printf("%s", cryptoText)
	}
	if err != nil {
		panic(err)
	}
}
