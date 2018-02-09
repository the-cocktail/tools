#!/bin/bash
# -*- ENCODING: UTF-8 -*-
bin/bundle exec rails test "$@"
case "$?" in
  0 ) echo "[MiniTest]: Your code pass all test!";                 exit 0;;
  1 ) echo "[MiniTest]: Your commit doesn't pass all test!";       exit 1;;
  2 ) echo "[MiniTest]: Invalid options to this command";          exit 2;;
  * ) echo "[MiniTest]: There is something strange at this point"; exit 1;;
esac