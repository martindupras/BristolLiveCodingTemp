// Options that need to run to allow connections from other computers, e.g. Guy's

s.options.bindAddress ="0.0.0.0"; //accept from anywhere
s.options.protocol = \tcp;
s.options.maxLogins = 2;
s.reboot;

().play;


Ndef(\dust, {Dust.ar([500,500])*0.3})
Ndef(\dust).play;
Ndef(\dust).stop;


Ndef(\sine, {SinOsc.ar([234,345],0,0.1)})
Ndef(\sine).play;
Ndef(\sine).stop;
