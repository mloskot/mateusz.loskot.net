---
date: 
title: Oracle XE lightweight setup
description: Notes on how to make Oracle XE on Linux run even lighter
category: code
tags: oracle,database,linux
---

```
exec DBMS_XDB.setLISTENERLOCALACCESS(FALSE);
exec DBMS_XDB.setHTTPPORT(0);
alter system reset dispatchers scope=spfile sid='*';
alter system reset shared_servers scope=spfile sid='*';
alter system set job_queue_processes=0 scope=both;
alter system set aq_tm_processes=0 scope=both;
alter system set SGA_TARGET=256M SCOPE=BOTH sid='*';
alter system set pga_aggregate_target=100M SCOPE=BOTH sid='*';
```

```
SELECT
  'Currently, '
    || (SELECT COUNT(*) FROM V$SESSION)
      || ' out of '
        || DECODE(VL.SESSIONS_MAX,0,'unlimited',VL.SESSIONS_MAX)
          || ' connections are used.' AS USAGE_MESSAGE FROM  V$LICENSE VL;
```

```
mloskot bin $ ./soci_oracle_test_static "service=XE user=soci_tester password=soci_secret"

SOCI Common Tests:

test 0 passed
test 1 passed
test 2 passed
test 3 passed
test 4 passed
test 5 passed
test 6 passed
test 7 passed
test 8 passed
test 9 passed
test 10 passed
test 11 passed
test 12 passed
test 13 passed
test 14 passed
test 15 passed
test 16 passed
test 17 passed
test 18 passed
test 19 passed
test 20 passed
test 21 passed
test 22 passed
test 23 passed
test 24 passed
test 25 passed
ORA-12520: TNS:listener could not find available handler for requested type of server

mloskot bin $


mloskot bin $ ./soci_oracle_test_static "service=XE user=soci_tester password=soci_secret"

SOCI Common Tests:

test 0 passed
test 1 passed
test 2 passed
test 3 passed
test 4 passed
test 5 passed
test 6 passed
test 7 passed
test 8 passed
test 9 passed
test 10 passed
test 11 passed
test 12 passed
test 13 passed
test 14 passed
test 15 passed
test 16 passed
test 17 passed
test 18 passed
test 19 passed
test 20 passed
ORA-12520: TNS:listener could not find available handler for requested type of server

mloskot bin $


mloskot bin $ ./soci_oracle_test_static "service=XE user=soci_tester password=soci_secret"

SOCI Common Tests:

test 0 passed
test 1 passed
test 2 passed
test 3 passed
test 4 passed
test 5 passed
test 6 passed
test 7 passed
test 8 passed
test 9 passed
test 10 passed
test 11 passed
test 12 passed
test 13 passed
test 14 passed
test 15 passed
test 16 passed
test 17 passed
test 18 passed
test 19 passed
test 20 passed
test 21 passed
test 22 passed
test 23 passed
test 24 passed
test 25 passed
test 26 passed
ORA-12520: TNS:listener could not find available handler for requested type of server

mloskot bin $ ./soci_oracle_test_static "service=XE user=soci_tester password=soci_secret"

SOCI Common Tests:

test 0 passed
test 1 passed
test 2 passed
test 3 passed
test 4 passed
test 5 passed
test 6 passed
test 7 passed
test 8 passed
test 9 passed
test 10 passed
test 11 passed
test 12 passed
test 13 passed
test 14 passed
test 15 passed
test 16 passed
test 17 passed
test 18 passed
test 19 passed
test 20 passed
test 21 passed
test 22 passed
test 23 passed
test 24 passed
ORA-12520: TNS:listener could not find available handler for requested type of server

mloskot bin $
```


```
SQL>  select * from v$resource_limit where resource_name in ('processes','sessions');

RESOURCE_NAME                  CURRENT_UTILIZATION MAX_UTILIZATION INITIAL_AL
------------------------------ ------------------- --------------- ----------
LIMIT_VALU
----------
processes                                       21              24         40
        40

sessions                                        28              30         49
```

```
alter system set processes=80 scope=spfile;
shutdown immediate;
startup;
show parameter processes;
```

[ora12541]:http://www.orafaq.com/wiki/ORA-12541
[tns12541]:http://juststuffreally.blogspot.co.uk/2008/06/tnsno-listener-error-proves-no-match.html
[ora12520]:http://oracle-dba-yi.blogspot.co.uk/2011/11/ora-12520-tnslistener-could-not-find.html