#!/bin/sh
# -*- ENCODING: UTF-8 -*-
if rubycritic -s 90 --no-browser
then
	echo "[RubyCritic]: Your code is on high level"
else
	x=$?
	echo "[RubyCritic]: Your commit is not as well as you think"
	exit $x
fi