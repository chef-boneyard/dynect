# dynect

This file is used to list changes made in each version of the dynect cookbook.

## 2.2.0 (2018-05-14)

- Use Bento slugs in Kitchen
- More cleanup of the maintainer files
- Use dokken images and fix suites
- Require build-essential 5.0 and use the resource directly

## 2.1.0 (2017-07-09)

- Remove chef 11 compatibility in chef_gem
- Update apache2 license string
- Add various platforms to the metadata
- Use converge_by and load current_resource properly
- Testing updates
- Update maintainers docs
- Dont' fail to parse metadata on older chef client releases
- Make sure we have build-essential installed at compile_time by setting the compile time attribute in the build-essential cookbook

## 2.0.0 (2016-09-08)

- Require Chef 12

## 1.1.0 (2016-08-30)

- Use build-essential to make sure the gem can compile in the default recipe
- Disable compile-time installation of the gem in the default recipe

## v1.0.11 (2016-03-15)

- Improved documentation for setting attributes. Added recommendation for setting attributes in a secure fashion via a wrapper cookbook
- Added a .foodcritic file to exclude FC059 for now
- Added long_description to the metadata
- Added additional Chefspec testing
- Updated Rubocop config to 0.38 format
- Updated testing deps and removed cloud deps

## v1.0.10 (2015-10-20)

- Updated the requirements section of the readme to make the minimum supported Chef release 11 not 0.8
- Improved readme formatting
- Added gitignore file
- Added chefignore file
- Added Chef standard rubocop config
- Added Travis CI testing
- Added Berksfile
- Added Gemfile with testing deps
- Updated testing and contributing docs
- Added maintainers.md and maintainers.toml files
- Added travis and cookbook version badges to the readme
- Added a Rakefile for simplified testing
- Added source_url and issues_url to the metadata
- Added basic convergence Chefspec
- Resolved Rubocop warnings

## v1.0.9 (2015-02-18)

- Reverting chef_gem compile_time work

## v1.0.8 (2015-02-18)

- Fixing chef_gem with Chef::Resource::ChefGem.method_defined?(:compile_time)

## v1.0.7 (2015-02-18)

- Fixing chef_gem for Chef below 12.1.0

## v1.0.6 (2015-02-17)

- Being explicit about usage of the chef_gem's compile_time property.
- Eliminating future deprecation warnings in Chef 12.1.0.

## v1.0.4

- [COOK-2382]: dynect: foodcritic style change

## v1.0.2

- [COOK-2381] - dynect: /etc/hosts entry does not get updated on
- Amazon Linux due to regex mismatch

## v1.0.0

- [COOK-1958] - use `chef_gem` for runtime gem requirement
