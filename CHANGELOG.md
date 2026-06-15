# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> **Note:** This repository is the `guideline-tech` fork of
> [`queue-bus/sidekiq-bus`](https://github.com/queue-bus/sidekiq-bus). The `1.0.x`
> series diverges from upstream to support scheduling the queue-bus heartbeat via
> Sidekiq Enterprise periodic jobs (`config.periodic`) instead of taking a hard
> runtime dependency on `sidekiq-scheduler`, which is the scheduler our apps use.

## [Unreleased]

## [1.0.4]

### Changed
- Update gemspec: authors and email reflect fork ownership, homepage updated to `guideline-tech` org, fork attribution added to description.
- Add gemspec metadata: `source_code_uri`, `changelog_uri`, `homepage_uri`, `github_repo`, `rubygems_mfa_required`.
- Modernize gemspec style: `frozen_string_literal`, `spec` variable, remove deprecated `test_files`.
- Add `required_ruby_version >= 3.3`.
- Fix `.rubocop.yml`: rename `Metrics/LineLength` → `Layout/LineLength`, bump `TargetRubyVersion` to 3.3, add `NewCops: enable`; autocorrect many pre-existing violations.
- Add `.github/dependabot.yml` for bundler and GitHub Actions dependency updates.
- Track `Gemfile.lock` in version control.

## [1.0.3]

### Changed
- Synced `SidekiqBus::VERSION` to the released tag; the constant had lagged at `1.0.1`.
- Documented the fork's divergence from upstream `queue-bus/sidekiq-bus` (see note above).

## [1.0.2] - 2025-05-22

### Changed
- Raised the upper bound on `sidekiq` to allow Sidekiq 7 (`>= 3.0.0, < 8.0`).
- Bumped Ruby to 3.3.9.

## [1.0.1] - 2023-12-12

### Added
- Sidekiq Enterprise support: when `Sidekiq::Enterprise` is defined, the queue-bus
  heartbeat is registered as a Sidekiq Enterprise periodic job rather than through
  `sidekiq-scheduler`.

## [1.0.0] - 2023-10-17

### Changed
- Expanded the `sidekiq` requirement to allow versions below 7.
- Removed the hard `sidekiq-scheduler` runtime dependency; it is now required lazily
  (and raises with a clear message if missing) only on the non-Enterprise heartbeat path.

## [0.9.0] - 2019-12-03

### Added
- Tab in sidekiq web ui for bus info

### [0.8.2] - 2019-08-06

### Fixed
- Schedule now uses cron format to schedule heartbeat. The "every: 1min" format was causing multiple heartbeats to fire in the same minute if there were multiple sidekiq processes with the dynamic setting turned off (which is default).

### [0.8.1] - 2019-08-05

### Fixed
- Schedule is now setup correctly for dyanmic schedules and non-dynamic

## [0.8.0] - 2019-07-31

### Added
- Adds sidekiq-scheduler as a dependency
- Sets up the schedule of heartbeats within the adapter.

## [0.7.0] - 2019-07-29

### Changed
- Increased the minimum version of queue-bus
- If the adapter is already set, will not warn instead of error.

## [0.6.1] - 2019-06-17
### Changed

 - Upper limit of sidekiq version was expanded to include all minor versions of sidekiq.
