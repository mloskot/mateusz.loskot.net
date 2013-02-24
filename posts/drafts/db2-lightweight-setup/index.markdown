---
date: 
title: DB2 lightweight setup
description: Notes on how to make DB2 Express-C on Linux run even lighter
category: code
tags: db2,database,linux
---

Debian, 32-bit

```
db2_v1012_linuxia32_expc_lite.tar.gz
```

```
# db2precheckreq
Validating "/lib/libpam.so*" ...
   DBT3514W  The db2prereqcheck utility failed to find the following 32-bit library file: "/lib/libpam.so*".
   WARNING : Requirement not matched.
Requirement not matched for DB2 database "Server" "". Version: "10.1.0.0".
Summary of prerequisites that are not met on the current system:
   DBT3514W  The db2prereqcheck utility failed to find the following 32-bit library file: "/lib/libpam.so*".

# locate libpam.so
/lib/i386-linux-gnu/libpam.so.0
/lib/i386-linux-gnu/libpam.so.0.83.0
# ln -s /lib/i386-linux-gnu/libpam.so.0 /lib/libpam.so

# ./db2prereqcheck

==========================================================================

Checking DB2 prerequisites for DB2 database version "10.1.0.2" on operating system "Linux"

Validating "kernel level " ...
   Required minimum operating system kernel level: "2.6.16".
   Actual operating system kernel level: "2.6.32".
   Requirement matched.

Validating "C++ Library version " ...
   Required minimum C++ library: "libstdc++.so.6"
   Standard C++ library is located in the following directory: "/usr/lib/i386-linux-gnu/libstdc++.so.6.0.17".
   Actual C++ library: "CXXABI_1.3.1"
   Requirement matched.

Validating "/lib/libpam.so*" ...
   Requirement matched.
DBT3533I  The db2prereqcheck utility has confirmed that all installation prerequisites were met for DB2 database "server " "".  Version: "10.1.0.2".

==========================================================================

Checking DB2 prerequisites for DB2 database version "10.1.0.0" on operating system "Linux"

Validating "kernel level " ...
   Required minimum operating system kernel level: "2.6.16".
   Actual operating system kernel level: "2.6.32".
   Requirement matched.

Validating "C++ Library version " ...
   Required minimum C++ library: "libstdc++.so.6"
   Standard C++ library is located in the following directory: "/usr/lib/i386-linux-gnu/libstdc++.so.6.0.17".
   Actual C++ library: "CXXABI_1.3.1"
   Requirement matched.

Validating "/lib/libpam.so*" ...
   Requirement matched.
DBT3533I  The db2prereqcheck utility has confirmed that all installation prerequisites were met for DB2 database "server " "".  Version: "10.1.0.0".
DBT3555E  The db2prereqcheck utility determined that the current platform is not supported by the following version of DB2 database: "9.8.0.4".
DBT3555E  The db2prereqcheck utility determined that the current platform is not supported by the following version of DB2 database: "9.8.0.3".
DBT3555E  The db2prereqcheck utility determined that the current platform is not supported by the following version of DB2 database: "9.8.0.2".
```

```
root@brzuchol:/home/mloskot/software/ibm/db2/db2_v101fp2/linuxia32/s121127/expc_lite# ./db2setup -r /home/mloskot/software/ibm/db2/brzuchol/brzuchol_db2expc.rsp
DBI1191I  db2setup is installing and configuring DB2 according to the
      response file provided. Please wait.


DB2 installation is being initialized.

 Total number of tasks to be performed: 31
Total estimated time for all tasks to be performed: 1162 second(s)

Task #1 start
Description: Checking license agreement acceptance
Estimated time 1 second(s)
Task #1 end

Task #2 start
Description: Base Client Support for installation with root privileges
Estimated time 3 second(s)
Task #2 end

Task #3 start
Description: Product Messages - English
Estimated time 13 second(s)
Task #3 end

Task #4 start
Description: Base client support
Estimated time 127 second(s)
Task #4 end

Task #5 start
Description: Java Runtime Support
Estimated time 127 second(s)
Task #5 end

Task #6 start
Description: Java Help (HTML) - English
Estimated time 7 second(s)
Task #6 end

Task #7 start
Description: Base server support for installation with root privileges
Estimated time 8 second(s)
Task #7 end

Task #8 start
Description: Global Secure ToolKit
Estimated time 30 second(s)
Task #8 end

Task #9 start
Description: Java support
Estimated time 12 second(s)
Task #9 end

Task #10 start
Description: SQL procedures
Estimated time 3 second(s)
Task #10 end

Task #11 start
Description: ICU Utilities
Estimated time 60 second(s)
Task #11 end

Task #12 start
Description: Java Common files
Estimated time 18 second(s)
Task #12 end

Task #13 start
Description: Base server support
Estimated time 316 second(s)
Task #13 end

Task #14 start
Description: Communication support - TCP/IP
Estimated time 3 second(s)
Task #14 end

Task #15 start
Description: EnterpriseDB code
Estimated time 4 second(s)
Task #15 end

Task #16 start
Description: Command Line Processor Plus
Estimated time 6 second(s)
Task #16 end

Task #17 start
Description: DB2 data source support
Estimated time 6 second(s)
Task #17 end

Task #18 start
Description: Base application development tools
Estimated time 34 second(s)
Task #18 end

Task #19 start
Description: Product Signature for DB2 Express-C
Estimated time 3 second(s)
Task #19 end

Task #20 start
Description: Sample database source
Estimated time 4 second(s)
Task #20 end

Task #21 start
Description: Setting DB2 library path
Estimated time 180 second(s)
Task #21 end

Task #22 start
Description: Executing control tasks
Estimated time 20 second(s)
Task #22 end

Task #23 start
Description: Updating global registry
Estimated time 20 second(s)
Task #23 end

Task #24 start
Description: Starting DB2 Fault Monitor
Estimated time 10 second(s)
Task #24 end

Task #25 start
Description: Updating the db2ls link
Estimated time 1 second(s)
Task #25 end

Task #26 start
Description: Registering DB2 licenses
Estimated time 5 second(s)
Task #26 end

Task #27 start
Description: Setting default global profile registry variables
Estimated time 1 second(s)
Task #27 end

Task #28 start
Description: Creating the DB2 Administration Server
Estimated time 9 second(s)
Task #28 end

Task #29 start
Description: Initializing instance list
Estimated time 5 second(s)
Task #29 end

Task #30 start
Description: Configuring DB2 instances
Estimated time 300 second(s)
Task #30 end

Task #31 start
Description: Configuring the DB2 Administration Server
Estimated time 3 second(s)
Task #31 end

Task #32 start
Description: Updating global profile registry
Estimated time 3 second(s)
Task #32 end

The execution completed successfully.

For more information see the DB2 installation log at "/tmp/db2setup.log".
root@brzuchol:/home/mloskot/software/ibm/db2/db2_v101fp2/linuxia32/s121127/expc_lite#
```

```
# su - db2inst1
$ whoami
db2inst1
$ db2stop
db2stop: error while loading shared libraries: /opt/ibm/db2/V10.1/lib32/libdb2e.so.1: cannot make segment writable for relocation: Cannot allocate memory
$ db2start
db2start: error while loading shared libraries: /opt/ibm/db2/V10.1/lib32/libdb2e.so.1: cannot make segment writable for relocation: Cannot allocate memory
$ exit
# free -h
             total       used       free     shared    buffers     cached
Mem:          1.0G       927M        96M         0B         0B         0B
-/+ buffers/cache:       927M        96M
Swap:           0B         0B         0B
# /etc/init.d/oracle-xe stop
Shutting down Oracle Database 10g Express Edition Instance.
Stopping Oracle Net Listener.

# free -h
             total       used       free     shared    buffers     cached
Mem:          1.0G       613M       410M         0B         0B         0B
-/+ buffers/cache:       613M       410M
Swap:           0B         0B         0B
# su - db2inst1
$ db2stop
SQL1064N  DB2STOP processing was successful.
$ db2start
SQL1063N  DB2START processing was successful.
$
```



http://bitsofinfo.wordpress.com/2009/09/11/installing-db2-9-express-c-on-a-headless-ubuntu-box-with-db2setup-and-a-response-file/

response file keywords reference
http://pic.dhe.ibm.com/infocenter/db2luw/v10r1/index.jsp?topic=%2Fcom.ibm.db2.luw.qb.server.doc%2Fdoc%2Fr0060066.html