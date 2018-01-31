#!/bin/sh
# -*- ENCODING: UTF-8 -*-
error=0

# Add here as many scripts you want to check before commiting
# You can pass same options you could pass the
# ./hook_path/hook_name.sh [options]
# if [ $? != 0 ]; then
#   error=1
# fi

# These are some scripts examples you can add
#
# Rspec testing
# ./hooks/bash/pre-commit/run-tests/rspec.sh
# if [ $? != 0 ]; then
#   error=1
# fi

# Rubocop
# ./hooks/bash/pre-commit/run-code-qa-reviewers/rubocop.sh 
# if [ $? != 0 ]; then
#   error=1
# fi

# Rubycritic
# ./hooks/bash/pre-commit/run-code-qa-reviewers/rubycritic.sh -s 90 --no-browser
# if [ $? != 0 ]; then
#   error=1
# fi

if [ $error != 0 ]; then
	exit $error
fi
