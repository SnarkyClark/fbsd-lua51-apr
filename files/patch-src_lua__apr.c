--- src/lua_apr.c.orig	2011-12-07 22:02:02 UTC
+++ src/lua_apr.c
@@ -14,6 +14,8 @@
 #include <apreq_version.h>
 #endif
 
+#include <dlfcn.h>
+
 /* Used to make sure that APR is only initialized once. */
 static int apr_was_initialized = 0;
 
@@ -28,7 +30,6 @@ lua_apr_objtype *lua_apr_types[] = {
 # endif
   &lua_apr_pollset_type,
   &lua_apr_proc_type,
-  &lua_apr_dbm_type,
   &lua_apr_dbd_type,
   &lua_apr_dbr_type,
   &lua_apr_dbp_type,
@@ -81,10 +82,6 @@ LUA_APR_EXPORT int luaopen_apr_core(lua_
     /* dbd.c -- database module. */
     { "dbd", lua_apr_dbd },
 
-    /* dbm.c -- dbm routines. */
-    { "dbm_open", lua_apr_dbm_open },
-    { "dbm_getnames", lua_apr_dbm_getnames },
-
     /* env.c -- environment variable handling. */
     { "env_get", lua_apr_env_get },
     { "env_set", lua_apr_env_set },
@@ -237,6 +234,13 @@ LUA_APR_EXPORT int luaopen_apr_core(lua_
 
   /* Initialize the library (only once per process). */
   if (!apr_was_initialized) {
+
+    /* Fix for http://peterodding.com/code/lua/apr/docs/#debugging_dso_load_failed_errors */    
+    void *dl = dlopen("libapr-1.so", RTLD_NOW | RTLD_GLOBAL | RTLD_NOLOAD);
+    if (dl) dlclose(dl);
+    dl = dlopen("libaprutil-1.so", RTLD_NOW | RTLD_GLOBAL | RTLD_NOLOAD);
+    if (dl) dlclose(dl);
+
     if ((status = apr_initialize()) != APR_SUCCESS)
       raise_error_status(L, status);
     if (atexit(apr_terminate) != 0)
