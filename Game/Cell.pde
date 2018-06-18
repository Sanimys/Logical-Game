class Cell {
  PShape cell = new PShape();
  float radius;
  PVector position;

  Cell(float x, float y, float radius) {
    position = new PVector(x, y);
    this.radius = radius;
  }

  void display() {
    gameSurface.shape(cell);
  }

  void setup() {
    cell = createShape();
    cell.beginShape();
    cell.stroke(0);
    cell.strokeWeight(2);
    cell.fill(127);
    for (float ang = -PI/2; ang < TWO_PI - PI/2; ang += angle) {
      float sx = position.x + cos(ang) * radius;
      float sy = position.y + sin(ang) * radius;
      cell.vertex(sx, sy);
    }
    cell.endShape(CLOSE);
  }
}