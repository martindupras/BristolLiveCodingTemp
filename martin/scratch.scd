// scratch

t = TempoClock(2,1).permanent_(1);
t.beats;

~noise = {RLPF.ar(WhiteNoise.ar(1),LFNoise1.kr(0.1).range(100,2000),SinOsc.kr(0.1).range(0.1,0.4),1)};
~noiseEnv = {EnvGen.ar(Env.perc(0.0001,0.1),Dust.kr(42))};
~totalNoise = {Out.ar(0,~noise*~noiseEnv)};
~totalNoise.play;

// turn into an Ndef?

(
Ndef(\filtnoise).play;
)

// one way to use Ndef as parameter:
(
Ndef(\filtnoise,{
	var noise, env;
	noise = {RLPF.ar(WhiteNoise.ar([1,1]),LFNoise1.kr(0.1).range(100,2000),SinOsc.kr(0.1).range(0.1,0.4),1)};
	env = {EnvGen.ar(Env.perc(0.0001,0.1),\trigger.kr(1))};
	noise*env;
})
)

/* OTHER WAY TO USE Ndef as parameter
(
Ndef(\filtnoise,{
	var noise, env;
	noise = {RLPF.ar(WhiteNoise.ar([1,1]),LFNoise1.kr(0.1).range(100,2000),SinOsc.kr(0.1).range(0.1,0.4),1)};
	env = {EnvGen.ar(Env.perc(0.0001,0.1),Ndef(\triggersig))};
	noise*env;
})
)
 */

Ndef(\filtnoise).stop;

// clock trigger
(
Ndef(\triggersig, {
	Impulse.kr(8); //
}).quant(1); // does quant wwork without play?
)

(
Ndef(\triggersig2, {
	Impulse.kr(4); //
}).quant(1); // does quant wwork without play?
)

Ndef(\triggersig).stop;

( // control-rate
Ndef(\dust, {
	Dust.kr(10);
});
)

Ndef(\filtnoise).set(\trigger, Ndef(\dust));
Ndef(\filtnoise).set(\trigger, Ndef(\triggersig));
Ndef(\filtnoise).set(\trigger, Ndef(\triggersig2));


