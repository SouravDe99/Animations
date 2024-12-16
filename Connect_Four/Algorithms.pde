void randomMove() {
  int x = floor(random(cols));
  int y = -1;
  for (int k = 0; k < rows; k++) {
    if (board[x][k] == ' ') {
      y = k;
    }
  }
  if (y != -1) {
    board[x][y] = 'A';
    turn = 'H';
  } else {
    randomMove();
  }
}

int bestX = -1;
int bestY = -1;

void bestMove() {
  char[][] grid = new char[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = board[i][j];
    }
  }
  minimax(grid, 0, -2, 2, 'A');
  board[bestX][bestY] = 'A';
  turn = 'H';
}

int minimax(char[][] grid, int depth, int alpha, int beta, char player) {
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
    for (int i = 0; i < cols; i++) {
      int j = -1;
      for (int k = 0; k < rows; k++) {
        if (grid[i][k] == ' ') {
          j = k;
        }
      }
      if (j != -1) {
        grid[i][j] = 'A';
        int score = minimax(grid, depth+1, alpha, beta, 'H');
        grid[i][j] = ' ';
        if (score > maxScore) {
          maxScore = score;
          if (depth == 0) {
            bestX = i;
            bestY = j;
          }
        }
        if (score > alpha) {
          alpha = score;
        }
        if (beta <= alpha) {
          break;
        }
      }
    }
    return maxScore;
  case 'H':
    int minScore = 2;
    for (int i = 0; i < cols; i++) {
      int j = -1;
      for (int k = 0; k < rows; k++) {
        if (grid[i][k] == ' ') {
          j = k;
        }
      }
      if (j != -1) {
        grid[i][j] = 'H';
        int score = minimax(grid, depth+1, alpha, beta, 'A');
        grid[i][j] = ' ';
        if (score < minScore) {
          minScore = score;
        }
        if (score < beta) {
          beta = score;
        }
        if (beta <= alpha) {
          break;
        }
      }
    }
    return minScore;
  }
  return 0;
}
