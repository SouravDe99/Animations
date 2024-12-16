int r = 25;
ArrayList<Ball> balls;
PVector gravity = new PVector(0, 0.25);
float damp = 0.9375;

void setup() {
  size(960, 540);
  balls = new ArrayList<Ball>();
}

void mousePressed() {
  Ball temp = new Ball(mouseX, mouseY);
  balls.add(temp);
}

void draw() {
  background(255);
  for (Ball b : balls) {
    b.applyForce(gravity);
    b.show();
  }
}
