(
SynthDef(\kick, {|out = 0, bassLevel = 0 , pan1 = 0|

 var env1,  bass, bassOut;
	env1 = EnvGen.kr(Env.perc(0.01, 0.2, 0.9, -5), 1, doneAction:2);

	bass = RLPF.ar(SinOsc.ar([70,71],0.02)+ WhiteNoise.ar(MouseY.kr(0,0.0025)),MouseX.kr(100,250),MouseY.kr(1,0.1));
	bassOut = Pan2.ar(bass*env1, pan1, bassLevel);

	Out.ar([out], bassOut);

 }).add
)

StageLimiter.activate();

(

p.stop;
//Number of beats based on length of day / year
a = Pseq (Bjorklund(63,64) );

t = TempoClock.default;
t.tempo = 93/60.0;

 p = Pbind(
  \instrument, \kick,
  \dur, 1/t.tempo,
  \bassLevel, Pseq ([a], inf),

  ).play;

)