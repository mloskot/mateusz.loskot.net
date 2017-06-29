---
title: FindBoost.cmake patched for Visual Studio 11
date: 2011-11-10 20:31:57

slug: findboost-cmake-patched-for-visual-studio-11
categories: [ "code" ]
---

My [patch](http://public.kitware.com/Bug/view.php?id=12568) updating [CMake](http://www.cmake.org) module [FindBoost.cmake](http://cmake.org/cmake/help/cmake-2-8-docs.html#module:FindBoost) for Boost C++ Libraries lookup has been [accepted and committed](http://cmake.org/gitweb?p=cmake.git;a=commitdiff;h=1c4ba48e) to the CMake Git repository. Thanks to [Brad King](http://www.kitware.com/company/team/king.html) for quick review.


The patch adds most recent versions of Boost 1.47 and 1.48 to the lookup table and uses correct toolset tag `vc110` (see [Library Naming](www.boost.org/doc/libs/release/more/getting_started/windows.html)) when checking for libraries built using Visual Studio 11.
