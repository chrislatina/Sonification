//Notes

/* Parameters to sonify

Size (probably mass) -- pitch / width
Atmosphere -- reverb / size of cloud / width
   use additive windsound to represent gaseous planets

Types of atmospheres: Jupiter is nearly all atmosphere, mars has none

Length of day - tempo (amplitude modulation -- front point of planet face is audible when facing reference point)
Length of year -- ambisonic rotation

Number of Moons - highpitched textural / granular Dust / Impulse

Uranus : Rotation on its axis?? Envelope
(make reverses sounding envelope using long attack)

*/

//Are these perceived very differently?
{SinOsc.ar([220,441])}.play;
{SinOsc.ar([441,220])}.play;

s.scope;