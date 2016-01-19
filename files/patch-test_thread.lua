--- test/thread.lua.orig	2016-01-19 20:04:52 UTC
+++ test/thread.lua
@@ -24,7 +24,7 @@ if not apr.thread then
   return false
 end
 
-local child = assert(apr.proc_create 'lua')
+local child = assert(apr.proc_create 'lua51')
 assert(child:cmdtype_set 'shellcmd/env')
 assert(child:exec { helpers.scriptpath 'thread-child.lua' })
 local dead, reason, code = assert(child:wait(true))
