---
date: 2009-10-25 03:16:38
slug: mloskot-boost-regression-tests
title: mloskot @ boost regression tests
categories: programming
---

I run [Boost C++ Libraries](http://www.boost.org) regression tests for the first time today. The test driver is brilliant. It's a single python script [run.py](http://www.boost.org/development/running_regression_tests.html) that takes care of all aspects of regression tests run: gets build system, builds [bjam](http://www.boost.org/doc/tools/build/doc/html/jam/usage.html) (a clever make equivalent) if not available, grabs [Boost source tree](http://svn.boost.org/trac/boost/), builds [Boost libraries](http://www.boost.org/libs/), runs tests, combines tests reports to single XML files and uploads it to server in secret location. All this by single command:




    
    python run.py --tag="trunk" --runner="mloskot-x86_64" \
       --toolsets="gcc" --bjam-toolset="gcc" --bjam-options="-j4"





Then, a scheduled magic on the server crunches all uploaded [reports](http://www.boost.org/development/testing.html#RegressionTesting) and builds detailed [summary of regression tests](http://www.boost.org/development/tests/trunk/developer/summary.html). My builder is called _mloskot-x86_64_.





That is really a user friendly infrastructure of running regression tests and it allows an average Boost user to contribute in testing.
