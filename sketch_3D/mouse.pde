void mouseReleased(){
  if (mode == INTRO){
    introClicks();
  } else if (mode == GAME){
    gameClicks();
  } else if (mode == GAMEOVER){
    gameoverClicks();
  } else if (mode == WIN){
    winClicks();
  } else if (mode == PAUSE){
    pauseClicks();
  }
}
