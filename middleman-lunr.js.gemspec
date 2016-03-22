# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'middleman-lunr'
  s.version     = '0.2.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Joël Gähwiler']
  s.email       = ['joel.gaehwiler@gmail.com']
  s.homepage    = 'https://github.com/256dpi/middleman-lunr'
  s.summary     = 'middleman extension for a static indexed search using lunr.js'
  s.description = 'Create a queryable index of your static site content to use with lunr.js.'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency('middleman-core', ['>= 3.3'])
  s.add_runtime_dependency('therubyracer', ['~> 0.8'])
end
