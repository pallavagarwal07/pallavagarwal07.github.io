source 'https://rubygems.org'
ruby '2.1.10'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)
gem 'paginator'
gem 'jekyll-watch'
gem 'github-pages', versions['github-pages']
gem 'jekyll-assets'
gem 'jekyll-sitemap'
gem 'sanitize'
gem 'nokogumbo'
gem 'rdiscount'
gem 'pygments.rb'
