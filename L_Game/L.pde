class L {
  int[][] l;
  boolean placed;
  int cx;
  int cy;
  int f;

  L(int tcx, int tcy, int tf) {
    l = new int[4][2];
    f = tf;
    cx = tcx;
    cy = tcy;
    setL();
    placed = false;
  }

  void setL() {
    switch(f) {
    case 0:
      l[0][0] = cx+1;
      l[1][0] = cx;
      l[2][0] = cx-1;
      l[3][0] = cx-1;
      l[0][1] = cy;
      l[1][1] = cy;
      l[2][1] = cy;
      l[3][1] = cy+1;
      break;
    case 1:
      l[0][0] = cx;
      l[1][0] = cx;
      l[2][0] = cx;
      l[3][0] = cx-1;
      l[0][1] = cy+1;
      l[1][1] = cy;
      l[2][1] = cy-1;
      l[3][1] = cy-1;
      break;
    case 2:
      l[0][0] = cx-1;
      l[1][0] = cx;
      l[2][0] = cx+1;
      l[3][0] = cx+1;
      l[0][1] = cy;
      l[1][1] = cy;
      l[2][1] = cy;
      l[3][1] = cy-1;
      break;
    case 3:
      l[0][0] = cx;
      l[1][0] = cx;
      l[2][0] = cx;
      l[3][0] = cx+1;
      l[0][1] = cy-1;
      l[1][1] = cy;
      l[2][1] = cy+1;
      l[3][1] = cy+1;
      break;
    case 4:
      l[0][0] = cx+1;
      l[1][0] = cx;
      l[2][0] = cx-1;
      l[3][0] = cx-1;
      l[0][1] = cy;
      l[1][1] = cy;
      l[2][1] = cy;
      l[3][1] = cy-1;
      break;
    case 5:
      l[0][0] = cx;
      l[1][0] = cx;
      l[2][0] = cx;
      l[3][0] = cx+1;
      l[0][1] = cy+1;
      l[1][1] = cy;
      l[2][1] = cy-1;
      l[3][1] = cy-1;
      break;
    case 6:
      l[0][0] = cx-1;
      l[1][0] = cx;
      l[2][0] = cx+1;
      l[3][0] = cx+1;
      l[0][1] = cy;
      l[1][1] = cy;
      l[2][1] = cy;
      l[3][1] = cy+1;
      break;
    case 7:
      l[0][0] = cx;
      l[1][0] = cx;
      l[2][0] = cx;
      l[3][0] = cx-1;
      l[0][1] = cy-1;
      l[1][1] = cy;
      l[2][1] = cy+1;
      l[3][1] = cy+1;
      break;
    }
  }

  void place(char player) {
    boolean valid = true;
    int overlap = 0;
    for (int i = 0; i < 4; i++) {
      int x = l[i][0];
      int y = l[i][1];
      if ((board[x][y] != ' ') && (board[x][y] != player)) {
        valid = false;
      }
      if (board[x][y] == player) {
        overlap++;
      }
    }
    if (overlap == 4) {
      valid = false;
    }
    if (valid) {
      for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
          if (board[i][j] == player) {
            board[i][j] = ' ';
          }
        }
      }
      for (int i = 0; i < 4; i++) {
        int x = l[i][0];
        int y = l[i][1];
        board[x][y] = player;
      }
      placed = true;
    }
  }

  void move() {
    if (!placed) {
      switch(key) {
      case 'w':
        moveUp();
        break;
      case 'a':
        moveLeft();
        break;
      case 's':
        moveDown();
        break;
      case 'd':
        moveRight();
        break;
      case 'r':
        spin();
        break;
      case 'f':
        flip();
        break;
      case 'l':
        place(turn);
        break;
      }
    }
  }

  void moveUp() {
    if ((f == 0) || (f == 6)) {
      if (cy >= 1) {
        cy--;
      }
    } else {
      if (cy >= 2) {
        cy--;
      }
    }
    setL();
  }

  void moveLeft() {
    if ((f == 3) || (f == 5)) {
      if (cx >= 1) {
        cx--;
      }
    } else {
      if (cx >= 2) {
        cx--;
      }
    }
    setL();
  }

  void moveDown() {
    if ((f == 2) || (f == 4)) {
      if (cy <= 2) {
        cy++;
      }
    } else {
      if (cy <= 1) {
        cy++;
      }
    }
    setL();
  }

  void moveRight() {
    if ((f == 1) || (f == 7)) {
      if (cx <= 2) {
        cx++;
      }
    } else {
      if (cx <= 1) {
        cx++;
      }
    }
    setL();
  }

  void spin() {
    if ((cx > 0) && (cx < 3) && (cy > 0) && (cy < 3)) {
      if ((f >= 0) && (f <= 3)) {
        f = (f+1)%4;
      }
      if ((f >= 4) && (f <= 7)) {
        f = 4+(f+1)%4;
      }
    }
    setL();
  }

  void flip() {
    if ((cx > 0) && (cx < 3) && (cy > 0) && (cy < 3)) {
      f = (f+4)%8;
    }
    setL();
  }
}
