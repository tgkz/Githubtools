#!/bin/sh
# show project name in github.com
# Usage: showproj URL [URL] [URL]
#  specify github URLs, if gitrepo have multple pages, specify all 
#  and then show all the project name in that github repos
reponame=`echo $1 | sed 's:https.*github.com/::'`
for url in $*
do
    #curl https://github.com/$reponame >a.html
    curl -s $url  >a.html
    grep "a href=\"/$reponame/"  a.html|awk {'print $2'}|sed 's/href=\"//;s/"//'| sed "s:/$reponame/::"
done
rm a.html  # this must be pipe between curl and grep
