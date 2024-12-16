ArrayList<Body> bodies;
PVector[][] grid;
int r;
int rows;
int cols;
int alpha = 255;
float G = 128;

void setup() {
  //size(960, 540);
  fullScreen();
  r = 45;
  cols = width/r + 1;
  rows = height/r + 1; 
  grid = new PVector[cols][rows];
  bodies = new ArrayList<Body>();
}

void draw() {
  background(0);

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

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      PVector force = new PVector();
      PVector position1 = new PVector(i*r, j*r);
      for (Body b : bodies) {
        PVector position2 = b.position.copy();
        PVector newForce = position2.sub(position1);
        float distance = newForce.mag();
        if (distance < b.radius) {
          distance = b.radius;
        }
        float magnitude = (G*b.mass)/(distance*distance);
        newForce.setMag(magnitude);
        force.add(newForce);
      }
      if (force.mag() > 0) {
        alpha = (int)map(force.mag(), 0, 1, 16, 255);
        stroke(255, alpha);
        strokeWeight(2);
        pushMatrix();
        translate(i*r, j*r);
        rotate(force.heading());
        line(0, 0, 0.5*r, 0);
        line(0.5*r - 0.125*r, 0.125*r, 0.5*r, 0);
        line(0.5*r - 0.125*r, -0.125*r, 0.5*r, 0);
        popMatrix();
      }
    }
  }
}

void mousePressed() {
  Body temp = new Body(mouseX, mouseY);
  bodies.add(temp);
}
