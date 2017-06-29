---
title: Hakyll posts in folders
description: Switched file-based posts to folder-based
date: 2012-12-15

---

I applied another quick improvement to my [Hakyll](http://jaspervdj.be/hakyll/)
configuration inspired by [Ian Ross' blog](https://github.com/ian-ross/blog/) 
(what a great resource for Hakyll ideas).

I switched all my posts from flat file-based structure to layout with each
post sitting in its own dedicated folder. For example, this old post:

```
/posts/2005/08/22/welcome-to-the-jungle.markdown
```

now lives in its own folder:

```
/posts/2005/08/22/welcome-to-the-jungle/index.markdown
```

This is mostly a cosmetic change, but I can see it has advantages if used
with static site generators:
* allows bundle all files related to posts in separate post-specific folder
* helps to keep the whole site a self-contained package
* a self-contained website is easy to move around, export, backup
* makes it possible to use URLs without ```.html``` extension

The switch was quick and easy using the following script:

```
#!/bin/bash
# posts-in-folders.sh - switches blog to folder-based posts
POSTSDIR=${1}
[[ -d ${POSTSDIR} ]] || ( echo "Directory '${POSTSDIR}' does not exist"; exit 1; )
POSTS=$(find ${POSTSDIR} -name '*.markdown')
for post in ${POSTS};
do
    postdir=${post%.*}
    newpost=${postdir}/index.markdown
    [[ -d ${postdir} ]] && 
        ( echo "Deleting existing '${postdir}' folder"; rm -r ${postdir}; )
    mkdir ${postdir}
    echo "Created '${postdir}'"
    git mv ${post} ${newpost}
    echo "Moved '${post}' to '${newpost}'"
done
```

and the whole procedure involved these few steps:

```
cd /path/to/mateusz.loskot.net.git
./posts-in-folders.sh ./posts
git commit -m "Switched to posts in folders" .
git push origin master
```

Now, I only need to implement rules for copying post resources like images,
source code files, and others.

## Related posts:

* [Powered by Hakyll](/posts/2012/12/03/powered-by-hakyll/)
