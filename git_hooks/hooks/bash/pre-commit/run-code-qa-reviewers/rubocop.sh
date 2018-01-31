#!/bin/bash

# Check if rubocop is installed for the current project
bin/bundle exec rubocop -v >/dev/null 2>&1 || { echo >&2 "[Rubocop]: Add rubocop to your Gemfile"; exit 1; }

# Executes rubocop as The-Cocktail tools guidestyle
bin/bundle exec rubocop -a -D -S
