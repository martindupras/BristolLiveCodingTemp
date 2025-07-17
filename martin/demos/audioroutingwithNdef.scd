// audioroutingwithNdef.scd
// MD 20250709 still trying to figure it all out!
// Right now it all works. 20250709:1452

// clean up
Ndef(\reverb).clear;
Ndef(\NDtapedelay).clear;
Ndef(\a).clear;

// a processor
(
Ndef(\reverb, {
	FreeVerb.ar([\in1.ar, \in2.ar], 0.6, 0.8);
}).play;
)

// a one-channel source
Ndef(\a, { LFPulse.ar(MouseY.kr(30, 1000, 1))  *0.3}).stop;

Ndef(\reverb) <<>.in1 Ndef(\a); // just send to left channel
Ndef(\reverb) <<>.in2 Ndef(\a); // just send to right channel
Ndef(\reverb) <<>.in1 nil;
Ndef(\reverb) <<>.in2 nil;


// Try as a SynthDef. Dones't work, FIGURE THAT OUT
/*(
  SynthDef(\tapedelay, { |out = 0, in|
    var maxDelay = 10; // 10 seconds
    var signal = (LocalIn.ar(1) * \feedback.kr(0.5)) + in; // will this work with Ndefs?
    var tapesig = AnalogTape.ar(signal);
    var delayed = DelayC.ar(tapesig, maxDelay, \delay.kr(0.4));
 /*   LocalOut.ar(delayed);
    Out.ar(out,
      Pan2.ar(
        XFade2.ar(in, delayed, (\drywet.kr(0.2) * 2) - 1)
      )
    );
  }, [0, \ar]*/
}
).add;
)*/

(
Ndef(\NDtapedelay, {
    var maxDelay = 10; // 10 seconds;
	var mix = 0.2;
	//var signal = (\in.ar); // mono for now and no feedback yet
	var tapesig = AnalogTape.ar([\in1.ar, \in2.ar]);
	[\in1.ar, \in2.ar] + (mix*DelayC.ar(tapesig, maxDelay, \delay.kr(0.7)));
}
).play;
)


Ndef(\reverb) <<>.in1 Ndef(\a); // just send to left channel
Ndef(\reverb) <<>.in2 Ndef(\a); // just send to right channel
Ndef(\reverb) <<>.in1 nil;
Ndef(\reverb) <<>.in2 nil;

Ndef(\NDtapedelay) <<>.in1 Ndef(\a); // just send to left channel
Ndef(\NDtapedelay) <<>.in2 Ndef(\a); // just send to right channel
Ndef(\NDtapedelay) <<>.in1 nil;
Ndef(\NDtapedelay) <<>.in2 nil;






// Trying to figure out how Guy does this:
// I can't get it to work.
(
(
Ndef(\testtape)[0]= \tapedelay;
).play;
)

Ndef(\testtape) <<>.in1 Ndef(\a);