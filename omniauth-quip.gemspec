
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-quip/version'

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-quip'
  gem.version       = Omniauth::Quip::VERSION
  gem.authors       = ['Joel Van Horn']
  gem.email         = ['joel@joelvanhorn.com']
  gem.description   = 'OmniAuth strategy for Quip'
  gem.summary       = 'OmniAuth strategy for Quip'
  gem.homepage      = 'https://github.com/identification-io/omniauth-quip'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
end
