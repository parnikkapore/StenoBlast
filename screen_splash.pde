void splash_draw(){
    background(#84C1F3); // Blue
    fill(58,72,86); // Indigo
    
    textSize(50);
    textAlign(CENTER,CENTER);
    text("Press space to start!", width*.5, height*.5);
}

void splash_key(){
  if(key==' '){
    state = State.type;
    tstart = millis();
    txt = "";
    curs = getCurS();
  }
}
