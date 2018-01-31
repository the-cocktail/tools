#!/bin/bash
# -*- ENCODING: UTF-8 -*-
rubycritic "$@"
case "$?" in
	0 )   echo "[RubyCritic]: Your code is on high level"; 							 exit 0;;
  1 )   echo "[RubyCritic]: Your commit is not as well as you think";  exit 1;;
  2 )   echo "[RubyCritic]: Invalid options to this command"; 				 exit 2;;
  127 ) echo "[RubyCritic]: You don't have this command installed"; 	 exit 0;;
	* )   echo "[RubyCritic]: There is something strange at this point"; exit 1;;
esac