# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq_bus/version'

Gem::Specification.new do |spec|
  spec.name        = 'sidekiq-bus'
  spec.version     = SidekiqBus::VERSION
  spec.authors     = ['Gusto']
  spec.email       = ['gusto-opensource-buildkite@gusto.com']
  spec.summary     = 'A simple event bus on top of Sidekiq'
  spec.description = 'A simple event bus on top of Sidekiq. Fork of queue-bus/queue-bus. ' \
                     'Publish and subscribe to events as they occur through a queue.'
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 3.3'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  github_uri = 'https://github.com/guideline-tech/sidekiq-bus'

  spec.homepage = github_uri
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = github_uri
  spec.metadata['changelog_uri'] = "#{github_uri}/blob/master/CHANGELOG.md"
  spec.metadata['github_repo'] = github_uri
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'queue-bus', ['>= 0.7', '< 1']
  spec.add_dependency 'sidekiq', ['>= 3.0.0', '< 8.0']

  spec.add_development_dependency 'json_pure'
  spec.add_development_dependency 'rack'
  spec.add_development_dependency 'redis-namespace'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'sidekiq-scheduler'
  spec.add_development_dependency 'timecop'
end
