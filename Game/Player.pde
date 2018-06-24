class Player {
  PVector position;
  PVector destination;
  DIRECTION direction;

  int[] actualCell = new int[2];
  int[] destCell = new int[2];
  float speed = 10;

  float radius = 25;
  color couleur = color(50, 50, 150);

  boolean move = false;
  boolean evenLine;
  boolean canMove = false;
  boolean atDestination = true;

  void display() {
    //if(canMove) println(canMove);
    //println(actualCell[0] + " " + actualCell[1]);
    //println(position.x + " " + position.y);

    if (canMove && atDestination) {
      change_direction(direction);
    }

    atDestination = check_dest();

    println(" -- " + atDestination + canMove + move);
    if (!move) {
      println("static");
      display_static();
    } else if (canMove && !atDestination) {
      println("move");
      check_cell(direction);
      move(direction);
    } else {
      println("chelou");
      if (atDestination) {
        check_cell(direction);
        move = canMove;
      }
      actualCell[0] = destCell[0];
      actualCell[1] = destCell[1];
    }

    gameSurface.fill(couleur);
    gameSurface.stroke(0);
    gameSurface.ellipse(position.x, position.y, radius, radius);
  }

  void setup() {
    position = new PVector(level1.startPos[0], level1.startPos[1]);
    destination = new PVector(level1.startPos[0], level1.startPos[1]);

    actualCell[0] = level1.startCell[0];
    actualCell[1] = level1.startCell[1];

    evenLine = actualCell[0] % 2 == 0;
  }

  void display_static() {
    //gameSurface.fill(255);
    //gameSurface.stroke(0);
    //for (float ang = -PI/3; ang < TWO_PI - PI/3; ang += angle) {
    //  float x1 = position.x + cos(ang) * (40);
    //  float y1 = position.y + sin(ang) * (40);
    //  float x2 = position.x + cos(ang + PI/8) * (28);
    //  float y2 = position.y + sin(ang + PI/8) * (28);
    //  float x3 = position.x + cos(ang - PI/8) * (28);
    //  float y3 = position.y + sin(ang - PI/8) * (28);

    //  gameSurface.triangle(x1, y1, x2, y2, x3, y3);
    //}

    //gameSurface.stroke(200, 40, 40);
    //for (float ang = -PI/2; ang < TWO_PI - PI/2; ang += angle) {
    //  float sx = position.x + cos(ang) * 10000;
    //  float sy = position.y + sin(ang) * 10000;

    //  gameSurface.line(position.x, position.y, sx, sy);
    //}
  }

  void change_direction(DIRECTION dir) {
    move = true;
    direction = dir;
    check_cell(direction);
    destination = canMove? move_cell(direction) : position;
  }

  void check_cell(DIRECTION dir) {
    int line = actualCell[0];
    int col = actualCell[1];
    int maxL = level1.nbLines;
    int maxC = level1.nbCols;
    evenLine = line % 2 == 0;
    println(evenLine);

    switch (dir) {
    case NE:
      canMove = (line > 1 && col < maxC) || (line != 0 && evenLine);
      break;
    case E:
      canMove = col < maxC;
      break;
    case SE:
      canMove = (line < maxL && col < maxC) || (line != maxL && evenLine);
      break;
    case SW :
      canMove = (line < maxL && col > 1)  || (line != maxL && !evenLine);
      break;
    case W :
      canMove = actualCell[1] > 1;
      break;
    case NW :
      canMove = (line > 1 && col > 1)  || (line != 1 && !evenLine);
      break;
    default :
      println("ERROR : Direction doesn't exist ! ");
      break;
    }

    direction = dir;
  }

  PVector move_cell(DIRECTION dir) {
    destCell[0] = actualCell[0];
    destCell[1] = actualCell[1];
    evenLine = actualCell[0] % 2 == 0;

    switch (dir) {
    case NE:
      destCell[0]--;
      destCell[1] = evenLine ? destCell[1] : destCell[1]+1;
      break;
    case E:
      destCell[1]++;
      break;
    case SE:
      destCell[0]++;
      destCell[1] = evenLine ? destCell[1] : destCell[1]+1;
      break;
    case SW :
      destCell[0]++;
      destCell[1] = evenLine ? destCell[1]-1 : destCell[1];
      break;
    case W :
      destCell[1]--;
      break;
    case NW :
      destCell[0]--;
      destCell[1] = evenLine ? destCell[1]-1 : destCell[1];
      break;
    default :
      println("ERROR : Direction doesn't exist ! ");
      break;
    }

    move = true;
    direction = dir;

    PVector pos = level1.get_position(destCell[0], destCell[1]);
    return pos;
  }

  void move(DIRECTION dir) { 
    float intX = level1.interX * speed;
    float intY = level1.interY * speed;

    switch (dir) {
    case NE:
      position.x = position.x + intX;
      position.y = position.y - intY;
      break;
    case E:
      position.x = intX + position.x + intY;
      break;
    case SE:
      position.x = position.x + intX;
      position.y = position.y + intY;
      break;
    case SW :
      position.x = position.x - intX;
      position.y = position.y + intY;
      break;
    case W :
      position.x = position.x - intY - intX;
      break;
    case NW :
      position.x = position.x - intX;
      position.y = position.y - intY;
      break;
    default :
      println("ERROR : Direction doesn't exist ! ");
      break;
    }

    level1.check_move(position.x, position.y);
  }

  boolean check_dest() {
    boolean arrived = false;
    float epsilon = 1;

    println("->" + position.x + " " + position.y);
    println("->" + destination.x + " " + destination.y);

    if (position.x >= destination.x - epsilon && position.x <= destination.x + epsilon) {
      if (position.y >= destination.y - epsilon && position.y <= destination.y + epsilon) {
        arrived = true;
      }
    } 

    return arrived;
  }
}
