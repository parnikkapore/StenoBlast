void type_draw(){
    // Background
    background(#84C1F3); // Blue
    fill(58,72,86); // Indigo
    
    // Prompt
    textSize(100);
    textSize(min((width*0.9 / textWidth(curs))*100, width*0.14));
    textAlign(CENTER,CENTER);
    text(curs, width*.5, height*0.4);
    
    // Text entry box
    textSize(50*displayDensity());
    textAlign(CENTER,BOTTOM);
    rectMode(CORNERS);
    text(txt, width*.1, height*.5, width*.9, height-32);
    
    // Time bar
    int timeLeft = (CUTOFF_T) - (millis()-tstart);
    rectMode(CORNER);
    // Green
    fill(#23FA2C);
    rect(8,8, timeLeft*(width-8) / CUTOFF_T,20,8,8,8,8);
    // Orange
    fill(#FCAB08);
    rect(8,8,min(timeLeft,CUTOFF_T - GOOD_T)*(width-8) / CUTOFF_T,20,8,8,8,8);
    // Red
    fill(#FF662E);
    rect(8,8,min(timeLeft,CUTOFF_T - OK_T)*(width-8) / CUTOFF_T,20,8,8,8,8);
    
    // Passing to next word
    if(txt.equals(curs)) {
      updateCard(timeLeft);
      
      state = State.nextWord;
      nxts = getCurS();
      tstart = millis();
      sSuccess.play();
    }else if(timeLeft < 0){
      updateCard(timeLeft);
      
      state = State.type;
      tstart = millis();
      txt = "";
      curs = getCurS();
      sFail.play();
    }
}

void type_key(){
    if(key==CODED) return; // Letters only!
    
    if(key == char(8)) { txt = chop1(txt); } // Backspace
    else if(key == ' ' || key == '\n') { txt = ""; } // New word -> clear old one
    else{ txt += key; }
    //println(char(key), int(key));
}

void updateCard(int timeLeft){
  if(timeLeft > CUTOFF_T - GOOD_T)    println(curs, "written great");
  else if(timeLeft > CUTOFF_T - OK_T) println(curs, "written well");
  else                                println(curs, "written poorly");
  
  int box = curR.getInt("box"); // Should default to 0 if it doesn't exist.
  int due;
  int now = int(System.currentTimeMillis()/(1000*24*60*60)); // Days since epoch
  
  if(timeLeft > CUTOFF_T - GOOD_T)    box+=2;
  else if(timeLeft > CUTOFF_T - OK_T) box+=1;
  else if(timeLeft < 0) box=0;
  box = min(max(0, box), BOXES);
  due = now + BOX_ITRVL[box];
  
  curR.setInt("box", box);
  curR.setInt("due", due);
}
