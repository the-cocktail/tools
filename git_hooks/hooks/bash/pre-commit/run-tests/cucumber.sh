#!/bin/bash
# -*- ENCODING: UTF-8 -*-
bin/bundle exec cucumber --version >/dev/null 2>&1 && { if [ -z "$*" ]; then echo >&2 "[Cucumber]: Cucumber is using default options..."; fi; } || { echo >&2 "[Cucumber]: Add cucumber to your Gemfile"; }

bin/bundle exec cucumber "$@"
case "$?" in
  0 ) echo "[Cucumber]: Your code pass all test!";                 exit 0;;
  1 ) echo "[Cucumber]: Your commit doesn't pass all test!";       exit 1;;
  2 ) echo "[Cucumber]: Invalid options to this command";          exit 2;;
  * ) echo "[Cucumber]: There is something strange at this point"; exit 1;;
esac