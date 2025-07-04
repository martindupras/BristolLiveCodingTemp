//serverStuff.scd
Server.killAll; // kill connection to remote server if there was still one.
Server.default = Server.local;

// set to local server. Does this work?
s = Server.new();
s.boot;

().play;


Server.local;
Server.internal;
Server.remote;
Server.default;
Server.allRunningServers;
