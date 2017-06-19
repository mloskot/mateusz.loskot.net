---
title: Debugger visualizers in Visual Sudio 11 Developer Preview
date: 2011-11-19 20:37:52
category: code
comments: true
layout: post
slug: debugger-visualizers-in-visual-sudio-11-developer-preview
wordpressid: 2289
categories: programming
tags: c++,c++0x,c++11,debugger,defaultvis.natvis,fix,ide,microsoft,natvis,patch,std,tr1,visual c++,visual studio,visual studio 11,visualizer,windows
---

[Visual Studio 11 Developer Preview](http://www.microsoft.com/download/en/details.aspx?id=27538) [introduces new style debugger visualizers](http://social.msdn.microsoft.com/Forums/is/vcgeneral/thread/5e847744-aa01-49cd-ac47-fe32da1673a3). The [autoexp.dat](http://msdn.microsoft.com/en-us/library/zf0e8s14.aspx) definition of templates in previous versions of the Visual Studio debugger is being replaced with new style definitions based on XML and stored in `defaultvis.natvis` file.





Microsoft explains the motivation behind redesigning the native type visualization mechanism is to give better diagnostic reporting (visualizer expressions can be now evaluated and displayed in the output window to help debugging .natvis file), provide XSD schema defining type definition, support of multiple files for type definition: system-wide in `%ProgramFiles%\Microsoft Visual Studio 11.0\Common7\Packages\Debugger\Visualizers\defaultvis.natvis` and user-defined in `%USERPROFILE%\My Documents\Visual Studio Dev11\Visualizers\xxx.natvis`.





It sounds really good and has a great usability potential for programmers who uses C++ [generative programming](http://www.generative-programming.org/) capabilities, defines complex C++ types, heavily uses C++ Standard Library and [Boost C++ Libraries](http://www.boost.org).





Here is example of new style visualizer defined in XML copied from the `defaultvis.natvis`:




    
    
      <!--std::unique_ptr from <memory>-->
      <Type Name="std::unique_ptr<*>">
        <DisplayString Condition="_Myptr == 0">empty</DisplayString>
        <DisplayString>unique_ptr {*_Myptr}</DisplayString>
        <Expand>
          <Item Name="[ptr]" Condition="_Myptr != 0">_Myptr</Item>
        </Expand>
      </Type>
    





For most types from [C++](http://www.open-std.org/jtc1/sc22/wg21/) Standard Library and [Windows SDK](http://www.microsoft.com/download/en/details.aspx?id=8279), the new visualizers work very well. However, the currently available Visual Studio 11 Developer Preview (Version 11.0.40825.2 PREREL) is shipped with incorrect definitions in the `defaultvis.natvis`. The [C++TR1](en.wikipedia.org/wiki/C%2B%2B_Technical_Report_1) definitions introduced in Visual Studio 2008 are only forwarded (aliased) from `std:tr1::` to `std::` in Visual Studio 2010. In Visual Studio 11, they have completely moved from `std::tr1::` to `std::` to align with [C++11](http://en.wikipedia.org/wiki/C%2B%2B11) standard. But, the new visualizers in `defaultvis.natvis` define templates are still referring to the [C++11](http://blogs.msdn.com/b/vcblog/archive/2011/09/12/10209291.aspx) types in `std::tr1::` namespace.





This prevents the correct visualization for types like `std::shared_ptr`:





[![vs11-visualizers-broken-2](http://farm7.staticflickr.com/6091/6361010279_d56cc58797_o.png)](http://www.flickr.com/photos/mloskot/6361010279/)





There is an easy workaround possible:







  1. Make private copy of `defaultvis.natvis` in `%USERPROFILE%\My Documents\Visual Studio Dev11\Visualizers\xxx.natvis` where xxx is your preferred name.


  2. Open `xxx.natvis` in a text editor.


  3. Find `std::tr1::` and replace with `std::`.


  4. Save the changes and relaunch the Visual Studio 11.


  5. You should see objects of the C++11 types correctly visualized.





[![vs11-visualizers-fixed-3](http://farm7.staticflickr.com/6234/6364640125_3631bcc522_o.png)](http://www.flickr.com/photos/mloskot/6364640125/)





I have reported this issue to [Microsoft Connect](http://connect.microsoft.com/) in [Incorrect Type Name references in defaultvis.natvis visualizers for standard library](http://connect.microsoft.com/VisualStudio/feedback/details/705993/) ticket.
