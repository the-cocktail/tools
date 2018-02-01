#!/bin/sh

# Redirect output to stderr.
exec 1>&2

consoleregexp='console.log|debugger|binding.pry'
echo "[Debugger]: Looking for forgotten debugger trace..."
if test $(git diff --cached | grep -E $consoleregexp | wc -l) != 0
then
  files_changed=$(git diff --cached --name-only --)
  for file in $files_changed
  do
    if test $(grep -E $consoleregexp $file | wc -l) != 0
      then
        echo '[Debugger]: File:' $file':'$(grep -E -n $consoleregexp $file | cut -f1 -d:)
        grep -E -ne $consoleregexp $file
        echo
      fi
  done
  exit 1;
fi
echo "[Debugger]: Your code is safe from debugger trace!"