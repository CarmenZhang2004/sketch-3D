class Snow extends GameObject {
  
  int time;

  PVector dir;
  float speed;

  Snow() {
    loc = new PVector(random(-2000+gridSize,2000-gridSize),-2000,random(-2000+gridSize,2000-gridSize));
    speed = 10;
    float vx = 0;
    float vy = 1;
    float vz = 0;
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);  
    time = 0;
  }

  void act() {
    int hitx = int(loc.x+2000)/gridSize;
    int hity = int(loc.z+2000)/gridSize;

    if (loc.y >=height && time > 800) {
      loc.y = height + 1;
      dir.setMag(0);
    } else if (map.get(hitx, hity) == white || time < 100) {
      loc.add(dir); 
      if (dir.x > 0) {
        dir.x--;
      }
      if (dir.x < 0) {
        dir.x = 0;
      }
      if (dir.z > 0) {
        dir.z--;
      }
      if (dir.z < 0) {
        dir.z = 0;
      }     
      if (loc.y > height) {
        loc.y = height;
      }
    }
    
    if(time > 1000){
     lives = 0; 
    }
    time++;
  }
  
  
  void show(){
    world.pushMatrix();
    world.translate(loc.x,loc.y,loc.z);
    world.fill(white);
    world.noStroke();
    world.box(size);
    world.popMatrix();  
  }
}
