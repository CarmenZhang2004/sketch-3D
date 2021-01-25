class Particle extends GameObject {
  int alpha;
  
  Particle(){
  loc = new PVector (loc.x+2000, loc.y+2000);
  }
  
  Particle(float x, float y){
    loc = new PVector (x, y);
    velo = new PVector(1, 0);
    velo.rotate (random(TWO_PI));
    lives = 1;
    size = 2;
    alpha = 255;
  }
  
  void show(){
  strokeWeight(3);
  stroke(255, alpha);
  fill(0, alpha);
  rect(loc.x, loc.y, size, size);
  alpha = alpha - 1;
  if (alpha <= 0) lives = 0;
  }
}
