class Enemy extends GameObject {
  
  Enemy() {
    loc = new PVector (random(-1500, 1500), 830, random(-1500, 1500));
    size = 60;
    lives = 1; 
  }
  
  void show() {
    world.pushMatrix();
    world.fill(white);
    world.noStroke();
    world.translate(loc.x, loc.y, loc.z);
    world.sphere(size);
    world.translate(loc.x, loc.y-50, loc.z);
    world.sphere(size-20);
    world.popMatrix();
  }
  
}
