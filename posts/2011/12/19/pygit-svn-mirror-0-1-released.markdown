---
comments: true
date: 2011-12-19 02:13:40
layout: post
slug: pygit-svn-mirror-0-1-released
title: pygit-svn-mirror 0.1 released
wordpressid: 2849
categories: open source,programming
tags: Eloy Durán,git,github,python,ruby,script,subversion
---

I have been looking for easy and quick solution to mirror [Subversion](http://subversion.apache.org/) repositories in [Git](http://git-scm.com/) at [GitHub](http://github.com). With bit of reading and testing, I came up with some quite usable [workflow](http://trac.osgeo.org/gdal/wiki/UsingGitToMaintainGDALWorkflow). But, most likely due to my lack of [Git fu](http://progit.org/), I wasn't happy with it. Especially, could not find how to update Git mirrors from various locations and computers, also to allow others to do that.





Lately, I have found a tool written in [Ruby](http://www.ruby-lang.org/) by [Eloy Durán](https://github.com/alloy). It is [git-svn-mirror](https://github.com/alloy/git-svn-mirror/) - _a command-line tool that automates the task of creating a Git mirror for a SVN repository, and keeping it up-to-date_. I installed Eloy's tool from [Ruby gems](https://rubygems.org/gems/git-svn-mirror) and played with it for a while. I really liked it.





I skimmed the Ruby code of `git-svn-mirror` and found out it makes use of [bare repositories in Git](http://schacon.github.com/git/user-manual.html). A Git bare repository stores just the contents of the `.git` directory, without any files checked out around it. Long story short, this script does almost exactly what I need and if there is something it does not do, then I can add it.





I have never written a single line of code in Ruby and I don't feel like I need to learn it now. So, I decided to port [git-svn-mirror](https://github.com/alloy/git-svn-mirror/) to Python. I have just pushed [pygit-svn-mirror](https://github.com/mloskot/pygit-svn-mirror) 0.1 based on git-svn-mirror 0.1 to the repository at GitHub. I have tried to follow command line interface and overall code structure of the original version in Ruby. I have also preserved the original license and Eloy's copyright.





There is README.md file included with detailed guide on how to use the `pygit-svn-mirror`. Basically, there are two commands: `init` and `update`. For each command, `--help` option will display required and supported arguments.





For example, creating mirror of Subversion repository of PROJ.4 project at GitHub involves the following commands:




    
    
    mkdir /path/to/proj4/mirror
    cd /path/to/proj4/mirror
    git-svn-mirror.py init \
      --from=https://svn.osgeo.org/metacrs/proj/ \
      --to=git@github.com:<USRNAME>/proj.4.git
    





and to update the mirror from its workbench directory:




    
    
    cd /path/to/proj4/mirror
    git-svn-mirror.py update
    





or from any folder but with workbench location pointed explicitly:




    
    
    git-svn-mirror.py update -w /path/to/proj4/mirror
    





[Feedback](/contact), [bug reports and patches](https://github.com/mloskot/pygit-svn-mirror/issues) highly appreciated.





Finally, big thanks to [Eloy Durán](https://github.com/alloy) for the original [git-svn-mirror](https://github.com/alloy/git-svn-mirror/) written in Ruby.
