---
date: 
title: Oracle XE lightweight setup
description: Notes on how to make Oracle XE on Linux run even lighter
category: code
tags: linux,oracle,database
---

To support my open souce hacking, I use a budget OpenVZ Virtual Private Server from 
[Frantech Solutions](http://buyvm.net/). Despite very decent CPU horsepower I've got there,
I only have access to 512MB/1024MB (burst) of RAM.

Lately, I decided to start regular testing, preferabley continuous, of 
[SOCI](http://soci.sourceforge.net) against Oracle database, so I headed to hunt Oracle 
database hosting, ideally for free.
The only free access to Oracle database I found is Amazon RDS offered as part of AWS Free Usage Tier,
but I'm not very keen to submit for AWS. I don't need anything for production purposes.
I only need to run some basic integration tests.

I decided to try figure out how I can squeeze and run Oracle Express the VPS server I use. I use 
Debian (wheezy) on my server and, while idling, ```free``` hardly ever reports more than 15MB RAM used.

I run Linux 32-bit on the server and here comes the obstacle: Oracle thoughtfully offers Express 
Edition 11g for Linux 64-bit. It's not exactly what I'd consider as being *[committed to offering choice, flexibility, and lower cost of computing for end users](http://www.oracle.com/us/technologies/open-source/index.htm)*.
Thankfully, Oracle still hosts the repository with Debian packages of Oracle Database 10g Express Edition at 
[oss.oracle.com/debian](https://oss.oracle.com/debian). Note, it is not linked at the 
[oss.oracle.com](https://oss.oracle.com/) portal anywhere, strangely, but Web search for 
oracle+debian will reveal it. So, I grabbed .deb packages with ```libaio``` and ```oracle-xe```.

The server runs in OpenVZ container and it does not have a single byte of swap available.
Here comes another obstacle: this server does not meet the minimum requirements of Oracle XE.

Fortunately, installation scripts simply analyse output of ```/usr/bin/free``` program, so it
is easy to work around this problem by plugging in fake ```free``` that will report lots  of swap space.
Axel Reinhold's blogged about what to do if [Oracle XE refuses to install into OpenVZ](http://www.axelog.de/2010/02/7-oracle-ee-refused-to-install-into-openvz/).
Here I paste copy of his script:

```
#!/bin/sh
mv /usr/bin/free /usr/bin/free.orig
cat >/usr/bin/free <<'EOF'
#!/bin/sh
cat <<'__eof'
             total       used       free     shared    buffers     cached
Mem:       1048576     327264     721312          0          0          0
-/+ buffers/cache:     327264     721312
Swap:      2000000          0    2000000
__eof
exit
EOF
chmod 755 /usr/bin/free
exit
```

This simple trick works perfectly and installation completed without any problems:

```
sudo dpkg -i libaio_0.3.104-1_i386.deb
sudo dpkg -i oracle-xe_10.2.0.1-1.1_i386.deb
```

Although, Oracle XE was running well, it would happily consume nearly all the guaranteed
amount of RAM I have available, with lots of Oracle processes running:

```
# ps aux | grep oracle
oracle   14065  0.0  0.5  21652  5864 ?        Ss   22:35   0:00 /usr/lib/oracle/xe/app/oracle/product/10.2.0/server/bin/tnslsnr LISTENER -inherit
oracle   14161  0.0  0.9 370360 10204 ?        Ss   22:36   0:00 xe_pmon_XE
oracle   14163  0.0  0.8 369744  8828 ?        Ss   22:36   0:00 xe_psp0_XE
oracle   14165  0.0  1.7 369744 18132 ?        Ss   22:36   0:00 xe_mman_XE
oracle   14167  0.0  1.1 371812 12048 ?        Ss   22:36   0:00 xe_dbw0_XE
oracle   14169  0.0  2.6 385296 28232 ?        Ss   22:36   0:00 xe_lgwr_XE
oracle   14171  0.0  1.3 369752 14076 ?        Ss   22:36   0:00 xe_ckpt_XE
oracle   14173  0.0  3.9 370276 41392 ?        Ss   22:36   0:00 xe_smon_XE
oracle   14175  0.0  1.3 369744 14064 ?        Ss   22:36   0:00 xe_reco_XE
oracle   14177  0.0  1.9 371340 20476 ?        Ss   22:36   0:00 xe_cjq0_XE
oracle   14179  0.0  4.0 372488 42588 ?        Ss   22:36   0:00 xe_mmon_XE
oracle   14181  0.0  1.0 369744 10892 ?        Ss   22:36   0:00 xe_mmnl_XE
oracle   14183  0.0  0.8 370408  8960 ?        Ss   22:36   0:00 xe_d000_XE
oracle   14185  0.0  0.8 370356  8628 ?        Ss   22:36   0:00 xe_s000_XE
oracle   14187  0.0  0.8 370356  8632 ?        Ss   22:36   0:00 xe_s001_XE
oracle   14189  0.0  0.8 370356  8624 ?        Ss   22:36   0:00 xe_s002_XE
oracle   14191  0.0  0.8 370356  8632 ?        Ss   22:36   0:00 xe_s003_XE
oracle   14196  0.0  0.9 369744  9968 ?        Ss   22:36   0:00 xe_qmnc_XE
oracle   14223  0.0  1.0 369740 10992 ?        Ss   22:36   0:00 xe_q000_XE
oracle   14225  0.0  0.8 369740  9288 ?        Ss   22:36   0:00 xe_q001_XE
```

So, I asked on OTN forums
[how to make it as lightweight](https://forums.oracle.com/forums/message.jspa?messageID=10865958) 
as poossible. It turned out it's quite possible.

First, I cut down number of processes and I switch off every thing wasn't going to use like the Apex 
application server serving the Web administration software, I also shut down job queue
and advanced queueing:

```
alter system reset dispatchers scope=spfile sid='*';
alter system reset shared_servers scope=spfile sid='*';
alter system set job_queue_processes=0 scope=both;
alter system set aq_tm_processes=0 scope=both;
```

It doesn't hurt to disable the shared server access completely:

```
exec dbms_xdb.setlistenerlocalaccess(FALSE);
exec dbms_xdb.sethttpport(0);
```


Next, I tweaked [SGA](http://en.wikipedia.org/wiki/System_Global_Area) setting to lower size of shared 
memory available to Oracle processes and [PGA](http://en.wikipedia.org/wiki/Program_Global_Area) 
to minimise memory usage of Oracle XE instance. Here are my settings:

```
alter system set sga_taget=256M scope=both sid='*';
alter system set pga_aggregate_target=100M scope=both sid='*';
```

Perhaps I could lower it even more, but these settings proved to make Oracle use less than 350MB
most of the itme. It works for me.

I restarted Oracle XE and the number of processes was cut to by half:

```
oracle    3404  0.0  0.5  21652  5840 ?        Ss   21:14   0:00 /usr/lib/oracle/xe/app/oracle/product/10.2.0/server/bin/tnslsnr LISTENER -inherit
oracle    3409  0.0  0.9 345784 10132 ?        Ss   21:14   0:00 xe_pmon_XE
oracle    3411  0.0  0.8 345168  8824 ?        Ss   21:14   0:00 xe_psp0_XE
oracle    3413  0.0  1.2 345168 13332 ?        Ss   21:14   0:00 xe_mman_XE
oracle    3415  0.0  1.0 347236 11404 ?        Ss   21:14   0:00 xe_dbw0_XE
oracle    3417  0.0  2.6 360720 28240 ?        Ss   21:14   0:00 xe_lgwr_XE
oracle    3419  0.0  1.3 345176 13868 ?        Ss   21:14   0:00 xe_ckpt_XE
oracle    3421  0.0  3.8 345704 40804 ?        Ss   21:14   0:00 xe_smon_XE
oracle    3423  0.0  1.3 345168 14040 ?        Ss   21:14   0:00 xe_reco_XE
oracle    3425  0.1  3.8 346896 40404 ?        Ss   21:14   0:00 xe_mmon_XE
oracle    3427  0.0  1.2 345168 13464 ?        Ss   21:14   0:00 xe_mmnl_XE
```

I started running my tests connecting to Oracle XE instance locally and remotely,
and I noticed the following error thrown at random points of testing:

```
ORA-12520: TNS:listener could not find available handler for requested type of server
```

It turns out that the default max number of sessions is not enough for my tests,
so I bumped it to 80

```
alter system set processes=80 scope=spfile;
shutdown immediate;
startup;
```

Here is processes setting summary:

```
SQL> show parameter processes;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
aq_tm_processes                      integer     0
db_writer_processes                  integer     1
gcs_server_processes                 integer     0
job_queue_processes                  integer     0
log_archive_max_processes            integer     2
processes                            integer     80

SQL> select * from v$resource_limit where resource_name in ('processes','sessions');

RESOURCE_NAME                  CURRENT_UTILIZATION MAX_UTILIZATION INITIAL_AL
------------------------------ ------------------- --------------- ----------
LIMIT_VALU
----------
processes                                       21              24         40
        40

sessions                                        28              30         49
```

After these tweaks, the Oracle XE instance does not consume all RAM resources of my server
and is still usable for my testing purposes.
