class Enemy extends GameObject {
  
  PVector dir;
  float vx = cos(leftRightAngle);
  float vy = tan(upDownAngle);
  float vz = sin(leftRightAngle);
  
  Enemy() {
    loc = new PVector(random(-1500, 1500), 800, random(-1500, 1500));
    size = 100;
    lives = 1;
  }
    
  void act() {
    vx = eyex - loc.x;
    vz = eyez - loc.z;
    dir = new PVector(vx, vy, vz);
    dir.setMag(2);  
    
    int i = 0;
    while(i < objects.size()){
    GameObject obj = objects.get(i);
    if(obj instanceof Bullet){
      if(dist(loc.x, loc.z, obj.loc.x, obj.loc.z)<=size/2+obj.size){
        objects.add(new Particle(loc));
        obj.lives = 0;
        lives = 0;
        score++;
        }
      }
      i++;
    }
    
    if(Math.abs(eyex - loc.x) < 100 && Math.abs(eyez - loc.z) < 100){
      hurt = true;
    }
  }
  
  void show() {
    world.pushMatrix();
    world.fill(200);
    world.noStroke();
    world.translate(loc.x, loc.y, loc.z);
    world.sphere(size);
    world.popMatrix();
  }
}
