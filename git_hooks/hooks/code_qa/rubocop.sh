#!/bin/sh
# -*- ENCODING: UTF-8 -*-
if rubocop
then
	echo "[Rubocop]: Your code is clean"
else
	x=$?
	echo "[Rubocop]: Your commit is a quite dirty"
	exit $x
fi