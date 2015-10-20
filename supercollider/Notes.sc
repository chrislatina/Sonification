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

Weather + Geological events (volcanos) -- used as differentiator for comprehension -- these can be samples or their own presentation. Use the existing tools for weather sonificaiton.

Rings (Saturn) -- harmonic tones, stacked fifths. Planet pulses with time of day, ring sounds are sine waves, slightly detuned to represent phase / rotation of sort, nice warm analog-esque sounds.

*/

/* DISTANCE */
/* Map to time between the sun and the planet, x number of miles is y seconds */


//Are these perceived very differently?
{SinOsc.ar([220,441])}.play;
{SinOsc.ar([441,220])}.play;

s.scope;


/* Sonify Gravity for bouncing ball*/

/* Points to write about

The general model of representing a planet.
IE:

Spatial Rotation(Amplitude modulation for tempo (size -> pitch -> waveshape -> envelope to represent rotation (clockwise or counter) + weather/moon/rings))

Evaluate this model.


Avaluate whether audio vs. audio-visual is successful. Make sure to do voice over so the package is complete.
*/


/* Future ideas

table interface with rotations -- can turn on volume for each planet, then zoom in and show additional info about the planet and a "portrait-style" audio clip to represent those details.

*/