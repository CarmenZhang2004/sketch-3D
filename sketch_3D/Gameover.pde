void gameover() {
  cursor();
  background(0);
  textSize(80);
  fill(darkblue);
  text("GAMEOVER", width/2+shadowOffset, height/2+shadowOffset);
  fill(lightblue);
  text("GAMEOVER", width/2, height/2);
  
  score = 0;
  live = 5;
  
  eyex = width/2;
  eyey = 9*height/10;
  eyez = height/2;
  
  focusx = eyex;
  focusy = eyey;
  focusz = eyez - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
}

void gameoverClicks() {
  objects = new ArrayList<GameObject>();
  setup();
  mode=INTRO;
}
