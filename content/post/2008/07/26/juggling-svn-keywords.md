---
date: 2008-07-26 00:06:30
slug: juggling-svn-keywords
title: Juggling SVN keywords
categories: [ "code" ]
---

When working in a team and maintaining large source code repositories, it's [easy to forget to set svn:keywords property](http://trac.osgeo.org/gdal/ticket/1998) for newly added file or update the property when adding new keywords to files.





The first solution that may come to once mind is to involve cron job or define post-commit hook. The former is easier to setup but may be unsafe if commits are allowed by authenticated users. The second option seems appealing as we can avoid authentication problems, but it's generally not recommended to set properties from a hook. See warning in red frame in the [Hook Scripts](http://svnbook.red-bean.com/en/1.1/ch05s02.html#svn-ch-5-sect-2.1) chapter of the SVN book.





After short discussion with folks on [#gdal](http://www.gdal.org/) IRC channel, we have came to the conclusion that the easiest and safest option will be to periodically run a script fixing the svn:keywords where needed. Such script will be executed by team members on their local machines and against working copy of GDAL sources. This way we assure that the commit process is well authenticated and under human control :-)





So, here is the script - [svnkeywords.sh](http://trac.osgeo.org/gdal/attachment/ticket/1998/svnkeywords.sh) (backed up <del>[here](http://mloskot.devjavu.com/browser/scripts/svnkeywords.sh)</del> [here](http://github.com/mloskot/workshop/tree/master/scripts/)):





    
    $ ./svnkeywords $HOME/dev/gdal/_svn/trunk
    Entering '/home/mloskot/dev/gdal/_svn/trunk'
    Setting svn:keywords property........done.





It is quite generic and can run against any sources tree maintained by Subversion. The only requirement is Unix OS with toolset like /bin/sh, find and grep. Happy using!
