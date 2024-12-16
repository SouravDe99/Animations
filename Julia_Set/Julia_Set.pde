float r;
int n;
float cx;
float cy;

void setup() {
  size(625, 625);
  r = 2.5;
  n = 50;
  cx = 0;
  cy = 0;
}

void draw() {
  background(255);
  loadPixels();
  cx = map(mouseX, 0, width, -r, r);
  cy = map(mouseY, 0, height, -r, r);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int index = i+j*width;
      float x = map(i, 0, width, -r, r);
      float y = map(j, 0, height, -r, r);
      int k = 0;
      while ((x*x+y*y < 2*r*r) && (k < n)) {
        float nx = x*x-y*y + cx;
        float ny = 2*x*y + cy;
        x = nx;
        y = ny;
        k++;
      }
      float c = map(k, 0, n, 255, 0);
      pixels[index] = color(c);
    }
  }
  updatePixels();
  stroke(128);
  strokeWeight(1);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}
