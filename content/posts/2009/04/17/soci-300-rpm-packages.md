---
date: 2009-04-17 00:29:04
slug: soci-300-rpm-packages
title: SOCI 3.0.0 RPM Packages
categories: none
---

[Denis Arnaud](http://denisarnaud.fedorapeople.org/) prepared RPM packages for [SOCI library version 3.0.0](http://soci.sourceforge.net/). As Denis [explains](http://sourceforge.net/mailarchive/message.php?msg_name=b4f0e550904161501j44d93780qf653f8ebf53870f5%40mail.gmail.com), these RPM packages primarily target Fedora family, but should work on other [RPM-based distributions](http://en.wikipedia.org/wiki/Category:RPM-based_Linux_distributions).





Currently, SOCI 3.0.0 RPM packages are available to [download](https://sourceforge.net/project/showfiles.php?group_id=252803&package_id=315908&release_id=675658) from [Open Travel Request Parser](http://sourceforge.net/projects/opentrep) project website. By the way, I've revealed [Open Travel Request Parser](http://sourceforge.net/projects/opentrep) uses SOCI, it's really nice.





[SOCI](http://soci.sourceforge.net/) _is a database access library for C++ that makes the illusion of embedding SQL queries in the regular C++ code, staying entirely within the Standard C++._ It also fits very well to the world of templates defined in [C++ Standard Library](http://en.wikipedia.org/wiki/C%2B%2B_standard_library) and offers extensive integration with data types from [Boost C++ Libraries](http://www.boost.org/) like [optional, tuple and fusion](http://www.boost.org/doc/libs):




    
    Rowset<std ::string> rs = (sql.prepare << "select name from persons");
    std::copy(rs.begin(), rs.end(), std::ostream_iterator<string>(cout, "\n"));





Not to mention the _coolness_ of flexible support for [user-defined types](http://soci.sourceforge.net/doc/exchange.html).
