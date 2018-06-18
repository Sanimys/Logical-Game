int window_width = 640;
int window_height = 480;

Player player;

PGraphics gameSurface;
int level = 0;
Level_1 level1;

float angle = TWO_PI / 6;

enum DIRECTION {NE, E, SE, SW, W, NW};

void settings() {
  size(window_width, window_height, P2D);
  player = new Player();
  level = 1;
  level1 = new Level_1();
  noLoop();
}

void setup() {
  gameSurface = createGraphics(width, height, P2D);
  level1.setup();
  player.setup();
}

void draw() {
  gameSurface.beginDraw();
  draw_game();
  gameSurface.endDraw();
  image(gameSurface, 0, 0);
}