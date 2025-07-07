// clocksfromphasors.scd v0.0
// MD 20250707


s.boot;




/////////////
// use Ndefs

(
Ndef(\phasor, {
	Phasor.ar(0, 2 / SampleRate.ir, 0, 1).scope;
	//Saw.ar(2, 0.5, 0.5).scope;
})
)

Ndef(\phasor).play;
Ndef(\phasor).stop;


(
Ndef(\div4,{

	(Ndef(\phasor).ar*4).wrap(0,1).scope;

}).play;
)

Ndef(\div4).stop;

(
Ndef(\div8,{

	(Ndef(\phasor).ar*8).wrap(0,1).scope;

}).play;
)
Ndef(\div8).stop;



///// POC
(
SynthDef(\phasor, {
	var sig;
	sig = Saw.ar(2, 5, -1, 1);
	Out.ar(0, 0.2*sig!2);
}).add;
)

x = Synth(\phasor);

x.free;




//////////////

// Base phasor: ramps from 0 to 1
Ndef(\phasor, {
    var phase = Saw.ar(2, 0.5, 0.5);  // range -0.5 to +0.5
    phase + 0.5                       // shift to 0..1
});

// Output: 4x faster ramp (wrap every quarter of original ramp)
Ndef(\div4, {
    (Ndef(\phasor).ar * 4).wrap(0, 1)
});

// Play it
Ndef(\div4).play;

