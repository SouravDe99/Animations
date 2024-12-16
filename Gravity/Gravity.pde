ArrayList<Body> bodies;
float G = 15;

void setup() {
  size(960, 540);
  //fullScreen();
  bodies = new ArrayList<Body>();
}

void draw() {
  background(255);
  for (Body b1 : bodies) {
    for (Body b2 : bodies) {
      if (b1 != b2) {
        PVector f = b1.attractBody(b2);
        b1.applyForce(f);
      }
    }
  }
  for (Body b : bodies) {
    b.update();
    b.show();
  }
}

void mousePressed() {
  Body temp = new Body(mouseX, mouseY);
  bodies.add(temp);
}
