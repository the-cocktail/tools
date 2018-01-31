#!/bin/bash
# -*- ENCODING: UTF-8 -*-
rspec "$@"
case "$?" in
	0 )   echo "[Rspec]: Your code pass all test!"; 								exit 0;;
  1 )   echo "[Rspec]: Your commit doesn't pass all test!"; 			exit 1;;
	2 ) 	echo "[Rspec]: Invalid options to this command"; 					exit 2;;
  127 ) echo "[Rspec]: You don't have this command installed"; 		exit 0;;
	* )   echo "[Rspec]: There is something strange at this point"; exit 1;;
esac