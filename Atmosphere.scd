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