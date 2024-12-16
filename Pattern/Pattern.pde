int n;
float factor;
float r;
PVector[] points;

void setup() {
  size(960, 540);
  n = 72;
  factor = 0;
  r = 0.25*width;
}

void draw() {
  background(0);
  translate(0.5*width, 0.5*height);
  colorMode(HSB);
  float h = map(factor, 0, n, 0, 255);
  stroke(h, 255, 255);
  strokeWeight(2);
  noFill();
  circle(0, 0, 2*r);
  float angle = TWO_PI/n;
  for (int i = 0; i < n; i++) {
    float a1 = i*angle;
    float a2 = (factor*i%n)*angle;
    float x1 = r*cos(a1);
    float y1 = r*sin(a1);
    float x2 = r*cos(a2);
    float y2 = r*sin(a2);
    line(x1, y1, x2, y2);
  }
  factor += 0.005;
  if (factor > n) {
    factor = 0;
  }
}
