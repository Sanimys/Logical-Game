class Player {
  PVector position;
  int[] actualCell = new int[2];
  float speed = 3;

  float radius = 25;
  color couleur = color(50, 50, 150);
  
  boolean move = false;

  void display() {
    gameSurface.fill(couleur);
    println(position.x + " " + position.y);
    gameSurface.ellipse(position.x, position.y, radius, radius);
    
    if(!move) triangles();
  }

  void setup() {
    position = new PVector(level1.startPos[0], level1.startPos[1]);
    
    actualCell[0] = level1.startCell[0];
    actualCell[1] = level1.startCell[1];
  }

  void triangles() {
    gameSurface.fill(255, 255, 255);
    for (float ang = -PI/3; ang < TWO_PI - PI/3; ang += angle) {
      float x1 = position.x + cos(ang) * (40);
      float y1 = position.y + sin(ang) * (40);
      float x2 = position.x + cos(ang + PI/8) * (28);
      float y2 = position.y + sin(ang + PI/8) * (28);
      float x3 = position.x + cos(ang - PI/8) * (28);
      float y3 = position.y + sin(ang - PI/8) * (28);

      gameSurface.triangle(x1, y1, x2, y2, x3, y3);
    }
  }
  
  void move_player(DIRECTION dir) {
    
  }
}