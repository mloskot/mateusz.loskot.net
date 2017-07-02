---
title: Moving posts from WordPress to Hakyll
description: Using exitwp utility to migrate blog posts from WordPress to Markdown format for Hakyll
date: 2013-01-06
categories: [ "code" ]
---

In my [Powered by Hakyll](/posts/2012/12/03/powered-by-hakyll/) announcement, I promised to explain
the simple procedure I used to migrate my blog posts from WordPress to Markdown format for use with
Hakyll.

Shortly after I learned about Hakyll and decided to replace my WordPress-based website with it,
I found the Hakyll discussion group with old thread on
[Converting from WordPress to Hakyll?](https://groups.google.com/forum/?fromgroups=#!topic/hakyll/KZdcNsBVNkA).
I bumped it up and discussed a few possible options.

I eventually decided to use [exitwp](https://github.com/thomasf/exitwp) utility written in Python.
There are a few reasons why I decided to use the exitwp:

* It is fairly simple and clear piece of code without too many requirements.
* It is written in Python. I can hack in Python, so would be able to modify it.
* It consumes content in the
[WordPress eXtended RSS](http://ipggi.wordpress.com/2011/03/16/the-wordpress-extended-rss-wxr-exportimport-xml-document-format-decoded-and-explained/)
(WXR) format easily exportable from the WordPress admin panel,
so there is no fiddling with MySQL database required.
* It seems to be popular among Jekyll and Octopress users.

The exitwp is simple to use and the few steps outlined in its
[README](https://github.com/thomasf/exitwp#getting-started) just work.

However, I had to solve a few problems encoutered. They were mostly related to some particular
features and plugins I used with WordPress or to my idea of the final migration output generated.

First, I had to deal with the WordPress [syntax highlighting](http://en.support.wordpress.com/code/posting-source-code/)
tags ```[text]```, ```[sourcecode]``` and its language-specific variants,  I simply configured the exitwp to
replace it with ```<pre>``` tag. Without this conversion, exitwp was exiting prematurely throwing
a translation error. This can be handled using ``` body_replace``` property in YAML configuration
file used by exitwp.

Next, I noticed that during translation some titles were wrapped with extra apostrophe.
I haven't debugged it deeper, but it seems the [html2text](http://www.aaronsw.com/2002/html2text/)
engine used by the exitwp adds extra apostrophe to titles consisting of some punctuation marks
like colon or hash. So, I modified exitwp adding these lines:

```
s_title = s_title.replace(' ', '_')
s_title = s_title.strip(' \t\n\r\'')
```

I also had to modify the Markdown metadata output to:

* prevent from generating keyword names with underscore as it seems Hakyll didn't like them; for
example, to generate wordpressid instead of wordpress_id
* rename ```published``` keyword with ```date``` as I prefer the latter
* generate date in ISO8601 format, instead of relaxed version with 'T' replaced wth space
* output flat format of taxonomy tags instead of tree-like with each tag in separate line and
prefixed with hyphen because Hakyll didn't like that struture.

Finally, I couldn't decide about how I want to structure posts in my new website and what
URLs I want to generate, so I decided to update exitwp with support of two types of build output:

* flat with dates encoded in filenames: ```YYYY-MM-DD-my-post.markdown```
* tree of folders based on dates: ```YYY/MM/DD/my-post.markdown```

After some experiments, I went for the second option.
Later, I converted my blog structure further and moved
[posts in folders](/posts/2012/12/15/hakyll-posts-in-folders/index.html) using a new Bash script.

I forked exitwp on GitHub and created dedicated branch to maintain all the modifications I've made.
Here is my Git repository with the [exitwp-hakyll](https://github.com/mloskot/exitwp/blob/exitwp-hakyll/)
branch with my version of the exitwp scripts, a bit of documentation in
[README-hakyll.markdown](https://github.com/mloskot/exitwp/blob/exitwp-hakyll/README-hakyll.markdown)
and Hakyll-specific configuration in [config-hakyll.yaml](https://github.com/mloskot/exitwp/blob/exitwp-hakyll/config-hakyll.yaml).

It's worth to note, that my fork of the exitwp does not deliver any major difference in the
conversion workflow or functionality. The changes are mostly minor fixes and custom cosmetic tweaks,
helpful though.
