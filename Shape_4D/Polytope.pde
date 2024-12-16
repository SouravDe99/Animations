class Polytope {

  float[][] vertices;
  ArrayList<int[]> edges;

  Polytope(int n, char s) {
    switch(s) {
    case 's':
      simplex(n);
      break;
    case 'o':
      orthoplex(n);
      break;
    case 'c':
      cube(n);
      break;
    case 'h':
      hyperdiamond(n);
      break;
    }
  }

  void simplex(int n) {
    println(n+"-simplex");
    float[][] temp = {
      {0.5, 0.5, 0.5, -0.5/sqrt(5)},
      {0.5, -0.5, -0.5, -0.5/sqrt(5)},
      {-0.5, 0.5, -0.5, -0.5/sqrt(5)},
      {-0.5, -0.5, 0.5, -0.5/sqrt(5)},
      {0, 0, 0, (4*0.5)/sqrt(5)}
    };
    vertices = new float[temp.length][n];
    for (int i = 0; i < temp.length; i++) {
      for (int j = 0; j < n; j++) {
        vertices[i][j] = temp[i][j];
      }
    }
    edges = new ArrayList<int[]>();
    for (int i = 0; i < vertices.length; i++) {
      for (int j = i+1; j < vertices.length; j++) {
        int[] index = {i, j};
        edges.add(index);
      }
    }
  }

  void orthoplex(int n) {
    println(n+"-orthoplex");
    float[][] temp = {
      {-1, 0, 0, 0},
      {0, -1, 0, 0},
      {0, 0, -1, 0},
      {0, 0, 0, -1},
      {1, 0, 0, 0},
      {0, 1, 0, 0},
      {0, 0, 1, 0},
      {0, 0, 0, 1}
    };
    vertices = new float[temp.length][n];
    for (int i = 0; i < temp.length; i++) {
      for (int j = 0; j < n; j++) {
        vertices[i][j] = temp[i][j];
      }
    }
    edges = new ArrayList<int[]>();
    for (int i = 0; i < vertices.length; i++) {
      for (int j = i+1; j < vertices.length; j++) {
        float d = 0;
        for (int k = 0; k < n; k++) {
          d += (vertices[i][k] - vertices[j][k]) * (vertices[i][k] - vertices[j][k]);
        }
        if (d == 2) {
          int[] index = {i, j};
          edges.add(index);
        }
      }
    }
  }

  void cube(int n) {
    println(n+"-cube");
    float[][] temp = {
      {-0.5, -0.5, -0.5, -0.5},
      {0.5, -0.5, -0.5, -0.5},
      {-0.5, 0.5, -0.5, -0.5},
      {-0.5, -0.5, 0.5, -0.5},
      {-0.5, -0.5, -0.5, 0.5},
      {0.5, 0.5, -0.5, -0.5},
      {0.5, -0.5, 0.5, -0.5},
      {0.5, -0.5, -0.5, 0.5},
      {-0.5, 0.5, 0.5, -0.5},
      {-0.5, 0.5, -0.5, 0.5},
      {-0.5, -0.5, 0.5, 0.5},
      {0.5, 0.5, 0.5, -0.5},
      {0.5, 0.5, -0.5, 0.5},
      {0.5, -0.5, 0.5, 0.5},
      {-0.5, 0.5, 0.5, 0.5},
      {0.5, 0.5, 0.5, 0.5}
    };
    vertices = new float[temp.length][n];
    for (int i = 0; i < temp.length; i++) {
      for (int j = 0; j < n; j++) {
        vertices[i][j] = temp[i][j];
      }
    }
    edges = new ArrayList<int[]>();
    for (int i = 0; i < vertices.length; i++) {
      for (int j = i+1; j < vertices.length; j++) {
        float d = 0;
        for (int k = 0; k < n; k++) {
          d += (vertices[i][k] - vertices[j][k]) * (vertices[i][k] - vertices[j][k]);
        }
        if (d == 1) {
          int[] index = {i, j};
          edges.add(index);
        }
      }
    }
  }

  void hyperdiamond(int n) {
    println("hyper-diamond");
    float [][] temp = {
      {-1, 0, 0, 0},
      {0, -1, 0, 0},
      {0, 0, -1, 0},
      {0, 0, 0, -1},
      {1, 0, 0, 0},
      {0, 1, 0, 0},
      {0, 0, 1, 0},
      {0, 0, 0, 1},
      {-0.5, -0.5, -0.5, -0.5},
      {0.5, -0.5, -0.5, -0.5},
      {-0.5, 0.5, -0.5, -0.5},
      {-0.5, -0.5, 0.5, -0.5},
      {-0.5, -0.5, -0.5, 0.5},
      {0.5, 0.5, -0.5, -0.5},
      {0.5, -0.5, 0.5, -0.5},
      {0.5, -0.5, -0.5, 0.5},
      {-0.5, 0.5, 0.5, -0.5},
      {-0.5, 0.5, -0.5, 0.5},
      {-0.5, -0.5, 0.5, 0.5},
      {0.5, 0.5, 0.5, -0.5},
      {0.5, 0.5, -0.5, 0.5},
      {0.5, -0.5, 0.5, 0.5},
      {-0.5, 0.5, 0.5, 0.5},
      {0.5, 0.5, 0.5, 0.5}
    };
    vertices = new float[temp.length][n];
    for (int i = 0; i < temp.length; i++) {
      for (int j = 0; j < n; j++) {
        vertices[i][j] = temp[i][j];
      }
    }
    edges = new ArrayList<int[]>();
    for (int i = 0; i < vertices.length; i++) {
      for (int j = i+1; j < vertices.length; j++) {
        float d = 0;
        for (int k = 0; k < n; k++) {
          d += (vertices[i][k] - vertices[j][k]) * (vertices[i][k] - vertices[j][k]);
        }
        if (d == 1) {
          int[] index = {i, j};
          edges.add(index);
        }
      }
    }
  }
}
