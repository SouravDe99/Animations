class Spaceship {

  PVector pos;
  float heading;
  PVector vel;
  float rightTurn;
  float leftTurn;
  float thrust;
  boolean nextShotAllowed;
  float r = 16;

  Spaceship() {
    pos = new PVector(0.5*width, 0.5*height);
    heading = -HALF_PI;
    vel = new PVector(0, 0);
    rightTurn = 0;
    leftTurn = 0;
    thrust = 0;
    nextShotAllowed = true;
  }

  void update() {
    heading += rightTurn;
    heading -= leftTurn;
    PVector acc = PVector.fromAngle(heading);
    acc.mult(thrust);
    vel.add(acc);
    pos.add(vel);
    vel.mult(0.95);
  }

  void reset() {
    pos = new PVector(0.5*width, 0.5*height);
    heading = -HALF_PI;
    vel = new PVector(0, 0);
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(heading + HALF_PI);
    stroke(255);
    strokeWeight(2);
    fill(0);
    triangle(sqrt(3)*r, r, -sqrt(3)*r, r, 0, -2*r);
    line(sqrt(3)*r, r, (sqrt(3)+0.5)*r, (1+0.5*sqrt(3))*r);
    line(-sqrt(3)*r, r, -(sqrt(3)+0.5)*r, (1+0.5*sqrt(3))*r);
    popMatrix();
  }

  void wrapEdges() {
    if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.y < 0) {
      pos.y = height;
    }
    if (pos.y > height) {
      pos.y = 0;
    }
  }
}
