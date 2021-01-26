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
boolean wkey, skey, akey, dkey, spacekey;

//rotation variables
float leftRightAngle, upDownAngle;

//Game Objects
ArrayList<GameObject> objects;

//canvases
PGraphics world;
PGraphics HUD;

void setup(){
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  //create game object list
  objects = new ArrayList<GameObject>();
  
  //load textures
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  world.textureMode(NORMAL);
  
  noCursor();
  try{
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  leftRightAngle = 0;
  upDownAngle = 0;
  
  size(displayWidth, displayHeight, P2D);
  
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
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0);
  world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  drawAxis();
  drawFloor(-2000, 2000, height, gridSize); //floor
  drawFloor(-2000, 2000, height-gridSize*4, gridSize); //ceiling
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
  drawCrosshair();
  drawMinimap();
  HUD.endDraw();
  image(HUD, 0, 0);
}
