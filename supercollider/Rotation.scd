(
a = VBAPSpeakerArray.new(2, [0, 90,  180, -90]); // 4 channel ring

a.speakers[1].dump;
b = a.loadToBuffer;
StageLimiter.activate

)



/** Need to account for initial phase (starting year alignment?) **/

(
//Mercury's diameter is 3032 = 7918/3032 * 440 = 1149.05013193 Hz
//Full rotation (year) at 88 seconds
// One impulse per 58.625 earth days (1,407 / 24 hrs)

~mercury = {|azi = 0, ele = 0, spr = 0|
	var source;
	source = BPF.ar(WhiteNoise.ar(Decay2.ar(Impulse.ar(1/58.625), 58.625/2, 58.625)),1149.05013193,0.005,1);

	VBAP.ar(4, source, b.bufnum, LFSaw.kr(1/88, 0).range(-180, 180), ele, spr);
}.scope;


// Venus is 7521 = 7918/7521 * 440 = 463.22563488898 Hz
//Full rotation (year) at 225 seconds
// One impulse per 243 earth days = (5832/24 hrs)

~venus = {|azi = 0, ele = 0, spr = 0|
	var source;
	source = BPF.ar(WhiteNoise.ar(Decay2.ar(Impulse.ar(1/243), 243/2, 243)),463.22563488898,0.005,1);

	VBAP.ar(4, source, b.bufnum, LFSaw.kr(1/225, 0).range(-180, 180), ele, spr);
}.scope;

//Earth's diameter is 7918 =  A4(440) (reference)
//Full rotation (year) at 365 seconds
// One impulse per 24/24.65 days

~earth = {|azi = 0, ele = 0, spr = 0|
	var source;
	source = BPF.ar(BrownNoise.ar(Decay2.ar(Impulse.ar(0.973630831643
), 0.973630831643/2, 0.973630831643)),440,0.01,1);


	VBAP.ar(4, source, b.bufnum, LFSaw.kr(1/365, 0).range(-180, 180), ele, spr);
}.scope;

// Mars is 1/2 earth = 2 * 440 = 880 Hz
//Full rotation (year) at 686.971 seconds

// One impulse per 1 earth days =

~mars = {|azi = 0, ele = 0, spr = 0|
	var source;
		source = BPF.ar(BrownNoise.ar(Decay2.ar(Impulse.ar(1), 0.5, 1)),880, 0.01,1);


	VBAP.ar(4, source, b.bufnum, LFSaw.kr(1/686.971, 0).range(-180, 180), ele, spr);
}.scope;

//Jupter's diameter is 86881 = 7918/86881 * 440 = 40.099906769 Hz
// Full rotation (year) is 4332.59 seconds (earth days)
// One impulse per 0.4135344 days
~jupiter = {|azi = 0, ele = 0, spr = 0|
	var source;
		source = BPF.ar(BrownNoise.ar(Decay2.ar(Impulse.ar(2.4181785118723), 2.4181785118723/2, 2.4181785118723)),40.099906769,0.05,1);


	VBAP.ar(4, source, b.bufnum, LFSaw.kr(1/4332.59, 0).range(-180, 180), ele, spr);
}.scope;
)
