// on machine running the server
(
s.options.protocol = \tcp; // set to use tcp
s.options.bindAddress = "0.0.0.0"; // allow connections from any address
s.options.maxLogins = 2; // set to correct number of clients
s.boot;
)

().play;




// on remote machine connecting to server
(
o = ServerOptions.new;
o.protocol_(\tcp);
t = Server.remote(\remote, NetAddr("192.168.0.130", 57110), o); // set to correct address and port
t.addr.connect;
t.startAliveThread( 0 );
t.doWhenBooted({ "remote tcp server started".postln; t.notify; t.initTree });
)