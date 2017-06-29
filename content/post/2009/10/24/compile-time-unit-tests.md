---
date: 2009-10-24 01:21:54
slug: compile-time-unit-tests
title: Compile-time unit tests
categories: [ "code" ]
---

[Boost](http://www.boost.org/) [Build V2](http://beta.boost.org/boost-build2/doc/html/index.html) includes [testing](http://beta.boost.org/boost-build2/doc/html/bbv2/builtins/testing.html) module that provides nice features for running unit tests. A unit test run means a test builds and can be executed performing checks in run-time, however, a unit test can be also based on compilation or even linking result. Yet more surprisingly, sometimes a test is expected to not to compile and such failure is considered as success. It performs [compile-time checking](http://research.microsoft.com/en-us/projects/specsharp/) in [design by contract](http://en.wikipedia.org/wiki/Design_by_contract).





In [Generic Geometry Library](http://trac.osgeo.org/ggl/), some tests use that feature of testing compilation result. For example, this way it's possible to test the concepts in practice and to ensure that various constructs are not accepted by the library as expected by design.





For example, `custom_linestring.cpp` source file can be used to perform compile-time and run-time testing. If `TEST_FAIL_APPEND` is defined, unacceptable constructs are compiled and the compilation is expected to fail. If compiled without `TEST_FAIL_APPEND` defined, only acceptable code is enabled and regular run-time test performed.





Configuration of such thing is very easy with [Boost Build V2](http://beta.boost.org/boost-build2/doc/html/bbv2/tutorial.html). Here is Jamfile.v2 that performs the test for geometries in Generic Geometry Library using `compile-fail` rule:



    
    <code>test-suite ggl-geometries
        :
        [ compile-fail custom_linestring.cpp 
            : # requirements
            <define>TEST_FAIL_APPEND
            : # target name
            custom_linestring_test_fail_append
        ]
        [ run custom_linestring.cpp ]
    </code>





[There](http://beta.boost.org/boost-build2/doc/html/bbv2/builtins/testing.html) are among others also rules like `compile`, `link-fail` and `link`.





The unit tests execution is simple:



    
    mloskot@dog:~/dev/ggl/_svn/trunk/libs/ggl/test/geometries$ bjam | grep passed
    **passed** bin/custom_linestring_test_fail_append.test/gcc-4.4.1/debug/custom_linestring_test_fail_append.test
    **passed** bin/custom_linestring.test/gcc-4.4.1/debug/custom_linestring.test
