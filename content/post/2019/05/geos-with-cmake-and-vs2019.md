+++
date = "2019-05-24 13:49:41"
title = "Building GEOS with CMake and Visual Studio 2019 on Windows"
categories = [ "code" ]
+++

Finally, my proposal of modernised CMake configuration
[GEOS PR #130](https://github.com/libgeos/geos/pull/130) has been accepted to
[GEOS](https://trac.osgeo.org/geos) codebase.
Together with [Paul Ramsey](http://blog.cleverelephant.ca/), [Dan Baston](https://github.com/dbaston)
and [Martin Davis](https://github.com/dr-jts), we picked it up and spent some time during the
[OSGeo Code Sprint 2019](https://wiki.osgeo.org/wiki/OSGeo_Community_Sprint_2019)
last week, preparing it for final integration.

The new CMake requires fairly recent, two or three years old but not older,
version of CMake (3.8/3.9 or later).
In order to build GEOS with the latest release of VS 2019, we need CMake 3.14.

> CMake user rule #1: Use the very latest version of CMake

## Prerequisites

* Visual Studio 2019
* [CMake](https://cmake.org/files) 3.14.4+
* [Ninja](https://ninja-build.org)
* [IncrediBuild](https://www.incredibuild.com) 9.4+ (optional)

## Learn about CMake drivers

* [cmake](https://cmake.org/cmake/help/latest/manual/cmake.1.html) to configure and build
* [ctest](https://cmake.org/cmake/help/latest/manual/ctest.1.html) to run tests

## Clone GEOS

```
git clone https://github.com/libgeos/geos.git
cd geos
```

## Build with CMake generator for Ninja (fast)

In the Visual Studio 2019 command prompt, `x64 Native Tools Command Prompt for VS 2019` or `x64_x86 Cross Tools Command Prompt for VS 2019`:

```
cmake -S . -B _build_vs2019_ninja -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build _build_vs2019_ninja -j 16 --verbose
```

## Build with CMake generator for MSBuild (default)

In the non-specific Command Prompt:

### 64-bit

```
cmake -S . -B _build_vs2019x64 -G "Visual Studio 16 2019" -A x64 -DCMAKE_GENERATOR_TOOLSET=host=x64
cmake --build _build_vs2019x64 --config Release -j 16 --verbose
```

### 32-bit

```
cmake -S . -B _build_vs2019x32 -G "Visual Studio 16 2019" -A win32 -DCMAKE_GENERATOR_TOOLSET=host=x64
cmake --build _build_vs2019x32 --config Release -j 16 --verbose
```
### Bonus: IncrediBuild

Using IncrediBuild [BuildCosole.exe](https://www.incredibuild.com/webhelp/BuildConsole.html) driver:

```
cd _build_vs2019x64
"%ProgramFiles(x86)%\IncrediBuild\BuildConsole.exe" GEOS.sln /build /cfg="Release|x64" /vsversion=vc16
```

```
cd _build_vs2019x32
"%ProgramFiles(x86)%\IncrediBuild\BuildConsole.exe" GEOS.sln /build /cfg="Release|Win32" /vsversion=vc16
```

## Test

```
cd <build directory>
ctest --show-only
ctest --build-config Release
ctest --build-config Release --output-on-failure
ctest --build-config Release -V
ctest --build-config Release -VV
```

## Build times

Brief comparison of build times for handful of build generators and
build strategies on machine with 24 physical cores:

- Ninja with `-j 16`

    ```
    Start: 15:04:07
    End:   15:04:42
    ```

- MSBuild with `-maxcpucount:16` (value not very relevant though)

    ```
    Start: 14:43:49
    End:   14:50:04
    ```

- IncrediBuild with 16 cores package

    ```
    Start: 14:31:49
    End:   14:34:03
    ```

## Call for testing

I created a very extensive CI build matrix with Azure Pipelines
and set it up for my fork of GitHub's `libgeos/geos`.
The builds can be observed at https://dev.azure.com/mloskot/geos/_build.
If GEOS accepts my [PR #170](https://github.com/libgeos/geos/pull/172),
then every contributor will be able to set up the CI pipeline for her own fork.

The new CMake configuration for GEOS still needs testing and reviews,
especially from seasoned [modern](https://www.youtube.com/watch?v=y7ndUhdQuU8)
and [effective](https://www.youtube.com/watch?v=bsXLMQ6WgIk) CMake users.
Have a go and [report issues](https://trac.osgeo.org/geos/#BugReporting).