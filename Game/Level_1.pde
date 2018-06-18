class Level_1 {
  Cell cells[][];
  PVector pos_ini = new PVector(100, 100);
  int[] startCell = {3, 3};
  float[] startPos = new float[2];
  
  float radius = 50;
  int nbLines = 4;
  int nbCols = 5;

  void display() {
    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[0].length; j++) {
        cells[i][j].display();
      }
    }
  }

  void setup() {
    cells = new Cell[nbLines][nbCols];
    float posX = pos_ini.x;
    float posY = pos_ini.y;
    
    int count = 0;

    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[i].length; j++) {
        cells[i][j] = new Cell(posX, posY, radius);
        cells[i][j].setup();

        posX += sqrt(3) * radius;
      }
      posY += 3 * radius / 2;
      if(count % 2 == 0) posX = pos_ini.x - sqrt(3) * radius / 2;
      else posX = pos_ini.x;
      
      count ++;
    }
    
    Cell tmp = cells[(int)startCell[0] - 1][(int)startCell[1] - 1];
    startPos[0] = tmp.position.x;
    startPos[1] = tmp.position.y;
  }
  
  PVector get_position(int line, int col) {
    PVector pos = new PVector(cells[line-1][col-1].position.x, cells[line-1][col-1].position.y);
    return pos;
  }
}