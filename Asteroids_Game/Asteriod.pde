class Asteroid {

  PVector pos;
  PVector vel;
  float r;
  int n = 16;
  float[] offsets;

  Asteroid() {
    pos = new PVector(random(width), random(height));
    vel = PVector.random2D();
    r = 64;
    vel.mult(64.0/r);
    offsets = new float[n];
    for (int i = 0; i < n; i++) {
      offsets[i] = random(-0.25*r, 0.25*r);
    }
  }

  Asteroid(PVector p, float radius) {
    pos = p.copy();
    vel = PVector.random2D();
    r = radius;
    vel.mult(64.0/r);
    offsets = new float[n];
    for (int i = 0; i < n; i++) {
      offsets[i] = random(-0.25*r, 0.25*r);
    }
  }

  void update() {
    pos.add(vel);
  }

  boolean hit(Laser l) {
    float d = dist(pos.x, pos.y, l.pos.x, l.pos.y);
    if (d < r) {
      return true;
    } else {
      return false;
    }
  }

  boolean hit(Spaceship s) {
    float d = dist(pos.x, pos.y, s.pos.x, s.pos.y);
    if (d < r+s.r) {
      return true;
    } else {
      return false;
    }
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    strokeWeight(1);
    fill(0);
    beginShape();
    for (int i = 0; i < n; i++) {
      float a = map(i, 0, n, 0, TWO_PI);
      float x = (r+offsets[i])*cos(a);
      float y = (r+offsets[i])*sin(a);
      vertex(x, y);
    }
    endShape(CLOSE);
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
