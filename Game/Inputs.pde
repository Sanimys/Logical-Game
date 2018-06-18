void mousePressed() {
  PVector pos = new PVector(mouseX, mouseY);
  PVector playPos = player.position;
  
  float alpha = acos((sqrt(3) * level1.radius / 2) / level1.radius);
  float beta = atan(abs(pos.y - playPos.y) / abs(pos.x - playPos.x));
  
  if(pos.x > playPos.x){
    println(alpha + " " + beta);
    println(pos.x + " . " + playPos.x);
    println(pos.y + " ... " + playPos.y);
    if(beta < alpha && beta > -alpha) player.move(DIRECTION.E);
    else if(pos.y < playPos.y) player.move(DIRECTION.NE);
    else if(pos.y >= playPos.y) player.move(DIRECTION.SE);
  }
  else if(pos.x <= playPos.x) {
    println(alpha + " " + beta);
    println(pos.x + " . " + playPos.x);
    println(pos.y + " ... " + playPos.y);
    if(beta < alpha && beta > -alpha) player.move(DIRECTION.W);
    else if(pos.y < playPos.y) player.move(DIRECTION.NW);
    else if(pos.y >= playPos.y) player.move(DIRECTION.SW);
  }
}