--- test/shm.lua.orig	2016-01-19 20:03:57 UTC
+++ test/shm.lua
@@ -36,7 +36,7 @@ local shm_file = assert(apr.shm_create(s
 assert(tostring(shm_file):find '^shared memory %([0x%x]+%)$')
 
 -- Launch child process.
-local child = assert(apr.proc_create('lua'))
+local child = assert(apr.proc_create('lua51'))
 assert(child:cmdtype_set 'shellcmd/env')
 assert(child:exec { helpers.scriptpath 'shm-child.lua', shm_path, tmp_path })
 assert(child:wait(true))
