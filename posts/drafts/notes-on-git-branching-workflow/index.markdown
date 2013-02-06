---
title: Notes on Git branching workflow
description: Collection of best practices for simple and effective Git branching
date: XXX
category: code
tags: git,branching,workflow
---

- diff + parent = hash
- hash identifiers state of a repository as a whole

In my local environment:

* branch for everything
- for every version in production
- for every new feature, new idea
- for every bug fix
* switch working contexts frequently, it's safe
* merge early, merge often and you're workflow will be smoooth

Every Git repository has a default branch called master:

- keep it nice and clean
- integegration zone
- never do any coding in the master branch
- available to branch off of master to get clean snapshot of latest stable code
- use consistent naming convention for branches

Changes flow in two directions:
- upstream - towards the origin branch or repository
- downstream - changes that come down from the origin 

[jdyt]: http://www.youtube.com/watch?v=QB6r9Y7mqyU
