int res = 30;
float x, y;

void setup() {
  size(960, 540);
  background(255);
  x = 0;
  y = 0;
}

void draw() {
  stroke(0);
  strokeWeight(4);
  if (random(1) < 0.5) {
    line(x, y, x+res, y+res);
  } else {
    line(x+res, y, x, y+res);
  }
  x += res;
  if (x >= width) {
    x = 0;
    y += res;
  }
  if (y >= height) {
    noLoop();
  }
}
