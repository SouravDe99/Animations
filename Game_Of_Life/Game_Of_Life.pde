int[][] grid;
int[][] temp;
int r;
int rows;
int cols;
boolean set;

void setup() {
  //fullScreen();
  size(960, 540);
  r = 30;
  cols = width/r;
  rows = height/r;
  grid = new int[cols][rows];
  temp = new int[cols][rows];
  set = false;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = 0;
      temp[i][j] = grid[i][j];
    }
  }
}

void draw() {
  frameRate(10);
  background(255);
  stroke(128);
  strokeWeight(2);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == 0) {
        fill(0);
      }
      if (grid[i][j] == 1) {
        fill(255);
      }
      rect(i*r, j*r, r, r);
    }
  }

  if (keyPressed) {
    if (key == 's') {
      set = true;
    }
  }

  if (set) {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int neighbours = countNeighbours(i, j);
        switch(grid[i][j]) {
        case 0:
          if (neighbours == 3) {
            temp[i][j] = 1;
          }
          break;
        case 1:
          if ((neighbours < 2) || (neighbours > 3)) {
            temp[i][j] = 0;
          }
          break;
        default:
          temp[i][j] = grid[i][j];
        }
      }
    }

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j] = temp[i][j];
      }
    }
  }
}

int countNeighbours(int x, int y) {
  int neighbours = 0;
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int nx = (x+i+cols)%cols;
      int ny = (y+j+rows)%rows;
      neighbours += grid[nx][ny];
    }
  }
  neighbours -= grid[x][y];
  return neighbours;
}

void mousePressed() {
  if (!set) {
    int x = floor(mouseX/r);
    int y = floor(mouseY/r);
    switch(grid[x][y]) {
    case 0:
      grid[x][y] = 1;
      break;
    case 1:
      grid[x][y] = 0;
      break;
    }
    temp[x][y] = grid[x][y];
  }
}
