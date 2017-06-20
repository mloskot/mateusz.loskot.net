---
date: 2008-06-01 19:32:48
slug: osgeo-archives-inquisitor
title: OSGeo archives inquisitor
categories: open source
---

All OSGeo mailing lists are managed by [GNU Mailman](http://www.gnu.org/software/mailman/). Mailman is a great piece of software but it lacks of user friendly search engine. In order to search, for instance, [gdal-dev archives](http://lists.osgeo.org/pipermail/gdal-dev/) I usually feed Google with a query like this:



    
    
    +libtiff +crash site:http://lists.osgeo.org/pipermail/gdal-dev
    





It works well but requires me to know and input direct URL of archives I want to scan. There are nearly **100** [OSGeo mailing lists](http://lists.osgeo.org) and sometimes I need to juggle quite many of them. Not much fun. The [Nabble](http://www.nabble.com/OSGeo.org-f18127.html) comes in handy when I have to do many searches at the same time.





I have been using [Safari](http://en.wikipedia.org/wiki/Safari_browser) as main Web browser since I moved to Mac OS X - it just runs faster on my PowerBook G4. Shortly, I discovered [Inquisitor](http://www.inquisitorx.com/) plugin for Safari and my lists searching practice have changed. Thanks to Inquisitor's feature of additional search engines, I use it as an [interface to the OSGeo](http://www.flickr.com/photos/mloskot/2540486371/in/set-72157602220731855/) mailing lists archives and [OSGeo.org](http://www.osgeo.org/search/node/).





[![inquisitor-searching-osgeo-2](http://farm4.static.flickr.com/3224/2540486377_b96bc34ec4.jpg)](http://www.flickr.com/photos/mloskot/2540486377/)





With a very little configuration, the Nabble and OSGeo.org search engines are accessible in the Safari search box and also using keyboard shortcuts.





Configuration steps:




  1. Install [latest version](http://www.inquisitorx.com/safari/releasenotes.php) of Inquisitor


  2. Go to Inquisitor pane in the Safari preferences dialog box and click [Edit sites...](http://www.flickr.com/photos/mloskot/2540505941/in/set-72157602220731855/)


  3. Add OSGeo add-ins to the additional search engines (see screenshot below)


  4. Click on the plus button to **Add new custom search shortcut...** and input Site Name, search engine URL with query placeholder and optional Shortcut.





[![inquisitor-prefs-edit-sites-2](http://farm3.static.flickr.com/2024/2540505943_228781a291.jpg)](http://www.flickr.com/photos/mloskot/2540505943/)



Here are texts I used to define the three search shortcuts:



    
    
    Site Name: OSGeo.org
    URL: http://www.osgeo.org/search/node/%@
    
    Site Name: OSGeo Mailing Lists
    URL: http://www.nabble.com/forum/Search.jtp?forum=18127&local;=y&query;=%@
    
    Site Name: GDAL Mailing List
    URL: http://www.nabble.com/forum/Search.jtp?forum=1192&local;=y&query;=%@
    





Notice the **%@** part, it is a search query placeholder.





Use of the shortcuts is simple, issue [Cmd + Option + F](http://docs.info.apple.com/article.html?artnum=42951) to jump to the Google search box in Safari, input a query and use [custom keyboard shortcut](http://www.flickr.com/photos/mloskot/2540505943/in/set-72157602220731855/) of desired search engine, for instance I press **Cmd + Shift + G** to search gdal-dev list. Alternatively, while you type your query, the Inquisitor drops down [Spotlight](http://en.wikipedia.org/wiki/Spotlight_(software))-like box and then use arrow keys to select one of listed search engines.
