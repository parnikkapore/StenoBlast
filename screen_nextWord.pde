void nextWord_draw(){
  // Constants
  final int LEN = 600;
  
  final float ratio = min(float(millis() - tstart) / float(LEN), 1.); 
  final int ease = int(easeInOutSine(ratio) * width);
  
  // Background
  colorMode(HSB, 360, 100, 100);
  background(206.*ratio + 152.*(1.-ratio), 45, 94);
  //background(206,45,94);
  
  colorMode(RGB,255);
  fill(58,72,86);
  
  // Old prompt
  textSize(100);
  textSize(min((width*0.9 / textWidth(curs))*100, width*0.14));
  textAlign(CENTER,CENTER);
  text(curs, width*.5 - ease, height*0.4);
  
  // New prompt
  textSize(100);
  textSize(min((width*0.9 / textWidth(nxts))*100, width*0.14));
  textAlign(CENTER,CENTER);
  text(nxts, width*1.5 - ease, height*0.4);
  
  // Text entry box
  textSize(50*displayDensity());
  textAlign(CENTER,BOTTOM);
  rectMode(CORNERS);
  text(txt, width*.1, height*.5, width*.9, height-32);
  
  // Transition
  if(ratio >= 1.){
    state = State.type;
    tstart = millis();
    txt = "";
    curs = nxts;
  }
}

void nextWord_key(){}
