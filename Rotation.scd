(
a = VBAPSpeakerArray.new(2, [0, 90,  180, -90]); // 4 channel ring

a.speakers[1].dump;
b = a.loadToBuffer;
)
(
// pan around the circle up and down
x = {|azi = 0, ele = 0, spr = -5|
	var source;
	source = RLPF.ar(SinOsc.ar(220, 0, Decay2.ar(Impulse.ar(2), 0.02, 0.8)),150);

	VBAP.ar(4, source, b.bufnum, LFSaw.kr(0.5, 0).range(-180, 180) * -1, ele, spr);
}.scope;
)