#!/bin/bash
# -*- ENCODING: UTF-8 -*-
bin/bundle exec rubycritic -v >/dev/null 2>&1 && { if [ -z "$*" ]; then echo >&2 "[RubyCritic]: RubyCritic is using default options..."; fi; } || { echo >&2 "[RubyCritic]: Add rubycritic to your Gemfile"; }

bin/bundle exec rubycritic "$@"
case "$?" in
  0 ) echo "[RubyCritic]: Your code is on high level";               exit 0;;
  1 ) echo "[RubyCritic]: Your commit is not as well as you think";  exit 1;;
  2 ) echo "[RubyCritic]: Invalid options to this command";          exit 2;;
  * ) echo "[RubyCritic]: There is something strange at this point"; exit 1;;
esac