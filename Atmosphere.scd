s.boot;

// Create and test synth def. MouseY controls frequencies of the LFNoise.
(
SynthDef(\Atmosphere,{
	arg size;
	var source, filter, freqs, out;
	size = MouseY.kr(1,10);
	freqs = [500/size, 1000/size, 1500/size];
	source = LFNoise2.ar(freqs[0])+LFNoise2.ar(freqs[2])+LFNoise2.ar(freqs[2]);
	filter = LPF.ar(source,400);
	out = Out.ar([0,1], filter);
	}
).play;
)


// Test with ambisonic encoding/decoding.
(
SynthDef(\Atmosphere_Spat,{
	arg size;
	var source, filter, freqs, out;
	var w, x, y, a, b, c, d;

	// Synthesis
	size = MouseY.kr(1,10);
	freqs = [500/size, 1000/size, 1500/size];
	source = LFNoise2.ar(freqs[0])+LFNoise2.ar(freqs[2])+LFNoise2.ar(freqs[2]);
	filter = LPF.ar(source,400);

	// Spatialization
	#w, x, y = PanB2.ar(filter, LFSaw.kr(0.1), 0.1);
    #a, b, c, d = DecodeB2.ar(4, w, x, y);
	Out.ar(0,[a,b,c,d]);
	}
).play;
)

(
SynthDef(\Atmospheric_wind,{
	var x,y;
	x = RLPF.ar(WhiteNoise.ar(0.2), abs(SinOsc.ar(0.001, 0, 660)), 1);
	y = RLPF.ar(WhiteNoise.ar(0.2), abs(SinOsc.ar(0.015, 0, 220)), 1);
	#x, y = Rotate2.ar(x, y, LFTri.kr(0.05 + 0.01*LFPulse.kr(0.01)));
	Out.ar(0,[x,y])

}).play;
)