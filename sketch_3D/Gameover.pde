void gameover() {
  background(0);
  textSize(80);
  fill(darkblue);
  text("GAMEOVER", width/2+shadowOffset, height/2+shadowOffset);
  fill(lightblue);
  text("GAMEOVER", width/2, height/2);
}

void gameoverClicks() {
  mode=INTRO;
}
