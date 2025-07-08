// MDpatterns.scd
// MD 20250708
//
// trying to make sense of how to start/stop/pause/clear, etc
// trying to make sense of useful pattersn to me
// trying to make sense of how to apply them to parameters other than note events.


/* A note on streams

"A stream represents a sequence of values obtained incrementally by repeated *next* messages."

*/

//---
// SEE HOW A PATTERN WILL OUTPUT
p = Pseq([60, 72, 71, 67, 69, 71, 72, 60, 69, 67], 1); // play once ('1')
r = p.asStream; // outputs "a Routine"
// using asStream gives a routine, which can be used like any other routine. Read and experiment more with Routine.
while { (m = r.next).notNil } { m.postln }; // .notNil is a boolean; function executes if condition is true.
//---

// see the envelope:
Env.new(levels: [0, 1, 0], times: [0.1,0.3], curve: [1,-1]).plot; // curve concave both ways... I need an explanation...

( // taken from https://www.youtube.com/watch?v=nB_bVJ1c1Rg&t=629s
SynthDef.new(\sine,{
	|freq = 456, atk = 0.005, rel = 0.3, amp = 0.25, pan = 0|
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(
		envelope: Env([0,1,0],[atk,rel],[1,-1]) ,
	    doneAction: 2); // concave and concave
	sig = Pan2.ar(sig, pan, amp);
	sig = sig *env;
	Out.ar(0, sig);
}).add;
)

v = Synth(\sine); // sanity check

(
p = Pbind (
	\type,\note, // not needed as it's the default
	\instrument, \sine,
	// \dur, 0.3
	\dur, Pseq([0.4,0.2,0.1,0.1],inf).trace,// <- super useful to see what the pattern is doing
//	\degree, Pseq([0,1,2,3,4],6) // stops when either pattern finishes
//	  \midinote, Pseq([60,62,64,65,67], 6);
	\harmonic, Pseq([1,2,3,5,7,11],inf); // in the midinote-freq-hierarchy somewhere.
).play; // returns an EventStreamPlayer
)



 s.plotTree; // super useful!


