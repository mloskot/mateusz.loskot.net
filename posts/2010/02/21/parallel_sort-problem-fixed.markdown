---
comments: true
date: 2010-02-21 16:39:59
layout: post
slug: parallel_sort-problem-fixed
title: parallel_sort problem fixed
wordpressid: 1899
categories: programming
tags: Alexey Kukanov,intel,parallel,tbb,threading
---

My [problem](/?p=1891) with crashing programs using TBB has been solved. Alexey Kukanov [replied](http://software.intel.com/en-us/forums/showpost.php?p=110124) to my [question](http://software.intel.com/en-us/forums/showthread.php?t=72130) explaining that because I use TBB 2.1, thus I have to explicitly initialise the task scheduler. Without this initialization, no context (root) for tasks is created, so no tasks possible.





Simply, I was reading latest manual which was generated for TBB 2.2 (available in [Ubuntu 10.04](http://packages.ubuntu.com/lucid/libtbb2)), so I missed this legacy requirement. In TBB 2.2 and later, the initialization is optional:





> Using task_scheduler_init is optional in Intel? TBB 2.2. By default, Intel? TBB 2.2 automatically creates a task scheduler the first time that a thread uses task scheduling services and destroys it when the last such thread exits.





Correct version of the example program should look as follows:




    
    <code>#include <tbb/task_scheduler_init.h>
    #include <tbb/parallel_sort.h>
    #include <cmath>
    #include <vector>
    using namespace tbb;
    int main()
    {
        task_scheduler_init tbb_init; // automatic
    
        const int n = 100000;
        std::vector<double> a(n);
        for (int i = 0; i< n; i++)
        {
            a[i] = std::sin(double(i));
        }
        parallel_sort(a.begin(), a.end());
    }</code>
