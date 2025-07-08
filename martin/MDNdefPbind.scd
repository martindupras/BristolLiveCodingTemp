// MDNdefPbind.scd
// MD 20250708

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
Pdef(\dense).stop;


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
Ndef(\dense).stop;
