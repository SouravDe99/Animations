char checkWinner(char[][] grid) {
  char winner = ' ';
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows-3; j++) {
      if ((grid[i][j] != ' ') && (grid[i][j] == grid[i][j+1]) && (grid[i][j] == grid[i][j+2]) && (grid[i][j] == grid[i][j+3])) {
        winner = grid[i][j];
      }
    }
  }
  for (int i = 0; i < cols-3; i++) {
    for (int j = 0; j < rows; j++) {
      if ((grid[i][j] != ' ') && (grid[i][j] == grid[i+1][j]) && (grid[i][j] == grid[i+2][j]) && (grid[i][j] == grid[i+3][j])) {
        winner = grid[i][j];
      }
    }
  }
  for (int i = 0; i < cols-3; i++) {
    for (int j = 0; j < rows-3; j++) {
      if ((grid[i][j] != ' ') && (grid[i][j] == grid[i+1][j+1]) && (grid[i][j] == grid[i+2][j+2]) && (grid[i][j] == grid[i+3][j+3])) {
        winner = grid[i][j];
      }
    }
  }
  for (int i = 0; i < cols-3; i++) {
    for (int j = 3; j < rows; j++) {
      if ((grid[i][j] != ' ') && (grid[i][j] == grid[i+1][j-1]) && (grid[i][j] == grid[i+2][j-2]) && (grid[i][j] == grid[i+3][j-3])) {
        winner = grid[i][j];
      }
    }
  }
  int spacesLeft = 0;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == ' ') {
        spacesLeft++;
      }
    }
  }
  if ((winner == ' ') && (spacesLeft == 0)) {
    winner = '-';
  }
  return winner;
}
