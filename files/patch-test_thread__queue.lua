--- test/thread_queue.lua.orig	2016-01-19 20:06:09 UTC
+++ test/thread_queue.lua
@@ -24,7 +24,7 @@ if not apr.thread_queue then
   return false
 end
 
-local child = assert(apr.proc_create 'lua')
+local child = assert(apr.proc_create 'lua51')
 assert(child:cmdtype_set 'shellcmd/env')
 assert(child:exec { helpers.scriptpath 'thread_queue-child.lua' })
 local dead, reason, code = assert(child:wait(true))
