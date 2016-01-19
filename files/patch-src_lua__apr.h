--- src/lua_apr.h.orig	2011-12-07 22:02:02 UTC
+++ src/lua_apr.h
@@ -227,7 +227,6 @@ extern lua_apr_objtype lua_apr_queue_typ
 extern lua_apr_objtype lua_apr_pollset_type;
 extern lua_apr_objtype lua_apr_proc_type;
 extern lua_apr_objtype lua_apr_shm_type;
-extern lua_apr_objtype lua_apr_dbm_type;
 extern lua_apr_objtype lua_apr_dbd_type;
 extern lua_apr_objtype lua_apr_dbr_type;
 extern lua_apr_objtype lua_apr_dbp_type;
@@ -280,10 +279,6 @@ int lua_apr_date_parse_rfc(lua_State*);
 /* dbd.c */
 int lua_apr_dbd(lua_State*);
 
-/* dbm.c */
-int lua_apr_dbm_open(lua_State*);
-int lua_apr_dbm_getnames(lua_State*);
-
 /* env.c */
 int lua_apr_env_get(lua_State*);
 int lua_apr_env_set(lua_State*);
