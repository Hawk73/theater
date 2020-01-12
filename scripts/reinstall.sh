#!/usr/bin/env bash

set -x
set -e

rm -rf tmp/*
rm -rf log/*

bundle install

bundle exec rake db:drop db:create db:migrate db:seed
