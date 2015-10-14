// TBall Example

// mouse x controls step noise modulation rate
// mouse y controls gravity
(
{
    var t, sf, g;
    sf = LFSaw.kr(10);
    g = MouseY.kr(0.01, 10, 1);
	    t = TBall.ar(sf, g, MouseX.kr(0,0.9), 0.002);
    Ringz.ar(t * 4, [600, 600], 0.3);
}.play;
)


// Sound Field Rotation Example

(
{
    var w, x, y, p, q, a, b, c, d;

    p = WhiteNoise.ar(0.05); // source
    q = LFSaw.ar(221,0,0.03)+LFSaw.ar(220,0,0.03)+LFSaw.ar(55.01,0,0.03);

    // B-format encode 2 signals at opposite sides of the circle
    #w, x, y = PanB2.ar(p, -0.5) + PanB2.ar(q, 0.5);

    #x, y = Rotate2.ar(x, y, MouseX.kr(-1,1));

    // B-format decode to quad
    #a, b, c, d = DecodeB2.ar(4, w, x, y);

    [a, b, d, c] // reorder to my speaker arrangement: Lf Rf Lr Rr
}.play;
)


//"Binaural Rhythm" composition
(
SynthDef(\tri, {|freq = 50, duration = 100, doneAction = 2, atk = 5, sus = 8, rel = 4, gate = 1|
	var e = EnvGen.kr(Env.asr(atk,sus,rel), gate, doneAction:2);
	OffsetOut.ar([0,3], 0.25*Limiter.ar(e*RLPF.ar(LFTri.ar([freq,freq*2.5],0.05), XLine.kr([8000,90],[40,4000],duration, doneAction: doneAction), 0.005)));

}).add;
)

s.scope;

x = Synth.new(\tri,[\freq,160,\duration,80,\doneAction,0]);
y = Synth.new(\tri,[\freq,100,\duration,80]);

x.set(\gate, 0);
y.set(\gate, 0);


//Saturn
(
SynthDef(\saturn, { arg moons = 52, freq = 220;
	//diameter= 72367, rev = 10800, rotation=10, mass=440, rings=1,
	var mix, env;
	env = EnvGen.kr(Env.adsr(0.009, 0.2, 0.5, 0.9, 1, -2),  Dust.kr(2));

	mix = Mix.fill(2, { SinOsc.ar([freq + 200.rand,freq + 1 + 200.rand], 1, (1/2)*(0.5 + 0.2*env)) });

	Out.ar([0], mix);
}).add;
)

a = Synth(\saturn);


//Resonant Membrane
(
{ var excitation = EnvGen.kr(Env.perc,
                            MouseButton.kr(0, 1, 0),
                             timeScale: 0.1, doneAction: 0
                            ) * PinkNoise.ar(0.4);
  var tension = MouseX.kr(0.01, 0.1);
  var loss = MouseY.kr(1.0, 0.9999999, 1);
  MembraneHexagon.ar(excitation, tension, loss);
}.play;
)
