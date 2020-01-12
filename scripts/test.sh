#!/usr/bin/env bash

set -x
set -e

bundle install
RAILS_ENV=test bundle exec rake db:drop db:create db:migrate
bundle exec rspec
