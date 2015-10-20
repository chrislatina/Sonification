(
a = VBAPSpeakerArray.new(2, [0, 120,  -120]); // 4 channel ring

a.speakers[1].dump;
b = a.loadToBuffer;

StageLimiter.activate;
)
s.makeWindow;

/** Need to account for initial phase (starting year alignment?) **/

(
//Mercury's diameter is 3032 = 7918/3032 * 440 = 1149.05013193 Hz
//Full rotation (year) at 88 seconds
// One impulse per 58.625 earth days (1,407 / 24 hrs)

~mercury = {|azi = 0, ele = 0, spr = 0|
	var source;
	source = RLPF.ar(SinOsc.ar(1149.05013193, 0, Decay2.ar(Impulse.ar(1/5.8625), 5.8625/2, 5.8625)),1149.05013193/5);

	VBAP.ar(3, source, b.bufnum, LFSaw.kr(1/8.8, 0).range(-180, 180), ele, spr);
}.scope;


// Venus is 7521 = 7918/7521 * 440 = 463.22563488898 Hz
//Full rotation (year) at 225 seconds
// One impulse per 243 earth days = (5832/24 hrs)

~venus = {|azi = 0, ele = 0, spr = 0|
	var source;
	source = RLPF.ar(SinOsc.ar(463.22563488898, 0, Decay2.ar(Impulse.ar(1/24.3), 24.3/2, 24.3)),463.22563488898/5);

	VBAP.ar(3, source, b.bufnum, LFSaw.kr(1/22.5, 0).range(-180, 180), ele, spr);
}.scope;

//Earth's diameter is 7918 =  A4(440) (reference)
//Full rotation (year) at 365 seconds
// One impulse per 24/24.65 days

~earth = {|azi = 0, ele = 0, spr = 0|
	var source;
	source = RLPF.ar(SinOsc.ar(440, 0, Decay2.ar(Impulse.ar(09.73630831643
), 0.0973630831643/2, 0.0973630831643)),440/3);

	VBAP.ar(3, source, b.bufnum, LFSaw.kr(1/36.5, 0).range(-180, 180), ele, spr);
}.scope;

// Mars is 1/2 earth = 2 * 440 = 880 Hz
//Full rotation (year) at 686.971 seconds

// One impulse per 1 earth days =

~mars = {|azi = 0, ele = 0, spr = 0|
	var source;
		source = RLPF.ar(SinOsc.ar(880, 0, Decay2.ar(Impulse.ar(10), 0.05, 0.1)),880/3);


	VBAP.ar(3, source, b.bufnum, LFSaw.kr(1/68.6971, 0).range(-180, 180), ele, spr);
}.scope;

//Jupter's diameter is 86881 = 7918/86881 * 440 = 40.099906769 Hz
// Full rotation (year) is 4332.59 seconds (earth days)
// One impulse per 0.4135344 days
~jupiter = {|azi = 0, ele = 0, spr = 0|
	var source;
		source = RLPF.ar(SinOsc.ar(40.099906769, 0, Decay2.ar(Impulse.ar(24.181785118723), 0.24181785118723/2, 0.24181785118723)),30);


	VBAP.ar(3, source, b.bufnum, LFSaw.kr(1/433.259, 0).range(-180, 180), ele, spr);
}.scope;
)
