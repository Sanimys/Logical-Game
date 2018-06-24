DIRECTION direction;

// If the mouse is pressed
void mousePressed() {
  // If the player is static, then do what is needed for the player to maybe move
  if (!player.move) {
    DIRECTION dir = direction_by_mouse(mouseX, mouseY);
    player.check_cell(dir);
    clear_col();
  }
}

// If the mouse is moving
void mouseMoved() {
  // If the player is static, then highlight cases
  if (!player.move) {
    DIRECTION dir = direction_by_mouse(mouseX, mouseY);
    
    // Clear the latest highlight
    if (dir != direction && direction != null) {
      highlight_line(direction, false);
    }
    
    // Highlight in the direction of the mouse
    direction = dir;
    highlight_line(dir, true);
  }
}

// Compute the direction depending on X, Y and the position of the player
private DIRECTION direction_by_mouse(float x, float y) {
  PVector pos = new PVector(x, y);
  PVector playPos = player.position;

  // alpha: angle between R and H (from the player)
  float alpha = acos((sqrt(3) * level1.radius / 2) / level1.radius);
  // beta : angle between mouseX and mouseY (from the player)
  float beta = atan(abs(pos.y - playPos.y) / abs(pos.x - playPos.x));

  //Determine position
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

// Highlight a line of cells in the chosen direction
private void highlight_line(DIRECTION dir, boolean dark) {
  level1.highlight_line(dir, dark);
}

// Clear every cell highlight
void clear_col() {
  level1.clear_col();
}
