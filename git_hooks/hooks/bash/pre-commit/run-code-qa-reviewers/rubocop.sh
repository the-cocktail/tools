#!/bin/bash
# -*- ENCODING: UTF-8 -*-
bin/bundle exec rubocop -v >/dev/null 2>&1 && { if [ ! -f .rubocop.yml ]; then echo >&2 "[Rubocop]: Rubocop is using default rules..."; fi; } || { echo >&2 "[Rubocop]: Add rubocop to your Gemfile"; }

bin/bundle exec rubocop "$@"
case "$?" in
  0 )	echo "[Rubocop]: Your code is clean";                       exit 0;;
  1 )	echo "[Rubocop]: Your commit is a quite dirty";             exit 1;;
  2 )	echo "[Rubocop]: Invalid options to this command";          exit 2;;
  * )	echo "[Rubocop]: There is something strange at this point"; exit 1;;
esac