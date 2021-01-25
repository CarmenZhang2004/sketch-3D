import java.awt.Robot;

//color pallette
color black = #000000; //oak planks
color white = #FFFFFF; //empty space
color dullBlue = #7092BE; //mossy bricks

//textures
PImage mossyStone;
PImage oakPlanks;

//Map variables
int gridSize;
PImage map;

//Robot for mouse control
Robot rbt;

//camerta variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera faces
float upx, upy, upz; //tilt axis

//keyboard
boolean wkey, skey, akey, dkey;

//rotation variables
float leftRightAngle, upDownAngle;

void setup(){
  
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  textureMode(NORMAL);
  
  noCursor();
  try{
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  leftRightAngle = 0;
  upDownAngle = 0;
  
  size(displayWidth, displayHeight, P3D);
  
  eyex = width/2;
  eyey = 9*height/10;
  eyez = height/2;
  
  focusx = eyex;
  focusy = eyey;
  focusz = eyez - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
}

void draw(){
  background(0);
  pointLight(255, 255, 255, eyex, eyey, eyez);
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  drawAxis();
  drawFloor(-2000, 2000, height, gridSize); //floor
  drawFloor(-2000, 2000, height-gridSize*4, gridSize); //ceiling
  drawInterface();
  drawMap();
}

void drawMap(){
  for (int x = 0; x < map.width; x++ ) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, mossyStone, gridSize);
      }
      if (c == black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, oakPlanks, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, oakPlanks, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, oakPlanks, gridSize);
      }
    }
  }
}

void drawInterface(){
  pushMatrix();
  stroke(255, 0, 0);
  strokeWeight(5);
  line(width/2-15, height/2, width/2+15, height/2);
  line(width/2, height/2-15, width/2, height/2+15);
  popMatrix();
}

void move(){ 
  if (akey && canMoveLeft() ) {
    eyex += cos(leftRightAngle - PI/2)*10;
    eyez += sin(leftRightAngle - PI/2)*10;
  }
  if (dkey && canMoveRight() ) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
  }
  if (wkey && canMoveForward() ) {
    eyex += cos(leftRightAngle)*10;
    eyez += sin(leftRightAngle)*10;
  }
  if (skey && canMoveBackward() ) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }
  
  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(upDownAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;
  
  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;
  
  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
  
  if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  if(mouseX < 2) rbt.mouseMove (width-3, mouseY);
}

boolean canMoveForward(){
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  
  fwdx = eyex + cos(leftRightAngle)*200;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*200;
  
  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;
  
  if(map.get(mapx, mapy) == white){
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft(){
  float leftx, lefty;
  int mapx, mapy;
  
  leftx = eyex + cos(leftRightAngle - PI/2)*200;
  lefty = eyez + sin(leftRightAngle - PI/2)*200;
  
  mapx = int(leftx+2000) / gridSize;
  mapy = int(lefty+2000) / gridSize;
  
  if(map.get(mapx, mapy) == white){
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight(){
  float rightx, righty;
  int mapx, mapy;
  
  rightx = eyex + cos(leftRightAngle + PI/2)*200;
  righty = eyez + sin(leftRightAngle + PI/2)*200;
  
  mapx = int(rightx+2000) / gridSize;
  mapy = int(righty+2000) / gridSize;
  
  if(map.get(mapx, mapy) == white){
    return true;
  } else {
    return false;
  }
}

boolean canMoveBackward(){
  float bwdx, bwdy, bwdz;
  int mapx, mapy;
  
  bwdx = eyex - cos(leftRightAngle)*200;
  bwdy = -eyey;
  bwdz = eyez - sin(leftRightAngle)*200;
  
  mapx = int(bwdx+2000) / gridSize;
  mapy = int(bwdz+2000) / gridSize;
  
  if(map.get(mapx, mapy) == white){
    return true;
  } else {
    return false;
  }
  
}

void drawAxis(){
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0,0,0, 1000,0,0); //x axis
  line(0,0,0, 0,1000,0); //y axis
  line(0,0,0, 0,0,1000); //z axis
}

void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing){
  stroke(255);
  strokeWeight(1);
  int x = floorStart;
  int z = floorStart;
  while(z < floorEnd){
    texturedCube(x, floorHeight, z, oakPlanks, floorSpacing) ;
    x = x + floorSpacing;
    if (x >= floorEnd){
      x = floorStart;
      z = z + floorSpacing;
    }
  }
}
