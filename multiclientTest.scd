// multiclientTest.scd  hemiketal/bgola
// with much help from hemiketal and bgola on Discord/Supercollider

// 20250630:14:58 I have just run this code with Server on my macbook pro, and the client on windows laptop and it worked. It was fragile though and it took a few goes so document the actual order of things and start afresh every time to leave less to go wrong.

// 20250630:16:00 I have run this with two macs and everything works. Windows is a bastard.

/*
    Run this on SERVER machine;  eventually find if we can narrow a bit from 0.0.0.0
*/
().play; // test first to see if local server booted ok

s.options.bindAddress ="0.0.0.0"; //accept from anywhere
s.options.protocol = \tcp;
s.options.maxLogins = 2;
s.reboot;





/*
   Run this on CLIENT machine

   Make sure to replace 192.168.178.189 by correct IP. It *may* change.
*/


(
o = ServerOptions.new;
o.maxLogins = 8;
o.protocol_(\tcp);
t = Server.remote(\remote, NetAddr("192.168.178.189", 57110), o); // set to correct address and port
t.addr.connect;
t.startAliveThread( 0 );
t.doWhenBooted({ "remote tcp server started".postln; t.notify; t.initTree });

// this bit was critical:
Server.default = t

//bgola says: if you don't set the server default, you need to specify the server you want the synth to play.

//for example ().play will use Server.default unless you say (server:t).play

)


// Test that it all works.
d = { SinOsc.ar(166) * 0.1 ! 2 }; // store function in d
e = d.play; // play e, which can be freed, unlike d.
e.free;

().play;



Ndef(\sine, {SinOsc.ar([234,345],0,0.1)})
Ndef(\sine).play;
Ndef(\sine).stop;






// NOT NEEDED: this was just a slightly different version to test things.
(
o = ServerOptions.new;
o.maxLogins = 8;
o.protocol_(\tcp);
s = Server.remote(\remoteEss, NetAddr("192.168.178.189", 57110), o); // set to correct address and port
s.addr.connect;
s.startAliveThread( 0 );
s.doWhenBooted({ "remote tcp server started".postln; s.notify; s.initTree });

// this bit was critical:
Server.default = s

//bgola says: if you don't set the server default, you need to specify the server you want the synth to play.

//for example ().play will use Server.default unless you say (server:t).play

)