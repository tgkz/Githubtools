#!/bin/sh
# Do git clone for sepcified projects
# Usage : gitclones reponame project-name-list-file
#  reponame - name of the git repository
#  project-name-list-file - text file stored list of the projects
repo=$1
for proj in `cat $2`
do
   git clone https://github.com/$repo/$proj
done
