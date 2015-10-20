// From Nick Collins
// http://composerprogrammer.com/teaching/supercollider/sctutorial/6.5 Effects 2.html

(
{
var source, distance, radialdistance, absoluterd, dopplershift, amplitude;
var side, angle;

source = RLPF.ar(SinOsc.ar(440, 0, Decay2.ar(Impulse.ar(0.973630831643
), 0.973630831643/2, 0.973630831643)),440/3);

side=5;
//central side marker, placed 5 metres directly right of observer, observer facing ahead
//in metres, moving at 6.8 metres per second
distance=  EnvGen.ar(Env([34,-34],[10]), doneAction:2);

angle= atan(distance/side);

//radial distance by
absoluterd= (distance.squared+ side.squared).sqrt;

dopplershift= DelayC.ar(source, 1.0, absoluterd/340.0);

//inversely proportional
amplitude= (absoluterd.max(1.0)).reciprocal;

Pan2.ar(amplitude*dopplershift,1.0)
}.play
)
