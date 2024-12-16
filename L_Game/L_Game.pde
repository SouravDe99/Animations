char[][] board;
int r;
char turn;
L h;
L a;
boolean nPlaced;

void setup() {
  size(400, 575);
  r = width/4;
  board = new char[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      board[i][j] = ' ';
    }
  }
  h = new L(2, 1, 1);
  h.place('H');
  a = new L(1, 2, 3);
  a.place('A');
  board[0][0] = 'N';
  board[3][3] = 'N';
  nPlaced = true;
  humanTurn();
  //algorithmStart();
}

void humanTurn() {
  turn = 'H';
  h.placed = false;
}

void algorithmTurn() {
  turn = 'A';
  a.placed = false;
}

void nextTurn() {
  switch(turn) {
  case 'H':
    if (h.placed) {
      algorithmTurn();
    }
    break;
  case 'A':
    if (a.placed) {
      humanTurn();
    }
    break;
  }
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      rect(i*r, j*r, r, r);
    }
  }

  fill(0);  
  textSize(22);
  text("Use w, a, s, d to move L piece", 0, 400+24);
  text("Use r to rotate L piece", 0, 400+48);
  text("Use f to flip L piece", 0, 400+72);
  text("Press l to place L piece", 0, 400+96);
  text("Click to select any Neutral piece", 0, 400+120);
  text("Click again to place Neutral piece", 0, 400+144);
  text("Press n to skip moving Neutral piece", 0, 400+168);

  fill(255, 0, 0, 128);
  for (int i = 0; i < 4; i++) {
    rect(h.l[i][0]*r, h.l[i][1]*r, r, r);
  }
  fill(0, 0, 255, 128);
  for (int i = 0; i < 4; i++) {
    rect(a.l[i][0]*r, a.l[i][1]*r, r, r);
  }
  fill(0, 128);
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (board[i][j] == 'N') {
        circle(i*r+r/2, j*r+r/2, r);
      }
    }
  }
}

void keyPressed() {
  switch(turn) {
  case 'H':
    h.move();
    break;
  case 'A':
    a.move();
    break;
  }
  if (key == 'n') {
    nextTurn();
  }
}

void mousePressed() {
  if (h.placed && a.placed) {
    int x = floor(mouseX/r);
    int y = floor(mouseY/r);
    switch(board[x][y]) {
    case ' ':
      if (!nPlaced) {
        board[x][y] = 'N';
        nPlaced = true;
        nextTurn();
      }
      break;
    case 'N':
      if (nPlaced) {
        board[x][y] = ' ';
        nPlaced = false;
      }
      break;
    }
  }
}
