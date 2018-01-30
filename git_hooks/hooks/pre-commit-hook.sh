#!/bin/sh
# -*- ENCODING: UTF-8 -*-
error=0

# Add here as many scripts you want to check before commiting
#
# Rspec testing
# ./hooks/tests/rspec.sh
# if [ $? != 0 ]; then
#   error=1
# fi

# Rubocop
# ./hooks/code_qa/rubocop.sh
# if [ $? != 0 ]; then
#   error=1
# fi

# Rubycritic
# ./hooks/code_qa/rubycritic.sh
# if [ $? != 0 ]; then
#   error=1
# fi

if [ $error != 0 ]; then
	exit $error
fi
