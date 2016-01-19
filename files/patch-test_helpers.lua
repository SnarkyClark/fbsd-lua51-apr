--- test/helpers.lua.orig	2016-01-19 19:44:19 UTC
+++ test/helpers.lua
@@ -93,22 +93,7 @@ end
 
 function helpers.ld_preload_trick(script) -- {{{1
 
-  -- XXX This hack is needed to make the tests pass on Ubuntu 10.04 and probably
-  -- also other versions of Ubuntu and Debian? The Lua/APR documentation for the
-  -- DBD module contains some notes about this, here's a direct link:
-  -- http://peterodding.com/code/lua/apr/docs/#debugging_dso_load_failed_errors
-
-  -- Include the libapr-1.so and libaprutil-1.so libraries in $LD_PRELOAD if
-  -- they exist in the usual Debian location.
-  local libs = apr.filepath_list_split(apr.env_get 'LD_PRELOAD' or '')
-  for _, libname in ipairs { '/usr/lib/libapr-1.so.0', '/usr/lib/libaprutil-1.so.0' } do
-    if apr.stat(libname, 'type') == 'file' then table.insert(libs, libname) end
-  end
-  apr.env_set('LD_PRELOAD', apr.filepath_list_merge(libs))
-
-  -- Now run the test in a child process where $LD_PRELOAD applies.
-  local child = assert(apr.proc_create 'lua')
-  assert(child:cmdtype_set 'shellcmd/env')
+  local child = assert(apr.proc_create 'lua51')
   assert(child:exec { helpers.scriptpath(script) })
   local dead, reason, code = assert(child:wait(true))
   return reason == 'exit' and code == 0
