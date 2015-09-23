$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'erb_spec/version'

Gem::Specification.new do |s|
  s.name          = 'erb_spec'
  s.version       = ErbSpec::VERSION
  s.summary       = 'A method for direct testing of erb template files'

  s.authors       = ['Peter Roberts']
  s.email         = 'peter.roberts@sky.uk, peterjroberts@gmail.com'

  s.files         = Dir["lib/**/*", "README.md"]
  s.require_paths = ['lib']

  s.add_dependency 'capybara', '~> 2.2'

  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'pry'
end
