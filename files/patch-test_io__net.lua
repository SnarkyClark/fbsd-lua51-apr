--- test/io_net.lua.orig	2011-12-07 22:02:02 UTC
+++ test/io_net.lua
@@ -29,7 +29,7 @@ if not rdns_ok then
 end
 
 -- Test socket:bind(), socket:listen() and socket:accept(). {{{1
-local server = assert(apr.proc_create 'lua')
+local server = assert(apr.proc_create 'lua51')
 local port = math.random(10000, 50000)
 local signalfile = helpers.tmpname()
 local scriptfile = helpers.scriptpath 'io_net-server.lua'
