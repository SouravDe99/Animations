int[][] grid;
int r;
int rows;
int cols;
boolean set;

void setup() {
  //fullScreen();
  size(500, 400);
  r = 100;
  cols = width/r;
  rows = height/r;
  grid = new int[cols][rows];
  set = false;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = -1;
    }
  }
}

void draw() {
  frameRate(10);
  background(115);
  noStroke();

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == -1) {
        fill(49);
      }
      if (grid[i][j] == 1) {
        fill(246, 247, 167);
      }
      circle(i*r+r/2, j*r+r/2, 3*r/4);
    }
  }

  if (keyPressed) {
    if (key == 's') {
      set = true;
    }
  }
}

void mousePressed() {
  int x = floor(mouseX/r);
  int y = floor(mouseY/r);
  if (!set) {
    grid[x][y] *= -1;
  }
  if (set) {
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if ((x+i >= 0) && (x+i <= cols-1) && (y+j >= 0) && (y+j <= rows-1)) {
          grid[x+i][y+j] *= -1;
        }
      }
    }
  }
}
