let
pkgs = import <nixpkgs> {};
in
{ stdenv ? pkgs.stdenv, python ? pkgs.python, pythonIRClib ? pkgs.pythonIRClib }:

stdenv.mkDerivation {
    name = "python-nix";
    version = "0.1.0.0";
    src = ./.;
    buildInputs = [
            pkgs.python2
            pkgs.ruby
            pkgs.bundler
            pkgs.zlib
            pkgs.pythonIRClib
            pkgs.python2Packages.zope_interface
            pkgs.python2Packages.beautifulsoup4
            pkgs.python2Packages.markdown
            pkgs.python2Packages.pygments
    ];
    shellHook = "bundle exec jekyll serve";
}
