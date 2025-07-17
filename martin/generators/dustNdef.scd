(
Ndef(\dust, { |density = 100|
    Dust.ar([density, density]) * 0.25;
}).play;  // IMPORTANT: must be playing to receive .set
)


(
Pdef(\dense, Pbind(
    \type, \set,           // Send a .set message, not a new synth
    \id, Ndef(\dust).nodeID, // Target the actual node ID (MUST be running)
    \args, [\density],     // Explicitly declare which args you're setting
    \density, Pseq([1, 10, 100, 500], inf).trace,
    \dur, 1
)).play;
)
