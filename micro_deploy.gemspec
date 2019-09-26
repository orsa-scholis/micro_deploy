# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'micro_deploy/version'

Gem::Specification.new do |spec|
  spec.name = 'micro_deploy'
  spec.version = MicroDeploy::VERSION
  spec.authors = ['Lukas Bischof']
  spec.email = ['me@luk4s.dev']

  spec.summary = 'Write short deployment files and use them to deploy from remote repository'
  spec.description = 'Write short deployment files and use them to deploy from remote repository'
  spec.homepage = 'https://github.com/orsa-scholis/micro_deploy'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/orsa-scholis/micro_deploy'
  spec.metadata['changelog_uri'] = 'https://github.com/orsa-scholis/micro_deploy/blob/develop/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'bin'
  spec.executables << 'micro_deploy'
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end
