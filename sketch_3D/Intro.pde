void intro() {
  background(0);
  stroke(255);
  strokeWeight(5);
  fill(255);
  if (mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height/2+50 && mouseY<height/2+150){
    stroke(lightblue);
  } else {
    stroke (255);
  }
  
  rect(width/2, height/2+100, 200, 100);
  fill(0);
  textSize(50);
  text("Start", width/2, height/2+95);
  textSize(100);
  fill(darkblue);
  text("Snowman Fight", width/2+shadowOffset, height/3+shadowOffset);
  fill(lightblue);
  text("Snowman Fight", width/2, height/3);
}

void introClicks() {
  if (mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height/2+50 && mouseY<height/2+150){
  mode=GAME;
  }
}
