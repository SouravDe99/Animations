import peasy.*;

float x, y, z;
float dx, dy, dz;
float sigma = 10;
float rho = 28;
float beta = 8.0 / 3.0;
float dt = 0.01;
float col = 0;
ArrayList<PVector> points;
PeasyCam cam;

void setup() {
  size(960, 540, P3D);
  //fullScreen(P3D);
  colorMode(HSB);
  x = 1;
  y = 1;
  z = 1;
  points = new ArrayList<PVector>();
  cam = new PeasyCam(this, 125);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(4);
  noFill();

  dx = (sigma * (y - x)) * dt;
  dy = (x * (rho - z) - y) * dt;
  dz = (x * y - beta * z) * dt;

  x += dx;
  y += dy;
  z += dz;

  points.add(new PVector(x, y, z));

  col = 0;
  beginShape();
  for (PVector v : points) {
    stroke(col, 255, 255, 128);
    vertex(v.x, v.y, v.z);
    col++;
    if (col > 255) {
      col = 0;
    }
  }
  endShape();
}
