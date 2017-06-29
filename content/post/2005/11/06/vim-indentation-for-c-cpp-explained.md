---
date: 2005-11-06 07:01:48
slug: vim-indentation-for-c-cpp-explained
title: Vim indentation for C/C++ explained

---

![Vim logo](/images/logos/vim-logo.gif)In today's early morning post, I'm going give a short crash course about [Vim](http://www.vim.org) settings for [indentation](http://en.wikipedia.org/wiki/Indentation). Every [programmer](http://en.wikipedia.org/wiki/Programmer) knows how source code indentation important is. There is no discussion about it. Vim, my favourite text editor, provides programmer with rich indetation features set. You can customize almost all aspects of code formating. So, let's see what kind of indentation features Vim provides and how they affect indentation.

## General Indentation Settings

**:set autoindent**
If set, Vim automatically indents a new line to the same indentation used by previous line. In other words ViM automatically tabs a new line. smartindent and cindent are _autoindent_ variations and changes the way indentation and formatting more precisely.

**:set smartindent**
Context-sensitive autoindent, great when coding, makes intendation aware of C-like syntax.

**:set shiftwidth**
Using this option you can define number of spaces placed on every indentation step i.e. _:set shiftwidth=3_ will instruct Vim to indent with 3 spaces for every TAB command.

## TAB Settings

**:set expandtab**
Use this option if you want every TAB to be expanded to spaces.

**:set smarttab**
If this option is set, then TAB command shifts line to right and BACKSPACE shifts line to left, both inserting number of blanks as defined in shiftwidth. If _smarttab_ is not set, then TAB inserts blanks according to tabstop.

**:set softtabstop**
This one tells Vim to interpret TAB as an indent command instead of insert-a-TAB command.

**:set tabstop**
Simply, it instructs Vim how many space characters Vim counts for every TAB command. According to Vim manual it's recommended to leave default _tabstop=8_, what means  every TAB is displayed with 8 space characters, and adjust only softtabstop and shiftwidth.

## C-style Indent

**:set cindent**
This sets autoindent to even more smart and strict mode for C and C++ source code.

**:set cinoptions**
Simply, it sets cindent configuration options.

## Help

To learn how to use Vim commands and how to set indentation settings refer to online [VimDoc](http://vimdoc.sourceforge.net/htmldoc/) or run open help _:h <option>_ where _option_ is one of Vim command. I also recommend to take a look at the Vim website with [documentation](http://www.vim.org/docs.php) and huge database of [tips](http://www.vim.org/tips/index.php).

### Online Resources

[Vi and Vim](http://www.troubleshooters.com/lpm/200212/200212.htm) in Linux Productivity Magazine, Volume 1 Issue 5
[Introduction to Programming in C/C++ with Vim](http://www.justlinux.com/nhf/Programming/Introduction_to_C_Programming.html) by [Kmj](mailto:kmj9907@cs.rit.edu)
[VIM (Vi IMproved)](http://www.geocities.com/h2lee/vim.html)
[The Vi/Ex Editor](http://www.networkcomputing.com/unixworld/tutorial/009/009.html) by Walter Alan Zintz
Vi for programmers, [part 1](http://builder.com.com/5100-6372_14-5253006.html) and [part 2](http://builder.com.com/5100-6372-5254151.html)

_Let's go hacking and have fun!_
