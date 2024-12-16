int n;
Polytope shape;
float angle;
float scale;

void setup() {
  size(960, 540, P3D);
  n = 4;
  shape = new Polytope(n, 'h');
  angle = 0;
  scale = 250;
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);
  noFill();

  float[][] new_shape = shape.vertices.clone();

  float[][] rotate_xy = {
    {1, 0, 0, 0},
    {0, 1, 0, 0},
    {0, 0, cos(angle), -sin(angle)},
    {0, 0, sin(angle), cos(angle)}
  };

  float[][] rotate_xz = {
    {1, 0, 0, 0},
    {0, cos(angle), 0, -sin(angle)},
    {0, 0, 1, 0},
    {0, sin(angle), 0, cos(angle)}
  };

  float[][] rotate_xw = {
    {1, 0, 0, 0},
    {0, cos(angle), -sin(angle), 0},
    {0, sin(angle), cos(angle), 0},
    {0, 0, 0, 1}
  };

  float[][] rotate_yz = {
    {cos(angle), 0, 0, -sin(angle)},
    {0, 1, 0, 0},
    {0, 0, 1, 0},
    {sin(angle), 0, 0, cos(angle), 0}
  };

  float[][] rotate_yw = {
    {cos(angle), 0, -sin(angle), 0},
    {0, 1, 0, 0},
    {sin(angle), 0, cos(angle), 0},
    {0, 0, 0, 1}
  };

  float[][] rotate_zw = {
    {cos(angle), -sin(angle), 0, 0},
    {sin(angle), cos(angle), 0, 0},
    {0, 0, 1, 0},
    {0, 0, 0, 1}
  };

  for (int i = 0; i < shape.vertices.length; i++) {
    new_shape[i] = matrix_vector_multiply(rotate_xy, new_shape[i]);
    new_shape[i] = matrix_vector_multiply(rotate_xz, new_shape[i]);
    new_shape[i] = matrix_vector_multiply(rotate_xw, new_shape[i]);
    new_shape[i] = matrix_vector_multiply(rotate_yz, new_shape[i]);
    new_shape[i] = matrix_vector_multiply(rotate_yw, new_shape[i]);
    new_shape[i] = matrix_vector_multiply(rotate_zw, new_shape[i]);

    float d = 1/(2-new_shape[i][2]);

    float[][] project = {
      {d, 0, 0, 0},
      {0, d, 0, 0},
      {0, 0, d, 0},
      {0, 0, 0, 0}
    };

    new_shape[i] = matrix_vector_multiply(project, new_shape[i]);
  }

  strokeWeight(16);

  for (int i = 0; i < shape.vertices.length; i++) {
    point(new_shape[i][0] * scale, new_shape[i][1] * scale, new_shape[i][2] * scale);
  }

  strokeWeight(2);

  for (int[] index : shape.edges) {
    int i = index[0];
    int j = index[1];
    line(
      new_shape[i][0] * scale,
      new_shape[i][1] * scale,
      new_shape[i][2] * scale,
      new_shape[j][0] * scale,
      new_shape[j][1] * scale,
      new_shape[j][2] * scale
      );
  }

  angle += 0.01;
}

float[] matrix_vector_multiply(float[][] m, float[] v) {
  float[] result = new float[n];
  for (int i = 0; i < n; i++) {
    result[i] = 0;
    for (int j = 0; j < n; j++) {
      result[i] += m[i][j]*v[j];
    }
  }
  return result;
}
