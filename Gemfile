source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)
gem 'jekyll-watch'
gem 'github-pages', versions['github-pages']
