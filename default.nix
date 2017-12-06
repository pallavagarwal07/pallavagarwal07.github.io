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
    ];
    preUnpack = "echo $PWD";
    buildPhase = ''
        mkdir tmp
        export HOME="$PWD/tmp"
        bundle config
        bundle install
        bundle exec jekyll build
    '';
    installPhase = ''
        rm -df $out
        mv _site $out
    '';
}
