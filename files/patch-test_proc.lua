--- test/proc.lua.orig	2016-01-19 19:55:02 UTC
+++ test/proc.lua
@@ -17,7 +17,7 @@ end
 local helpers = require 'apr.test.helpers'
 
 local function newchild(cmdtype, script, env)
-  local child = assert(apr.proc_create 'lua')
+  local child = assert(apr.proc_create 'lua51')
   assert(child:cmdtype_set(cmdtype))
   if env then child:env_set(env) end
   assert(child:io_set('child-block', 'parent-block', 'parent-block'))
@@ -67,7 +67,7 @@ local namedpipe = helpers.tmpname()
 local namedmsg = "Hello world over a named pipe!"
 local status, errmsg, errcode = apr.namedpipe_create(namedpipe)
 if errcode ~= 'ENOTIMPL' then
-  local child = assert(apr.proc_create 'lua')
+  local child = assert(apr.proc_create 'lua51')
   assert(child:cmdtype_set('shellcmd/env'))
   assert(child:exec { helpers.scriptpath 'io_file-named_pipe.lua', namedpipe, namedmsg })
   local handle = assert(apr.file_open(namedpipe, 'r'))
