#!/bin/bash
# -*- ENCODING: UTF-8 -*-
bin/bundle exec rspec -v >/dev/null 2>&1 && { if [ -z "$*" ]; then echo >&2 "[Rspec]: Rspec is using default options..."; fi; } || { echo >&2 "[Rspec]: Add rspec to your Gemfile"; }

bin/bundle exec rspec "$@"
case "$?" in
  0 ) echo "[Rspec]: Your code pass all test!";                 exit 0;;
  1 ) echo "[Rspec]: Your commit doesn't pass all test!";       exit 1;;
  2 ) echo "[Rspec]: Invalid options to this command";          exit 2;;
  * ) echo "[Rspec]: There is something strange at this point"; exit 1;;
esac