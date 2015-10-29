(
s = Server.local;
s.makeWindow;

Server.default = s;
ServerOptions.inDevices;
ServerOptions.outDevices;
s.options.sampleRate= 48000;
s.options.outDevice_("AudioBox 44 VSL");
)

(
a = VBAPSpeakerArray.new(2, [0, 90,  180, -90]); // 4 channel ring

a.speakers[1].dump;
b = a.loadToBuffer;
StageLimiter.activate

)


(
~channels = 4;
~earth_diameter = 7918; // Miles
~earth_fundamental = 440; //Hz
~earth_year = 365.256; //Days
~earth_day = 24; //Hours

SynthDef(\planet, { arg azi = 0, ele = 0, spr = 0, diameter = 7918, year = 365.256, day = 24, q = 0.1, phase = 0;
	var pitch, tempo, rotation, source;
	pitch = ~earth_diameter / diameter * ~earth_fundamental;
	tempo = 1*~earth_day / day;
	rotation = 1/year;
	source = BPF.ar(BrownNoise.ar(Decay2.ar(
		Impulse.ar(tempo), 1/tempo/2, 1/tempo)),pitch,q,AmpCompA.kr(pitch));

	Out.ar(0,VBAP.ar(4, source, b.bufnum,
		LFSaw.kr(rotation, phase).range(-180, 180), ele, spr));

}).add;
/*
~tempo = 10*~earth_day / 2784.75;
1/~tempo/2;
plot({Decay2.ar(Impulse.ar(~tempo), 1/~tempo/2;, 1/~tempo)});*/

s.scope;
)

(
/* MERCURY */
~mercury_diameter = 3032; // Miles
~mercury_year = 88; // Days
~mercury_day = 58.64583 * ~earth_day; //Hours
~mercury_q = 0.003; //Filter value

~mercury_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~mercury_diameter,\year,~mercury_year,\day,~mercury_day,\q,~mercury_q]);

/* VENUS */
~venus_diameter = 7521; // Miles
~venus_year = 224.7; // Days
~venus_day = 2784.75; //Hours
~venus_q = 0.005; //Filter value

~venus_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~venus_diameter,\year,~venus_year,\day,~venus_day,\q,~venus_q]);

/* EARTH */
~earth_q = 0.01; //Filter value
~earth_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~earth_diameter,\year,~earth_year,\day,~earth_day,\q,~earth_q]);

/* MARS */
~mars_diameter = 4212; // Miles
~mars_year = 686.971; // Days
~mars_day = ~earth_day * 1.02777; //Hours
~mars_q = 0.01; //Filter value

~mars_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~mars_diameter,\year,~mars_year,\day,~mars_day,\q,~mars_q]);


/* JUPITER */
~jupiter_diameter = 86881.4; // Miles
~jupiter_year = 4332.59; // Days
~jupiter_day = 9.933333; //Hours
~jupiter_q = 0.05; //Filter value

~jupiter_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~jupiter_diameter,\year,~jupiter_year,\day,~jupiter_day,\q,~jupiter_q]);

/* SATURN */
~saturn_diameter = 72367.4; // Miles
~saturn_year = 10759; // Days
~saturn_day = 10.65; //Hours
~saturn_q = 0.05; //Filter value
~saturn_phase = 1.0;

~saturn_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~saturn_diameter,\year,~saturn_year,\day,~saturn_day,\q,~saturn_q,\phase,~saturn_phase]);

/* URANUS */
~uranus_diameter = 31518; // Miles
~uranus_year = 84.3 * 365; // Days
~uranus_day = 17.233; //Hours
~uranus_q = 0.05; //Filter value
~uranus_phase = -0.5;

~uranus_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~uranus_diameter,\year,~uranus_year,\day,~uranus_day,\q,~uranus_q,\phase,~uranus_phase]);

/* NEPTUNE */
~neptune_diameter = 30599; // Miles
~neptune_year = 60190; // Days
~neptune_day = 16.1; //Hours
~neptune_q = 0.05; //Filter value
~neptune_phase = 0.5;

~neptune_synth = Synth(\planet, [\azi,0,\ele,0,\spr,0,\diameter,~neptune_diameter,\year,~neptune_year,\day,~neptune_day,\q,~neptune_q,\phase,~neptune_phase]);
)