import java.awt.Robot;

//color pallette
color black = #000000; //oak planks
color white = #FFFFFF; //empty space
color dullBlue = #7092BE; //mossy bricks
color darkblue = #2B4876;
color lightblue = #9BBCF0;

//textures
PImage snow;
PImage diamond;
PImage gold;
PImage intro;

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
boolean pkey;

//rotation variables
float leftRightAngle, upDownAngle;

//Game Objects
ArrayList<GameObject> objects;

//canvases
PGraphics world;
PGraphics HUD;

int shadowOffset = 8;

int score, live;

final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
int mode = INTRO;

void setup(){ 
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  //create game object list
  objects = new ArrayList<GameObject>();
  
  //load textures
  snow = loadImage("snow.png");
  diamond = loadImage("diamond.png");
  gold = loadImage("gold.png");
  intro = loadImage("intro.png");
  
  world.textureMode(NORMAL);
  
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
  
  score = 0;
  live = 5;
  
  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
}

void draw(){
  
  if (mode == INTRO){
    intro();
  } else if (mode == GAME){
    game();
  } else if (mode == GAMEOVER){
    gameover();
  } else if (mode == PAUSE){
    pause();
  } else {
    println ("Error : Mode = " + mode);
  }  
}
