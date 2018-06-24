class Cell {
  private PShape cell = new PShape(); // Shape of the cell
  float radius; // Radius
  float h; // High, from center to shortest side
  
  PVector position; // Position (x, y) of the cell
  color couleur; // Color of the cell

  // Constructor
  Cell(float x, float y, float radius) {
    position = new PVector(x, y);
    this.radius = radius;
    h = sqrt(3) * radius / 2;
    couleur = cell_bgrd;
  }
  
  // Display cell
  void display() {
    gameSurface.shape(cell);
  }

  // Setup of cell, create the hexa-shape
  void setup() {
    cell = createShape();
    cell.beginShape();
    cell.stroke(170);
    cell.strokeWeight(8);
    cell.fill(couleur);
    
    // Hexagon
    for (float ang = -PI/2; ang < TWO_PI - PI/2; ang += angle) {
      float sx = position.x + cos(ang) * radius;
      float sy = position.y + sin(ang) * radius;
      cell.vertex(sx, sy);
    }
    cell.endShape(CLOSE);
  }
  
  void change_color(color col) {
    couleur = color(col);
    setup();
  }
}
