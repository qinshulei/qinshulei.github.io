#!/bin/bash
cd $(dirname $0)/..
rvm use ruby-2.1.3
bundle install
bundle exec jekyll serve
