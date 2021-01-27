void pause(){
  background(0);
  textSize(80);
  fill(darkblue);
  text("PAUSE...", width/2+shadowOffset, height/2+shadowOffset);
  fill(lightblue);
  text("PAUSE...", width/2, height/2);
  
  if (pkey) mode=GAME;
}

void pauseClicks(){
  
}
