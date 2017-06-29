---
date: 2006-01-27 13:14:47
title: How to get rid of MSDN Start page
description: Useful tip on using MSDN documentation

---

Yesterday, I installed [Visual Studio 2005 Professional](http://msdn.microsoft.com/vstudio/products/vspro/default.aspx) on my laptop. Together, I installed new [MSDN Library](http://msdn.microsoft.com) too. After some minutes of playing with my new tools I noticed a very annoying thing in the new MSDN viewer. Everytime I open the viewer it displays its Start page (or default page, whatever).

[![MSDN Start page still loaded](http://mateusz.loskot.net/gallery/_gallery_albums_store/software/msgn_viewer_start_page_tab_zombie.thumb.jpg)](http://mateusz.loskot.net/gallery/software/msgn_viewer_start_page_tab_zombie) Then, when I select some topic from Content panel on the left it opens in new tab but the previous tab with MSDN Start page still exist, so I have to close it manually. Yes, I said "I have to" because I like to work in clean enviroment without all those useless things around. So, the Start page is annoying, and no discussion about it :-)


So, I decided to get rid of it. First, I tried to find if there are any settings in Tools -> Options which I could adjust to turn off the Start page but unfortunately there aren't any. Or may be I was looking in wrong place? Whatever, I started to find some less clickable way to turn it off. I investigated shortcuts content in the Start Menu as well as what command line parameters I can feed MSDN viewer executable with. By default, it can be found here:

```
C:\\Program Files\\Common Files\\Microsoft Shared\\Help 8\\dexplore.exe
```


The solution is very simple:
	
1. Click with mouse right-button on the **MSDN Library for Visual Studio 2005** shortcut and open Properties dialog box.
2. Go to Target box and you will see following line:
    
```
"C:\\Program Files\\Common Files\\Microsoft Shared\\Help 8\\dexplore.exe" /helpcol ms-help://MS.MSDNQTR.v80.en /LaunchNamedUrlTopic DefaultPage
```
	
3. Remove last switch: **/LaunchNamedUrlTopic DefaultPage**
4. Make sure that Target path looks like this:

```
"C:\\Program Files\\Common Files\\Microsoft Shared\\Help 8\\dexplore.exe" /helpcol ms-help://MS.MSDNQTR.v80.en
```
	
5. Click OK button to close Properties dialog box.

Now, launch MSDN Library for Visual Studio 2005 again using just edited shortcut.
You should see MSDN Library viewer without any page loaded.
