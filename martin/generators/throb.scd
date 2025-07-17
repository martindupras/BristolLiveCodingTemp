// throb.scd
// MD 20250709




// Define the SynthDef
(SynthDef(\throb, { |out = 0, freq = 200, amp = 0.1, gate = 1|
    var osc, lfo, filt, env, sig;

    // LFO modulating the filter cutoff
    lfo = SinOsc.kr(5.4, 0, 10, 200);  // freq, phase, mul, add

    // Oscillator: stacked saw waves slightly detuned
    osc = Splay.ar(
		Saw.ar(freq*(Array.rand2(8,1+\analog.kr(0.1))), // not sure that's right
    ) * 8.reciprocal;
	);

    // Filtered by a resonant LPF
    filt = RLPF.ar(osc, lfo, 0.01);

    // ADSR envelope with gate-controlled sustain
    env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction: 2);

	sig = filt * env * amp;
    Out.ar(out, sig);
}).add;)

// Create the synth
~throb = Synth(\throb);
// Release the envelope
~throb.set(\gate, 0);
~throb.set(\analog, 0.0);
~throb.set(\analog, 1.0);  // not sure if working
