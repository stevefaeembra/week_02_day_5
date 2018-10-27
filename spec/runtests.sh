#!/bin/zsh
for i in $( ls *.rb ); do
  ruby $i
done
