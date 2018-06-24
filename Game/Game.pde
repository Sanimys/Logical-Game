int window_width = 700; // windows width
int window_height = 550; // windows height

Player player; // Actual player

PGraphics gameSurface; // Sufrace of gameplay
int level = 0; // Actual level number
Level_1 level1; // Level 1

float angle = TWO_PI / 6; // Angle of 60° for the hexagon

color cell_bgrd = color(127); // Color of the background of cell
color cell_hglt = color(90); // Color of the highligth of cell

enum DIRECTION {NE, E, SE, SW, W, NW}; // enum of all possible directions
enum SIDE {WALL, DOOR, HOLE};

// Init settings
void settings() {
  size(window_width, window_height, P2D);
  player = new Player();
  level = 1;
  level1 = new Level_1();
}

// Init setup
void setup() {
  gameSurface = createGraphics(width, height, P2D);
  level1.setup();
  player.setup();
}

// Continuously draw
void draw() {
  gameSurface.beginDraw();
  draw_game();
  gameSurface.endDraw();
  image(gameSurface, 0, 0);
}
