$: << 'lib'

require '__arguments__/version'

Gem::Specification.new do |s|
  s.version       = Arguments::VERSION
  s.name          = 'method-arguments'
  s.authors       = ['Hiro Asari']
  s.email         = ['asari.ruby@gmail.com']
  s.homepage      = 'https://github.com/BanzaiMan/ruby-arguments'
  s.summary       = 'Access list of arguments passed to the current method'
  s.description   = ''
  s.license       = 'MIT'
  s.require_path  = 'lib'
  s.required_ruby_version = '>= 2.2'

  s.files         = Dir['{lib/**/*,[A-Z]*}']

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'pry'
end
