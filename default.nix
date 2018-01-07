{pkgs? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "varstack.com";
    version = "0.1.0.0";
    src = ./.;
    buildInputs = [
            pkgs.python2
            pkgs.ruby
            pkgs.zlib
            pkgs.nodejs
            pkgs.bundler
            pkgs.pythonIRClib
            pkgs.python2Packages.zope_interface
            pkgs.python2Packages.beautifulsoup4
            pkgs.python2Packages.markdown
            pkgs.python2Packages.pygments
            pkgs.go
    ];
    buildPhase = ''
        export GIT_SSL_CAINFO=/etc/ssl/certs/ca-certificates.crt
        export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

        export HOME=`mktemp -d -t`
        export GOPATH="$HOME/go"
        mkdir -p "$GOPATH"
        export PATH="$GOPATH/bin:$PATH"
        go get -u github.com/gopherjs/gopherjs

        bundle config --global jobs 4
        bundle install
        MASTER_KEY_VARSTACK=PUT_KEY_HERE bundle exec jekyll build
    '';
    installPhase = ''
        mkdir -p $out
        mv _site $out/public
    '';
    shellHook = ''
        read -p "Enter master password: " -s MASTER_KEY_VARSTACK;
        export MASTER_KEY_VARSTACK;
        bundle exec jekyll serve;
    '';
}
