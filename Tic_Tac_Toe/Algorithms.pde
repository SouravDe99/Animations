void randomMove() {
  int x = floor(random(3));
  int y = floor(random(3));
  if (board[x][y] == ' ') {
    board[x][y] = algorithm;
    turn = 'H';
  } else {
    randomMove();
  }
}

int bestX = -1;
int bestY = -1;

void bestMove() {
  char[][] grid = new char[3][3];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      grid[i][j] = board[i][j];
    }
  }
  minimax(grid, 0, 'A');
  board[bestX][bestY] = algorithm;
  turn = 'H';
}

int minimax(char[][] grid, int depth, char player) {
  char winner = checkWinner(grid);
  switch(winner) {
  case 'A':
    return 1;
  case 'H':
    return -1;
  case '-':
    return 0;
  }
  switch(player) {
  case 'A':
    int maxScore = -2;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == ' ') {
          grid[i][j] = algorithm;
          int score = minimax(grid, depth+1, 'H');
          grid[i][j] = ' ';
          if (score > maxScore) {
            maxScore = score;
            if (depth == 0) {
              bestX = i;
              bestY = j;
            }
          }
        }
      }
    }
    return maxScore;
  case 'H':
    int minScore = 2;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == ' ') {
          grid[i][j] = human;
          int score = minimax(grid, depth+1, 'A');
          grid[i][j] = ' ';
          if (score < minScore) {
            minScore = score;
          }
        }
      }
    }
    return minScore;
  default:
    return 0;
  }
}
