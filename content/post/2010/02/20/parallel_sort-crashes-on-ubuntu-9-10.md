---
title: parallel_sort crashes on Ubuntu 9.10
date: 2010-02-20 03:44:22

slug: parallel_sort-crashes-on-ubuntu-9-10
categories: [ "code" ]
---

I've started to experiment with the [Intel Threading Building Blocks](http://www.threadingbuildingblocks.org/) and hit a wall trying to run a very simple example:

    
```    
#include <tbb/parallel_sort.h>
#include <cmath>
#include <vector>
using namespace tbb;
int main()
{
    const int n = 100000;
    std::vector<double> a(n);
    for (int i = 0; i < n; i++)
    {
        a[i] = std::sin(double(i));
    }
    parallel_sort(a.begin(), a.end());
}


$ g++ -O0 -g -DTBB_USE_DEBUG  -o sort_vector sort_vector.cpp -ltbb
$ gdb ./sort_vector

(gdb) run
Starting program: /home/mloskot/workshop/tbb/parallel_sort/sort_vector
[Thread debugging using libthread_db enabled]

Program received signal SIGSEGV, Segmentation fault.
tbb::task_group_context::init (this=0x7ffffff9c4e0) at ../../src/tbb/task.cpp:3124
3124    ../../src/tbb/task.cpp: No such file or directory.
in ../../src/tbb/task.cpp
(gdb) bt
#0  tbb::task_group_context::init (this=0x7ffffff9c4e0) at ../../src/tbb/task.cpp:3124
#1  0x00000000004013ff in task_group_context (this=0x7ffffff9c4e0, relation_with_parent=tbb::task_group_context::bound)
at /usr/include/tbb/task.h:284
#2  0x0000000000401be4 in tbb::internal::parallel_quick_sort<float *, std::less<float> > (begin=0x7ffffff9c6a0,
end=0x7fffffffe120, comp=...) at /usr/include/tbb/parallel_sort.h:155
#3  0x0000000000401b23 in tbb::parallel_sort<float *, std::less<float> > (begin=0x7ffffff9c6a0, end=0x7fffffffe120,
comp=...) at /usr/include/tbb/parallel_sort.h:203
#4  0x0000000000401ab3 in tbb::parallel_sort<float> (begin=0x7ffffff9c6a0, end=0x7fffffffe120)
at /usr/include/tbb/parallel_sort.h:219
#5  0x0000000000401363 in main () at sort_vector.cpp:12
```


It seems like a failure during initialization of worker threads pool or close to it.


I'm using fairly recent version of TBB 2.1 installed from Ubuntu 9.10 packages, but I'm suspicious this may be a problem with this particular binary version. Let's see what Intel folks will judge [parallel_sort example throws segmentation fault](http://software.intel.com/en-us/forums/showthread.php?t=72130). Pity [Microsoft PPL](http://msdn.microsoft.com/en-us/library/dd492418(VS.100).aspx) does not provide parallel_sort algorithm.


Update: see [parallel_sort problem fixed](/?p=1899)
