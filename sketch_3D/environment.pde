void drawMap(){
  for (int x = 0; x < map.width; x++ ) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, quartzT, quartzS, quartzT, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, quartzT, quartzS, quartzT, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, quartzT, quartzS, quartzT, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, quartzT, quartzS, quartzT, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*5, y*gridSize-2000, quartzT, quartzS, quartzT, gridSize);
      }
      if (c == black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, snow, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, snow, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, snow, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, snow, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*5, y*gridSize-2000, snow, gridSize);
      }
    }
  }
}

void drawAxis(){
  world.stroke(255, 0, 0);
  world.strokeWeight(5);
  world.line(0,0,0, 2000,0,0); //x axis
  world.line(0,0,0, 0,2000,0); //y axis
  world.line(0,0,0, 0,0,2000); //z axis
  world.noFill();
  world.rect(0, 0, width, height);
}

void drawFloor(int floorStart, int floorEnd, int floorHeight, int floorSpacing){
  stroke(255);
  strokeWeight(1);
  int x = floorStart;
  int z = floorStart;
  while(z < floorEnd){
    texturedCube(x, floorHeight, z, snow, floorSpacing) ;
    x = x + floorSpacing;
    if (x >= floorEnd){
      x = floorStart;
      z = z + floorSpacing;
    }
  }
}
