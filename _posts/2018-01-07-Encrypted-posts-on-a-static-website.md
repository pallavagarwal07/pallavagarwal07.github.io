---
title: Encrypted posts on a Static Website
layout: default
tags: post
---

Happy New Year everyone!

A couple of days ago, I decided to start writing a detailed guide to GSoC and
open source contributions. However, I have seen many people read articles
without actually doing anything, and that really upsets me. As a result, I
decided to create an obstacle course along with the article series so that
people would have to show some proof of work before they can proceed to the
next blog post.

My immediate problem however was much simpler. This is a statically generated
blog. There is no configurable server side. This means that if I decide to
password protect an article, the password verification would have to happen
on the client side, and doing that securely is fairly non-trivial.

Anyway, before we move to the implementation, try to visit the test page for
the final encryption prototype. The password to access the page is `testpage` -
[Encrypted Page](/encrypted/testpage)

Pretty cool, right? If you are interested in computer security, please go ahead
and try to find a way to retrieve the post content without using the password.
Now, when undertaking such a project, there are a couple of things that have to
be kept in mind.

1. Ease of access
    : The end user shouldn't have any difficulty accessing the content if they
    are aware of the password. This means that we need the decryption algorithm
    written in javascript (there is no server side, but the data needs to be
    decrypted on the client).
2. Ease of setup
    : I shouldn't have to manually encrypt decrypt the file(s) every time I need
    to edit them. That would be a pain in the ass, as well as leave a large room
    for errors on my part.
3. Flexibility
    : Each post on the blog should have a unique password, so that unlocking one
    post doesn't mean access to rest of the posts.
4. Security
    : Since the blog is open source, the posts (in form of `.md` files) are
    available on Gitlab. Thus, the source files themselves need to be encrypted
    too.
5. Automation (CI)
    : Since the blog needs to built by the Gitlab CI, CI needs access to:
    - Decrypted version of posts **OR**
    - Encrypted pre-built (markdown to HTML) files **OR**
    - Keys to decrypt the markdown, and then encrypt after building the HTML.

Points 2, 3 and 5 seem rather incompatible with each other. Gitlab CI can be
given secret password/env variables, but doing that for each post would be
extremely inconvinient. Similarly, I may need to edit these posts at any time,
and there is no way I can remember all the passwords of all the files. I can't
risk keeping the passwords in any of my RC files either, since I version
control them to GitHub as well
(<https://github.com/pallavagarwal07/ConfigManagement>).

To resolve these conflicts, I decided to keep a single master password to
encrypt the source markdown files. This password is the strongest one, and if
it falls, all the posts would be decrypted.

The posts however on the blog are encrypted by the CI itself after it converts
the markdown files into HTML. These are encrypted by the password mentioned
inside the decrypted text itself. As you'd see, in the [Test
Page](/encrypted/testpage), the password is mentioned in the content of the
post itself. The password(s) used to encrypt the generated HTML file content
is usually easier (e.g. `testpage`).

Regarding ease of setup, it is necessary to create a workflow that doesn't
leave the decrypted version of the posts in my repository. Since my everyday
editor is vim, the easiest method was to configure vim to:

1. Detect the file being opened is encrypted.
2. Ask user for password.
3. Decrypt the file into memory.
4. Turn off swap file management and persistent undo history.
5. Write decrypted file to vim buffer.

Similarly, on saving the file, vim should:

1. Encrypt the buffer contents (with the earlier asked password).
2. Write the encrypted contents to buffer.

This way, I open my file normally with vim (or neovim), and edit my file as
usual. Vim takes care of all the heavy lifting for me.

*10 points to Ravenclaw!*

Thankfully, the configuration isn't too hard, and is inspired from how vim
used to handle encryption using crypt (which is horribly broken).

Credits: <http://vim.wikia.com/wiki/Encryption>

```
augroup CPT
  au!
  au BufReadPre *.cpt set bin
  au BufReadPre *.cpt set viminfo=
  au BufReadPre *.cpt set noswapfile
  au BufReadPost *.cpt let $MASTER_KEY_VARSTACK = inputsecret("Password: ")
  au BufReadPost *.cpt silent '[,']!go run ~/proj/varstack/_plugins/decrypt.go
  au BufReadPost *.cpt set nobin
  au BufWritePre *.cpt set bin
  au BufWritePre *.cpt '[,']!go run ~/proj/varstack/_plugins/encrypt.go
  au BufWritePost *.cpt u
  au BufWritePost *.cpt set nobin
augroup END
```

Keen observers would notice `encrypt.go` and `decrypt.go` in the midst of the
vim configuration. This is where the magic happens 😉. As the name suggests,
these files encrypt (and decrypt) the data read from `stdin` and write the
output to `stdout`. The passphrase is read from the environment variable
`MASTER_KEY_VARSTACK`.

So, I wrote the encryption and decryption codes in Go. But in the beginning, I
mentioned I would need the decryption protocol in javascript since the
decryption would have to happen on the client side, on the user's browser.
At first look, it seems as though it might've been better to use node to write
the encryption/decryption methods, since the same could've been used for the
browser.

Yeah, but the truth is that unlike Javascript, Go has inbuilt libraries for AES
and other encryption protocols. Writing encryption code in JS would have been
a - not so pleasant experience - to put it mildly. So instead, I decided to use
the Go code itself for the client side decryption.

**Wait what?**

> GopherJS compiles Go code (golang.org) to pure JavaScript code. Its main
> purpose is to give you the opportunity to write front-end code in Go which
> will still run in all browsers.

If you haven't ever checkout out
[GopherJS](https://github.com/gopherjs/gopherjs), today is your lucky day.
GopherJS compiles Go to Javascript, and is compatible with (almost) all Go
features.  Don't believe me? See their [compatibility
table](https://github.com/gopherjs/gopherjs/blob/master/doc/packages.md).

So using GopherJS, I wrote a [Jekyll
converter](https://jekyllrb.com/docs/plugins/#converters), so that any `.go`
files in my blog's source would be compiled to `.js` in the website. After
that, I wrote a small Go code that used the earlier writter `decrypt.go` to
decrypt the encrypted content within the `body` tags of a webpage, and set my
encrypted page to include the corresponding `.js` file.

Finally, I had to write one last [Jekyll
converter](https://jekyllrb.com/docs/plugins/#converters) to read `.cpt` files
(which were basically the markdown files encrypted with master password),
decrypt them with the master password, figure out the output password from the
decrypted text, convert markdown to HTML using existing converter, and finally
encrypt the converted content using the new password. Simple, right? 😉

Anyway, the interesting codes can be seen on the blog source:

1. [Plugins Dir](https://gitlab.com/pallavagarwal07/pallavagarwal07.gitlab.io/tree/source/_plugins)
    - [Go to JS](https://gitlab.com/pallavagarwal07/pallavagarwal07.gitlab.io/blob/source/_plugins/gopherjs.rb)
    - [Decrypt and Encrypt again](https://gitlab.com/pallavagarwal07/pallavagarwal07.gitlab.io/blob/source/_plugins/hooks.rb)
2. [Go files for encryption](https://gitlab.com/pallavagarwal07/pallavagarwal07.gitlab.io/tree/source/_lib/encrypt)


If you have any queries, or want to report a bug/vulnerability in this
approach, I would be very thankful if you leave a comment below :)
