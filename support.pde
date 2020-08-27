// Constants

final int CUTOFF_T = 10000;
final int OK_T = 3000;
final int GOOD_T = 1000;

// Globals

import processing.sound.*;

enum State {
  splash,type,nextWord
}
TableRow curR;
String curs = "";
String nxts = "";
int tstart;
String txt = "";
State state;
SoundFile sSuccess, sFail, sFinish;

float easeInOutSine(float x) {
  return (cos(PI * x) - 1.) / -2.;
}

public String chop1(String str) {
    if (str != null && str.length() > 0) {
        str = str.substring(0, str.length() - 1);
    }
    return str;
}
