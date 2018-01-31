#!/bin/bash

# Check if Rubocop is installed for the current project
# If Rubocop is installed
#   If no Rubocop rules, Rubocop is using default rules
#     then show a warning message
#   and executes Rubocop as The-Cocktail tools guidestyle
#
# If Rubocop isnt installed,
#   But you have Rubocop rules in this repo,
#     then you must install Rubocop

bin/bundle exec rubocop -v >/dev/null 2>&1 && { if [ ! -f .rubocop.yml ]; then echo >&2 "[Rubocop]: Rubocop is using default rules"; fi; bin/bundle exec rubocop -a -D -S; exit 0; } || { if [ -f .rubocop.yml ]; then echo >&2 "[Rubocop]: Add rubocop to your Gemfile"; exit 1; fi; }
