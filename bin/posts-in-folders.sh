#!/bin/bash
#
# Switches blog from file-based posts to folder-based posts.
#
# Initial layout:
#  -posts
#  --2005
#  ---08
#  ----22
#  -----welcome-to-the-jungle.markdown
#
# New layout:
#  -posts
#  --2005
#  ---08
#  ----22
#  -----welcome-to-the-jungle
#  ------index.markdown
#  ------image1.jpg
#  ------hello.cpp
#
# Mateusz Loskot <mateusz@loskot.net>
#
POSTSDIR=${1}
[[ -d ${POSTSDIR} ]] || ( echo "Directory '${POSTSDIR}' does not exist"; exit 1; )
POSTS=$(find ${POSTSDIR} -name '*.markdown')
for post in ${POSTS};
do
    postdir=${post%.*}
    newpost=${postdir}/index.markdown
    [[ -d ${postdir} ]] && ( echo "Delegint existing '${postdir}' folder"; rm -r ${postdir}; )
    mkdir ${postdir}
    echo "Created '${postdir}'"
    git mv ${post} ${newpost}
    echo "Moved '${post}' to '${newpost}'"
done
