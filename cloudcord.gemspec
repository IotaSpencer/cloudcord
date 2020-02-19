# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'cloudcord/version'

Gem::Specification.new do |s|
  s.name          = 'cloudcord'
  s.version       = Cloudcord::VERSION
  s.authors       = ['Ken Spencer']
  s.email         = ['me@iotaspencer.me']
  s.homepage      = 'https://github.com/Ken Spencer/cloudcord'
  s.licenses      = []
  s.summary       = '[summary]'
  s.description   = '[description]'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end
