---
title: Git branching notes
description: Collection of best practices for simple and effective Git branching
date: 2013-02-06 23:00:00

---

This is collection of short notes on best practices for simple and effective use of
[Git][git] branching and merging to make a source code management workflow in Git
simple, flexible and safe.

I'm going to update this post whenever I learn new and interesting tips,
so this is a rolling blog.

Git repository:

* [a photo album][progit], collection of snapshots of a project filesystem
* hash identifies state of a repository as a whole
* ```hash = parent state + difference```

Git branch:

* a work context
* ```master``` is a default branch always available in a repository

Git branching and merging:

* vital for [tree of life][grce] of a project
* tools for managing different tracks of project, separate work contexts
* controlling changes flow in two possible directions:
    * upstream - changes flow towards the origin branch
    * downstream - flow of changes that come down from the origin branch
* branches make trees, trees make forests, use ```git rebase``` as [thinning][thin] tool

Git workflow:

* *This is how I use Git to do what I need*
* flexibility given on a silver platter
* no single workflow given, many [successful Git branching models][sgbm] possible
* may distinguish several types of branches
* allows to work on several features or topics at the same time

Git locally:

* *I create branch for everything* - [Jenny Donnelly][jdyt]:
    * for every version in production
    * for every new feature or topic
    * for every bug fix
* switch working contexts (branches) frequently, it is safe
* merge early and merge often to keep workflow smoooth

Git ```master``` branch:

* default branch, every Git repository has it
* keep it nice and clean
* main integegration zone
* never do any coding in the ```master``` branch
* available to branch off of ```master``` to get clean snapshot of latest stable code
* use consistent naming convention for topic branches, bugfix branches, version maintenance branches, your own experiments


*...to be continued*

[git]: http://git-scm.com/
[grce]: http://www.youtube.com/watch?v=GTMC3g2Xy8c
[jdyt]: http://www.youtube.com/watch?v=QB6r9Y7mqyU
[progit]: http://git-scm.com/book/en/Getting-Started-Git-Basics
[sgbm]: http://nvie.com/posts/a-successful-git-branching-model/
[thin]: http://en.wikipedia.org/wiki/Thinning