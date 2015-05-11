# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'middleman-lunr'
  s.version     = '0.1.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Joël Gähwiler']
  s.email       = ['joel.gaehwiler@gmail.com']
  # s.homepage    = 'http://example.com'
  # s.summary     = %q{A short summary of your extension}
  # s.description = %q{A longer description of your extension}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency('middleman-core', ['~> 3.3'])
  s.add_runtime_dependency('therubyracer', ['~> 0.8'])
end
