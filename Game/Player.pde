class Player {
  PVector position;
  PVector destination;
  int[] actualCell = new int[2];
  float speed = 3;

  float radius = 25;
  color couleur = color(50, 50, 150);

  boolean move = false;
  boolean evenLine;

  void display() {
    gameSurface.fill(couleur);
    gameSurface.stroke(0);
    gameSurface.ellipse(position.x, position.y, radius, radius);
    if (!move) {
      display_static();
    }
  }

  void setup() {
    position = new PVector(level1.startPos[0], level1.startPos[1]);
    destination = new PVector(level1.startPos[0], level1.startPos[1]);

    actualCell[0] = level1.startCell[0];
    actualCell[1] = level1.startCell[1];

    evenLine = actualCell[0] % 2 == 0;
  }

  void display_static() {
    gameSurface.fill(255);
    gameSurface.stroke(0);
    for (float ang = -PI/3; ang < TWO_PI - PI/3; ang += angle) {
      float x1 = position.x + cos(ang) * (40);
      float y1 = position.y + sin(ang) * (40);
      float x2 = position.x + cos(ang + PI/8) * (28);
      float y2 = position.y + sin(ang + PI/8) * (28);
      float x3 = position.x + cos(ang - PI/8) * (28);
      float y3 = position.y + sin(ang - PI/8) * (28);

      gameSurface.triangle(x1, y1, x2, y2, x3, y3);
    }
    
    //gameSurface.stroke(200, 40, 40);
    //for (float ang = -PI/2; ang < TWO_PI - PI/2; ang += angle) {
    //  float sx = position.x + cos(ang) * 10000;
    //  float sy = position.y + sin(ang) * 10000;
      
    //  gameSurface.line(position.x, position.y, sx, sy);
    //}
  }

  void move(DIRECTION dir) {
    evenLine = actualCell[0] % 2 == 0;

    switch (dir) {
    case NE:
      actualCell[0]--;
      actualCell[1] = evenLine ? actualCell[1] : actualCell[1]+1;
      break;
    case E:
      actualCell[1]++;
      break;
    case SE:
      actualCell[0]++;
      actualCell[1] = evenLine ? actualCell[1] : actualCell[1]+1;
      break;
    case SW :
      actualCell[0]++;
      actualCell[1] = evenLine ? actualCell[1]-1 : actualCell[1];
      break;
    case W :
      actualCell[1]--;
      break;
    case NW :
      actualCell[0]--;
      actualCell[1] = evenLine ? actualCell[1]-1 : actualCell[1];
      break;
    default :
      println("ERROR : Direction doesn't exist ! ");
      break;
    }
    destination = level1.get_position(actualCell[0], actualCell[1]);
      
      position = destination;
  }
}