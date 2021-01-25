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
