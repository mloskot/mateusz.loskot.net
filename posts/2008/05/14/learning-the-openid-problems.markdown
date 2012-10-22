---
comments: true
date: 2008-05-14 12:09:48
layout: post
slug: learning-the-openid-problems
title: Learning the OpenID problems
wordpressid: 246
categories: none
tags: authentication,availability,online,openid,privacy,security,services,trust
---

![OpenID logo](/images/logos/openid-logo.png)Continuing [my recent discussion](/2008/05/11/openid-conquers-communities/) about [OpenID](http://openid.net/) and considering OpenID usage for authenticating to [OSGeo services](http://wiki.osgeo.org/wiki/OpenID), I wanted to make a short review of its disadvantages. The OpenID advantages are [well-known](http://en.wikipedia.org/wiki/OpenID) and can be described with a short statement:



> open, decentralized, free framework, which allows Internet users to control their [digital life](http://en.wikipedia.org/wiki/Digital_identity) with single identity








[Stefan Brand](http://idcorner.org) collected number of opinions about OpenID and compiled a very interesting post on his blog about [problem(s) with OpenID](http://idcorner.org/2007/08/22/the-problems-with-openid/). Stefan's blog entry is pretty long, so to understand his findings easier, I decided to abstract key thoughts on that matter.





Stefan summarized main problems and sources of OpenID criticism as follows: 



> OpenID is highly vulnerable to phishing and other attacks, creates insurmountable privacy problems, is not a trust system, suffers from usability problems, and makes it unappealing to become an OpenID consumer.



Next, complaints about the OpenID framework are presented in a few categories, which I'm going to summarize below.





The most serious complaint is about lack of security and vulnerability on [phishing attacks](http://en.wikipedia.org/wiki/Phishing) as well as browser exploits based on [XSS](http://en.wikipedia.org/wiki/Cross-site_scripting) and [CSRF](http://en.wikipedia.org/wiki/Cross-site_request_forgery). Another problem was pointed by [Kim Cameron](http://www.identityblog.com/?p=685): OpenID is as strong, and as weak, as DNS. It's also easy to imagine user's computer attacked with [trojan](http://en.wikipedia.org/wiki/Trojan_horse_%28computing%29) or [key logger](http://en.wikipedia.org/wiki/Keystroke_logging) sniffing her OpenID password. It could eventuate in giving attacker access to [all identities](http://en.wikipedia.org/wiki/Online_identity) controlled by user's OpenID.





These insights let to consider OpenID as a _broken authentication_, though: 



> This is fine if what you protect with your OpenID is worthless, but it seems clear that these types of protocol are going to be used to authenticate for things of value.








The privacy issue is next. [OpenID providers](http://wiki.openid.net/Reputation#Terminology) do recycle unused or orphaned user IDs and 



> if an OpenID is recycled, the new owner will be able to access the previous owner'sâ data if the [RP](http://wiki.openid.net/Reputation#Terminology) is not aware that the OpenID has changed ownership.



Some users find problematic or unethical fact that [OpenID] identity provider is able to track all websites you log into. The tracking capability may be used for purposes like users profiling and cross-sites profiling - sounds like a _big brother_ reality.





OpenID is very easy to use, also for unexperienced Internet users. However, OpenID use requires more client-side intelligence than today's standard Web browser. These two seems to stay in contradiction.





A good privacy on the Internet means: untraceability, unlinkability, authenticated anonymity and pseudonymity, and minimal disclosure. However, OpenID's simplistic URL architecture seems fundamentally incompatible with these privacy features.





What about [trust](http://en.wikipedia.org/wiki/Trusted_system)? OpenID is supposed to play a role of an identity system. In common understanding, an identity system is based on trust. There is no authority that can promise OpenID [mloskot.myopenid.com](http://mloskot.myopenid.com/) is Mateusz Ĺoskot. The implication is The OpenID is not a trust system but OpenID is an identity transport system but without trust. Why? Because no trust, no identity.





Usability and adoption also seems to be questionable. Some experts prove that OpenID can be easily replaced with [password managers](http://en.wikipedia.org/wiki/Password_manager) available in popular Web browsers. Another issue is selection of trusted OpenID provider and the fact that there are many providers, but still not enough sites and consumers.





An interesting and realistic issue is availability of OpenID services. The decentralization, an OpenID's strength is also considered as its weakness: If your openID server goes down then youâre locked out of all of your other web accounts that used that login.



Patents. It seems possible that some aspects of OpenID patented and parties have made claims that OpenID is covered by their patents.





As a word of disclaimer, I'm not the author of the concerns presented above and this is not my aim to criticise the concept of OpenID system. I'm just a member of Internet users hordes who is interested in OpenID applications. All the comments above helped me to understand OpenID better, so I collected and rewritten them here in more adoptive, I believe.





Authors of all citations I used above can be easily find in [Stefan's blog post](http://www.idcorner.org/?p=161).
