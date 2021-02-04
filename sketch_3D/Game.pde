int a = 0;
int t;

boolean hurt;

void game() {
  noCursor();
  
  if(pkey) mode=PAUSE;
  
  t--;
  
  a++;
  if (a == 1) {
    objects.add(new Enemy());
  } else if (a >= 30){
    a = 0;
  }
  
  if (a == 1) {
    objects.add(new Power());
  } else if (a >= 120){
    a = 0;
  }
  objects.add(new Snow());
  
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(lightblue);
  world.pointLight(200, 200, 200, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  //drawAxis();
  drawFloor(-2000, 2000, height, gridSize); //floor
  //drawFloor(-2000, 2000, height-gridSize*5, gridSize); //ceiling
  drawMap();
  
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  
  world.endDraw();
  image(world, 0, 0);
  
  HUD.beginDraw();
  HUD.clear();
  if(hurt) {
    HUD.background(255, 0, 0, 50);
    if (t<=0) {
    live--;
    t = 100;
    }
    hurt = false;
  }
  
  drawCrosshair();
  drawMinimap();
  HUD.endDraw();
  image(HUD, 0, 0);
  
  if(live <= 0) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  
}
