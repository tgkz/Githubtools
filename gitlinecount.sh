#!/bin/sh
# count # of lines in specified git-dir with optionally specified version tag 
#         (if version tag not specified HEAD is used, means whole life)
# Usage: glinecount <git-dir> [<git-version-tag>]
#
#set -x
if [ $1 = '.' ]; then dir=temp$$
else dir=$1$$
cd $dir
fi
tag=${2:-HEAD}
git archive --format=tar --prefix=gitlinecount-$dir/ $tag |(cd /tmp/ && tar xf -)
cd /tmp/gitlinecount-$dir

echo -n "Lines "
# for line with remove unused word "total" in wc -l
set `find . -type f -print0 |wc -l --files0-from=-|tail -1`; echo -n $1 '\t'

# for # of files
echo -n "Files "
find . -type f |wc -l

cd ..
rm -fr gitlinecount-$1
