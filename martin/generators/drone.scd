// drone.scd
// MD 20250709


(
SynthDef(\drone,{
	|dur = 2, freq = 64, gate = 1 |
	var env, sig;

	    // ADSR envelope with gate-controlled sustain
    env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction: 2);

	sig = Formant.ar(freq,35*[1,2,3], 10*[1,2,3], [1,0.7, 0.8]*0.2);
	Out.ar(0, sig*env);
}).add;
)

k = Synth(\drone);
k.set(\gate, 0);
k.play;

