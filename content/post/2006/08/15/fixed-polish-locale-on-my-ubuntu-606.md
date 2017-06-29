---
date: 2006-08-15 03:09:32
slug: fixed-polish-locale-on-my-ubuntu-606
title: Fixed polish locale on my Ubuntu 6.06
categories: [ "code" ]
---

[![Ubuntu Linux](/images/logos/ubuntu-logo.png)](http://www.ubuntulinux.org)Today, I installed a very nice utility to generate LOC statistics for my code - [sloccount](http://www.dwheeler.com/sloccount/). Every time I run this tool, I got following message: _perl: warning: Setting locale failed._.








    
    perl: warning: Setting locale failed.
    perl: warning: Please check that your locale settings:
            LANGUAGE = "pl_PL.UTF-8",
            LC_ALL = "",
            LANG = "pl_PL"
        are supported and installed on your system.
    perl: warning: Falling back to the standard locale ("C").




This message clearly says I don't have LC_ALL set with appropriate value. So, I did not think too long and run tried to set it:

    
    $ export LC_ALL=pl_PL.UTF-8


and checked if everything is OK, and it wasn't:

    
    $ locale
    mloskot:~$ locale
    locale: Cannot set LC_CTYPE to default locale: No such file or directory
    locale: Cannot set LC_MESSAGES to default locale: No such file or directory
    locale: Cannot set LC_ALL to default locale: No such file or directory
    LANG=pl_PL.UTF-8
    ...


Hmm, strange.




I [googled](http://en.wikipedia.org/wiki/Google_(verb)) a bit and I found I need to reconfigure my locales. First, I had to install [localeconf](http://packages.ubuntu.com/dapper/misc/localeconf) because I it wasn't installed:

    
    $ sudo apt-get install localeconf


Then, I was able to reconfigure locales on my box:

    
    $ sudo dpkg-reconfigure locales
    $ sudo dpkg-reconfigure localeconf


I answered questions asked bo configuration wizards with checking all boxes next to LC_CTYPE, LC_MESSAGES, and other customizable LC_* variables, just only to be sure they will be exported.




After these steps, I run _locale_ command, but LC_ALL= was still listed as empty variable, so I added following line to the $HOME/.bash_profile file:

    
    export LC_ALL=pl_PL.UTF-8




Now, all locales are exported properly and I don't get any error or warning message from Perl scripts. I just wonder why LC_ALL is not set during installation by default.
