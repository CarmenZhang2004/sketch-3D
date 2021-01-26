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
