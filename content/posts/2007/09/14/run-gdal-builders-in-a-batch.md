---
date: 2007-09-14 06:20:40
slug: run-gdal-builders-in-a-batch
title: Run GDAL builders in a batch
categories: programming
---

In my daily work, I have to run [GDAL builders](http://buildbot.osgeo.org:8500/) very often and simultaneously. Each time I need to request new builds, I have to make 20-30 clicks. So, when it's third or fifth round of building, every click hurts :) and here comes the genius of Python language.




I wrote a simple utility script - [gdalbb.py](/download/software/scripts/gdalbb.py) - that simplifies running one:

    
    gdalbb.py -b telascience-quick


or whole _family_ of builders from the GDAL Buildbot instance:

    
    gdalbb.py -f


in one shot. It can also list all builders available from the Buildbot instance:

    
    mloskot@dog:~ gdalbb.py -l
    Connecting to GDAL Buildbot instance: http://buildbot.osgeo.org:8500/
    List of available builders :
    1. telascience-quick
    2. telascience-full
    3. epimetheus-full
    4. szekerest-vc80-full
    5. szekerest-vc71-full
    6. szekerest-vc80x64-full







It's very easy to customize the [gdalbb.py](/download/software/scripts/gdalbb.py) script to use it with [other Buildbot instances](http://buildbot.osgeo.org/) available for OSGeo projects. Just edit three values in the configuration block of the script:

    
    ### BEGIN CONFIGURATION BLOCK ###
    BBURL = 'http://buildbot.osgeo.org:8500/'
    BBUSER = 'mloskot'
    BBNOTE = 'Routine build'
    #### END CONFIGURATION BLOCK ####


That's it!




Perhaps, as a next step, it would be a good idea to make this script usable as an IRC bot.
