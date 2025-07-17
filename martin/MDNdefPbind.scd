// MDNdefPbind.scd
// MD 20250708 v1.0

// NOW WORKING.
(
Ndef(\dust, { |density = 100|
    Dust.ar([density, density]) * 0.25;
}).play;  // IMPORTANT: must be playing to receive .set
)


(
Pdef(\dense, Pbind(
    \type, \set,             // send a .set message
    \id, Ndef(\dust).nodeID, // target the actual node ID (MUST be running)
    \args, [\density],       //arguments to be set
    \density, Pseq([1, 10, 100, 500], inf).trace,
    \dur, 0.3
)).play;
)
//to stop:
Pdef(\dense).stop; // seems to work as intended


// Apparently Pdef and Ndef are equivalent here
(
Ndef(\dense, Pbind(
    \type, \set,             // send a .set message
    \id, Ndef(\dust).nodeID, // target the actual node ID (MUST be running)
    \args, [\density],       //arguments to be set
    \density, Pseq([1, 10, 100, 500], inf).trace,
    \dur, 0.25
)).play;
)
Ndef(\dense).stop; // but this doesn't work.






/////////// more experimenting:
(
Pdef(\dense, Pbind(
    \type, \set,             // send a .set message
    \id, Ndef(\dust).nodeID, // target the actual node ID (MUST be running)
    \args, [\density],       //arguments to be set
    \density, Pseq([1000, 0], inf).trace,
    \dur, 0.444
)).play;
)
//to stop:
Pdef(\dense).stop; // seems to work as intended
Pdef(\dense).set(\density);

// switch the Ndef:
(
Ndef(\dust, { |density = 100|
    Dust2.ar([density*10, density*10]) * 0.25;
}).play;  // IMPORTANT: must be playing to receive .set
)