#!/bin/bash
# -*- ENCODING: UTF-8 -*-
rubocop "$@"
case "$?" in
	0 ) 	echo "[Rubocop]: Your code is clean"; 											exit 0;;
  1 ) 	echo "[Rubocop]: Your commit is a quite dirty"; 						exit 1;;
	2 ) 	echo "[Rubocop]: Invalid options to this command"; 					exit 2;;
  127 ) echo "[Rubocop]: You don't have this command installed"; 		exit 0;;
	* ) 	echo "[Rubocop]: There is something strange at this point"; exit 1;;
esac