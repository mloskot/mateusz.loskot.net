+++
date = "2014-02-02 23:49:41"
title = "Application Development with Qt Creator"
categories = [ "code" ]
+++

__TL;TR__ [Ray Rischpater](https://www.packtpub.com/books/info/authors/ray-rischpater) wrote a very good tutorial. So, if you are new to Qt Creator and Qt and you prefer to read short yet complete tutorials written by a skilled technical author that get you started in no time, I can recommend Ray’s book.

Last October, I decided to give [Qt Creator](http://qt-project.org/wiki/Category:Tools::QtCreator) a try and see if I can find my way through its features. Before, I would use Vim and console with collection of command line tools for code browsing, searching, building, debugging, testing, and so on. I was hoping that Qt Creator could prove as an alternative, still fast and efficient to operate with keyboard, yet with convenient graphical debugger and other features useful for developing software written C++.

I created [a small pet project](https://github.com/mloskot/qt-creator-plugin-boostbuild) to use as a blasting site for testing Qt Creator. To charge things with extra excitement, I’d taken up the idea of extending Qt Creator itself and writing plugin to provide support for Boost.Build - as a build system used by large codebase of the Boost C++ Libraries. This was also first project where I used Qt - a double learning objective. I eventually managed to release version 0.0 delivering a surprisingly usable plugin.

A few weeks later, I received Packt’s book titled [Application Development with Qt Creator](http://www.packtpub.com/application-development-with-qt-creator/book) written by Ray Rischpater. I skimmed the table of contents and my reaction was: I don’t need to read it, as I’ve already got further with using Qt Creator than that. Having nothing else fresh on my Kindle, I decided to give it a go and eventually spent a few journeys on the Underground to work reading it.

Now, speaking of the book. It is short. Hard copy has around 140 pages. This is good. It makes it feel more like a tutorial than detailed reference guide, so it reads quick. It is also visible in the structure of the book which is well planned and systematically advances through major features of Qt Creator.

First chapter gets you started and presents what it takes to create a minimal Qt application using Qt Creator. Ray’s took an interesting approach and decided to present Qt GUI and Qt Quick at the same time, sort of.

Note, the book does not go beyond presentation of the Qt GUI module of base widgets. Also, it is based on Qt Creator 2.8 and one may complain about it as [Qt Creator 3.0 was released](https://blog.qt.digia.com/blog/2013/12/12/qt-creator-3-0-released/) two months ago.

> Anyhow, 3.0 does not add more features versus 2.8, but it fixes many issues.

Second chapter is where the fun starts. Ray came up with a very simple idea of creating a library of math functions and a console client application linking against the library, and use it to show complete development cycle of writing code, building project and debugging output program. Complete configuration of qmake project is included, of course.

Next chapter walks through construction of a simple GUI application using graphical UI designer available in Qt Creator. First, Ray explains the basics of Qt signals and slots and he does it very well. This is an obvious prerequisite to be able to wire application logic with all those fancy widgets dragged and dropped on the forms in the designer. I’m glad the Qt Creator plugin I’ve developed did not require any GUI design skills which, frankly, I don’t possess. Anyhow, it looks the designer built into Qt Creator seems to make the whole process very accessible. By the way, it’s good Ray explains the essential difference between programming in C++ and QML, that is imperative versus declarative programming.

Clearly, the overall idea is to present Qt Creator, not to teach programming with Qt.

Slight change of topic in the fourth chapter to how to localise an application written in Qt. The translation side of the development lifecycle is very clearly explained, without further ado, walks through all the bare steps required to make an application talk to users in different languages.

Finally, in chapter five I found an interesting treat. The performance analysis of Qt Quick applications written in JavaScript-like QML language. I had no idea such feature existed in Qt Creator, quite interesting. The chapter also presents basics of how to use Valgrind to verify application against any memory leaks. Big plus for showing this essential tool to beginners.

I skipped the chapter six about using Qt Creator to develop applications for mobile devices like Android. Simply, when it comes to mobile software, I prefer to stay on the backend or server side.

I also skipped the chapter seven which feels a little like a random selection of tips and tricks wrapped up in rush.

I usually have a problem with books like the Application Development with Qt Creator, especially if it comes to making up my opinion about them. The book is well structured, well written and whole material is well presented. There are not many mistakes. I caught one: Qt Creator modes are called views. Correct is the former, as [there is mode selector, not view selector](http://qt-project.org/doc/qtcreator-3.0/creator-quick-tour.html).

On the other hand, it is this kind of book that I would get, read once and hardly ever come back as I would switch to regular documentation of a software. Especially, if the documentation is as good, if not great, as the ones provided by authors of Qt Creator and Qt.

Nevertheless, Ray Rischpater wrote a very good tutorial which holds its promise from the beginning to the end (almost :-)). That is, to introduce basic concepts of programming using Qt and Qt Creator in step-by-step manner. And, he did it very well.

So, if you are new to Qt Creator and Qt and you prefer to read short yet complete tutorials written by a skilled technical author that get you started in no time, I can recommend Ray’s book.