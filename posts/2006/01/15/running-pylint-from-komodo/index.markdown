---
comments: true
date: 2006-01-15 07:51:42
layout: post
slug: running-pylint-from-komodo
title: Running PyLint from Komodo
wordpressid: 81
categories: programming
tags: ide,komodo,programming,pylint,python
---

![ActiveState Komodo Logo](/images/logos/komodo-logo.gif)Thanks to John's [Get Komodo for free](http://thinkhole.org/wp/2005/12/30/get-komodo-for-free/) post I started to use [Komodo](https://www.activestate.com/Products/Komodo/) on my laptop. It's really well-done software, so I put [Vim](http://www.vim.org) away (for a while or longer :-)) and started to develop my scripts using Komodo.






A few days ago I also read [John's post](http://thinkhole.org/wp/2006/01/09/pylint/) about [PyLint](http://www.logilab.org/projects/pylint) tool. I was looking for something like this as well as for a comprehensive style guide for Python. John points out both in his post.







**Update:** [Command package](http://mateusz.loskot.net/2006/01/15/running-pylint-from-komodo/#download) has been updated - PyLint output parser included. Now, you can navigate to every line of script reported by PyLint with single click! I'd like to say **BIG THANKS** to [Trent](http://trentm.com) for this [excellent solution](http://mateusz.loskot.net/2006/01/15/running-pylint-from-komodo/#comment-10).







**Update:** I'm still experimenting with Komodo customizations, so [here](http://mateusz.loskot.net/2006/01/15/running-pylint-from-komodo/#download) you have **Run PyLint** command availabled as a package ready to import into your Komodo.







Yesterday, I asked on [Komodo list](http://aspn.activestate.com/ASPN/Mail/Browse/Threaded/komodo-discuss) about possible integration with PyLint and Robert Hicks suggested to add a custom **Run Command** to the **Toolbox**. So, I tried to find out how to do it. Finally, I managed to run PyLint from Komodo and it's really nice. You can edit a script, then you can double-click on this custom command from the Toolbox and PyLint will do the job sending the report to the **Command Output** tab. You can run it using key shortcut as well.






Here is a step by step explanation how to add **Run PyLint** command to the Toolbox:




    
  * Prerequisites:
    
        
    * Download and install [PyLint](http://www.logilab.org/projects/pylint)

        
    * Check **Install** section in the README file and learn how to make pylint.bat visible in your PATH

    
    

    
    
  * Open **Toolbox** by selecting **View** > **Tabs** > **Toolbox**


    
  * Inside the Toolbox add **New Command...** from right-click context menu. You can create your own Toolbox folder first and add command to it.

    
    
  * In the **Add Command** dialog box give following settings:    
        
        
    * **Command** tab:
            
            
      * In the first text box give command name

            
      * In the **Command** text box put: _pylint %f_

            
      * In the **Advanced Options** frame, in **Run in** drop-down box select: **Command Output Tab**

            
        

        
    * **Key Binding** tab:
            
            
      * Assign **New Key Sequence** as you like e.g. **CTRL + L, CTRL + P**

            
        

        
    









**Download:** [run-command-pylint.kpz](http://mateusz.loskot.net/download/tools/komodo/run-command-pylint.kpz)







Here are screenshots visualizing steps above:






[![Command tab](http://mateusz.loskot.net/gallery/_gallery_albums_store/software/komodo_pylint_integration_1.thumb.jpg)](http://mateusz.loskot.net/gallery/software/komodo_pylint_integration_1) [![Command tab](http://mateusz.loskot.net/gallery/_gallery_albums_store/software/komodo_pylint_integration_2.thumb.jpg)](http://mateusz.loskot.net/gallery/software/komodo_pylint_integration_2) [![Command tab](http://mateusz.loskot.net/gallery/_gallery_albums_store/software/komodo_pylint_integration_3.thumb.jpg)](http://mateusz.loskot.net/gallery/software/komodo_pylint_integration_3)






I also agree with what Robert Hicks wrote in his post on the list:



> P.S. I hope someone comes up with a Komodo macro site one of these days. I look at the Komodo shots in the AS blogs and they have a lot of them it seams. I have a lot for Perl but now that I am evaluting Ruby and Python for work, it would be nice to have.



So, may be some day...

