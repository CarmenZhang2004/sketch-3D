class Power extends GameObject {
  
  float m;
  
  Power() {
    loc = new PVector(random(-1500, 1500), 850, random(-1500, 1500));
    lives = 1;
    size = 50;
    m = random(-1, 1);
  }
  
  void act(){
    if(m<0) m = -1;
    if(m>=0) m = 1;
    if (Math.abs(eyex - loc.x) < 100 && Math.abs(eyez - loc.z) < 100) {
      live += m;
      lives = 0;
    }
  }
  
  void show(){
    world.pushMatrix();
    texturedCube(loc.x, loc.y, loc.z, gold, size);
    world.popMatrix();
  }
}
