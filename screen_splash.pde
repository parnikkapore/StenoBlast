void splash_draw(){
    background(#84C1F3); // Blue
    fill(58,72,86); // Indigo
    
    textSize(50);
    textAlign(CENTER,CENTER);
    text("Press space to start!", width*.5, height*.5);
}

void splash_key(){
  if(key==' '){
    initDeckDue();
  }else if(key=='\\'){
    initDeckAll();
  }
  
  if(key==' ' || key=='\\'){
    //println(curDeck.size());
    if(curDeck.size()==0){ // No cards
      sFail.play();
    }else{
      state = State.type;
      tstart = millis();
      txt = "";
      curs = getCurS();
    }
  }
}
