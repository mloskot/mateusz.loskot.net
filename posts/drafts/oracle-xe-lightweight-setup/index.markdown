---
date: 
title: Oracle XE lightweight setup
description: Notes on how to make Oracle XE on Linux run even lighter
category: code
tags: oracle,database,linux
---

```
EXEC DBMS_XDB.SETHTTPPORT(0);
ALTER SYSTEM RESET dispatchers scope=spfile sid='*';
ALTER SYSTEM RESET shared_servers scope=spfile sid='*';
ALTER SYSTEM SET job_queue_processes=0 scope=both;
ALTER SYSTEM SET aq_tm_processes=0 scope=both;
ALTER SYSTEM SET SGA_TARGET=256M SCOPE=BOTH sid='*';
ALTER SYSTEM SET pga_aggregate_target=100M SCOPE=BOTH sid='*';
```

```
SELECT
  'Currently, '
    || (SELECT COUNT(*) FROM V$SESSION)
      || ' out of '
        || DECODE(VL.SESSIONS_MAX,0,'unlimited',VL.SESSIONS_MAX)
          || ' connections are used.' AS USAGE_MESSAGE FROM  V$LICENSE VL;
```

[ora12541]:http://www.orafaq.com/wiki/ORA-12541
[tns12541]:http://juststuffreally.blogspot.co.uk/2008/06/tnsno-listener-error-proves-no-match.html
