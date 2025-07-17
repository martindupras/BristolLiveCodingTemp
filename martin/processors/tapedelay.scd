// tapedelay.scd
//////-----------------------IN PROGRESS
// Plugin quark: If not installed:
Quarks.install("https://github.com/madskjeldgaard/plugins.quark");

// Ported plugins (https://github.com/madskjeldgaard/portedplugins?tab=readme-ov-file)
Plugins.installPlugin("portedplugins");

// if above fails, CMake may not be in the place that the above expects
({
  var path = getenv("PATH");
  if(path.isEmpty.not) { path = path ++ ":"; };
  setenv("PATH", path ++ "/opt/homebrew/bin");
}.value)

//AnalogTape;

// adapted from rumblesan's
(
  SynthDef(\tapedelay, { |out = 0, in|
    var maxDelay = 10; // 10 seconds
    var signal = (LocalIn.ar(1) * \feedback.kr(0.5)) + in; // will this work with Ndefs?
    var tapesig = AnalogTape.ar(signal);
    var delayed = DelayC.ar(tapesig, maxDelay, \delay.kr(0.4));


    LocalOut.ar(delayed);
    Out.ar(out,
      Pan2.ar(
        XFade2.ar(in, delayed, (\drywet.kr(0.2) * 2) - 1)
      )
    );
  }, [0, \ar]).add;
)

(SynthDef(\noise , {
	var sig;
	sig = PinkNoise.ar(1);
	Out.ar(0, sig!2);
}).add;)

(SynthDef(\pulse , {
	var sig;
	sig = Pulse.ar(0.2);
	Out.ar(0, sig!2);
}).add;)



Synth(\noise);
Synth(\pulse);
Synth(\tapedelay).

Ndef(\Ndeftapedelay)[0] = \tapedelay;
Ndef(\Ndeftapedelay).stop;
Ndef(\Ndeftapedelay) <<> Ndef(\pulse)
