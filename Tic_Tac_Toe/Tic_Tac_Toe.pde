char[][] board;
int r;
char turn;
char human;
char algorithm;

void setup() {
  size(540, 540);
  r = width/3;
  board = new char[3][3];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = ' ';
    }
  }
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      rect(i*r, j*r, r, r);
    }
  }
  algorithmStart();
  //humanStart();
}

void algorithmStart() {
  algorithm = 'X';
  human = 'O';
  turn = 'A';
}

void humanStart() {
  human = 'X';
  algorithm = 'O';
  turn = 'H';
}

void draw() {
  switch(turn) {
  case 'A':
    bestMove();
    //randomMove();
    break;
  case 'H':
    if (mousePressed) {
      int x = floor(mouseX/r);
      int y = floor(mouseY/r);
      if (board[x][y] == ' ') {
        board[x][y] = human;
        turn = 'A';
      }
    }
    break;
  }

  background(255);
  stroke(0);
  strokeWeight(3);
  noFill();

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      rect(i*r, j*r, r, r);
    }
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 'X') {
        line(i*r+0.25*r, j*r+0.25*r, i*r+0.75*r, j*r+0.75*r);
        line(i*r+0.75*r, j*r+0.25*r, i*r+0.25*r, j*r+0.75*r);
      }
      if (board[i][j] == 'O') {
        circle(i*r+0.5*r, j*r+0.5*r, 0.5*r);
      }
    }
  }

  char winner = checkWinner(board);
  if (winner != ' ') {
    switch(winner) {
    case 'A':
      println("Algorithm("+algorithm+") wins");
      break;
    case 'H':
      println("Human("+human+") wins");
      break;
    case '-':
      println("Tie");
      break;
    }
    noLoop();
  }
}
