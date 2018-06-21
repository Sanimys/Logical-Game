DIRECTION direction;

void mousePressed() {
  if (!player.move) {
    DIRECTION dir = direction_by_mouse(mouseX, mouseY);
    player.change_direction(dir);
    clear_col();
  }
}

void mouseMoved() {
  if (!player.move) {
    DIRECTION dir = direction_by_mouse(mouseX, mouseY);

    if (dir != direction && direction != null) {
      println(direction);
      highlight_line(direction, false);
    }

    direction = dir;
    highlight_line(dir, true);
  }
}

DIRECTION direction_by_mouse(float x, float y) {
  PVector pos = new PVector(x, y);
  PVector playPos = player.position;

  float alpha = acos((sqrt(3) * level1.radius / 2) / level1.radius);
  float beta = atan(abs(pos.y - playPos.y) / abs(pos.x - playPos.x));

  if (pos.x > playPos.x) {
    if (beta < alpha && beta > -alpha) return DIRECTION.E;
    else if (pos.y < playPos.y) return DIRECTION.NE;
    else if (pos.y >= playPos.y) return DIRECTION.SE;
  } else if (pos.x <= playPos.x) {
    if (beta < alpha && beta > -alpha) return DIRECTION.W;
    else if (pos.y < playPos.y) return DIRECTION.NW;
    else if (pos.y >= playPos.y) return DIRECTION.SW;
  }

  return DIRECTION.NE;
}

void highlight_line(DIRECTION dir, boolean dark) {
  level1.highlight_line(dir, dark);
}

void clear_col() {
  level1.clear_col();
}