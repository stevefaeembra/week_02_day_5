#!/bin/zsh
for i in $( ls *.rb ); do
  echo $i " : " `ruby $i | grep "runs," `
done
