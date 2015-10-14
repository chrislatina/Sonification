// The goal of this patch is to provide some possibilities for the sound of Rings
//
// Saturn: So Many Rings
// Jupiter: 3 faint rings
// Uranus: 13 rings
// Neptune: 5 rings

s.boot;

// You can not assign a variable "n" in Mix(n,function). I think this may have to be discrete

(
//  Saturn (100), Jupiter(3), Uranus(13), Neptune(5)
var numRings = 5;

SynthDef(\Rings,{
	var synth;
	synth = Mix.arFill(numRings,{SinOsc.ar(2000.rand.postln, (2*pi).rand2, 0.1.rand)});
	Out.ar([0,1], synth);
	}
).play
)
// Critique:
// - Perhaps not enough variation between 3 and 5. Is this relevant?
// - Volume should be even lower for 3 and 5.