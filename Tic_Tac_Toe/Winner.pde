char checkWinner(char[][] grid) {
  char winner = ' ';
  winner = check(grid, winner, 0, 0, 0, 1, 0, 2);
  winner = check(grid, winner, 1, 0, 1, 1, 1, 2);
  winner = check(grid, winner, 2, 0, 2, 1, 2, 2);
  winner = check(grid, winner, 0, 0, 1, 0, 2, 0);
  winner = check(grid, winner, 0, 1, 1, 1, 2, 1);
  winner = check(grid, winner, 0, 2, 1, 2, 2, 2);
  winner = check(grid, winner, 0, 0, 1, 1, 2, 2);
  winner = check(grid, winner, 0, 2, 1, 1, 2, 0);
  if (winner == algorithm) {
    winner = 'A';
  }
  if (winner == human) {
    winner = 'H';
  }
  int spacesLeft = count(grid);
  if ((winner == ' ') && (spacesLeft == 0)) {
    winner = '-';
  }
  return winner;
}

char check(char[][] grid, char winner, int i1, int j1, int i2, int j2, int i3, int j3) {
  if ((grid[i2][j2] != ' ') && (grid[i1][j1] == grid[i2][j2]) && (grid[i2][j2] == grid[i3][j3])) {
    winner = grid[i2][j2];
  }
  return winner;
}

int count(char[][] grid) {
  int emptySpaces = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (grid[i][j] == ' ') {
        emptySpaces++;
      }
    }
  }
  return emptySpaces;
}
