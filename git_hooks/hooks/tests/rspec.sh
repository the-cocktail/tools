#!/bin/sh
# -*- ENCODING: UTF-8 -*-
if rspec
then
	echo "[Rspec]: Your code pass all test!"
else
	x=$?
	echo "[Rspec]: Your commit doesn't pass all test!"
	exit $x
fi