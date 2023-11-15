declare name "SubOut";
declare description "Stereo in to mono out with low-freq part of summed signal for sending to a sub-woofer";
declare version "0.1.0";
declare author "Christopher Arndt";
declare license "MIT license";

import("stdfaust.lib");

// Controls
freq = hslider("[1]Crossover Freq.[symbol: freq][unit: hz]", 80, 50, 500 , 1.0);
gain = hslider("[2]Sub Level[symbol: gain][unit: dB]", -25.0, -60.0, 0.0, 0.01);
gate = checkbox("[3]Enable[symbol: enable]");

envelope = gate * ba.db2linear(gain) : si.smooth(ba.tau2pole(0.1)) ;
process = _,_:> / (2) : fi.lowpassLR4(freq) * envelope;
