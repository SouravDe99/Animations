char[][] board;
int rows;
int cols;
int r;
char turn;

void settings() {
  //cols = 7;
  //rows = 6;
  cols = 5;
  rows = 4;
  r = 125;
  size(cols*r, rows*r);
}

void setup() {
  board = new char[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = ' ';
    }
  }
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      rect(i*r, j*r, r, r);
    }
  }
  turn = 'A';
  //turn = 'H';
}

void draw() {
  frameRate(12);
  switch(turn) {
  case 'A':
    //randomMove();
    bestMove();
    break;
  case 'H':
    if (mousePressed) {
      int x = floor(mouseX/r);
      int y = -1;
      for (int k = 0; k < rows; k++) {
        if (board[x][k] == ' ') {
          y = k;
        }
      }
      if (y != -1) {
        board[x][y] = 'H';
        turn = 'A';
      }
    }
    break;
  }

  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      rect(i*r, j*r, r, r);
    }
  }

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      noStroke();
      if (board[i][j] == 'A') {
        fill(0, 255, 0);
        circle(i*r+0.5*r, j*r+0.5*r, 0.5*r);
      }
      if (board[i][j] == 'H') {
        fill(0, 0, 255);
        circle(i*r+0.5*r, j*r+0.5*r, 0.5*r);
      }
    }
  }

  char winner = checkWinner(board);
  if (winner != ' ') {
    switch(winner) {
    case 'A':
      println("Algorithm wins");
      break;
    case 'H':
      println("Human wins");
      break;
    case '-':
      println("Tie");
      break;
    }
    noLoop();
  }
}
