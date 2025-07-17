// duster.scd
// MD 20250709

// PLAN: make a synth that has an envelope (so it can be triggered by events)
// Bonus: make a version that is triggered by an audio/control signal (so no doneAction)
// Envelope should default to a few seconds, exponential ([1,-1]) and apply to amplitude AND density


(
SynthDef(\duster,{
	|dur = 2, initialdensity = 5000|
	var env, sig;
	env = EnvGen.kr(
		Env.perc(0.001,dur),
		doneAction:2;
	);
	sig = Dust.ar(initialdensity*env*[1,1]);
	Out.ar(0, sig*env);
}).add;
)


k = Synth(\duster);
k.play;