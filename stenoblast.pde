// StenoBlast

// Library
void setup(){
    loadDeck();
    
    size(854,480);
    surface.setTitle("StenoBlast 0.0.1");
    surface.setResizable(true);
    //fullScreen();
    
    tstart = millis();
    state = State.splash;
    curs = getCurS();
    sSuccess = new SoundFile(this, "Success.mp3");
    sFail = new SoundFile(this, "Failure.mp3");
    sFinish = new SoundFile(this, "Finish.mp3");
}

void keyReleased(){
    switch(state){
      case splash: splash_key(); break;
      case type: type_key(); break;
      case nextWord: nextWord_key(); break;
      default:
    }
  }

void draw(){
    switch(state){
      case splash: splash_draw(); break;
      case type: type_draw(); break;
      case nextWord: nextWord_draw(); break;
      default: background(100,0,0);
    }
}
