# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'utranslate/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'utranslate'
  spec.version     = Utranslate::VERSION
  spec.authors     = ['jcollazos']
  spec.email       = ['julianjaviercollazos@gmail.com']
  spec.homepage    = 'https://github.com/klatooine/utranslate'
  spec.summary     = 'A simple model translation gem.'
  spec.description = 'A simple model translation gem using postgresql JSONB columns'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.0.2', '>= 6.0.2.2'

  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rubocop'
end
