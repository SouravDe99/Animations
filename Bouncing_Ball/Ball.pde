class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  int len = 8;
  PVector[] trail;
  float col;

  Ball(float start_x, float start_y) {
    pos = new PVector(start_x, start_y);
    col = map(pos.y, 0, height, 0, 255);
    float start_v = random(4, 16);
    vel = PVector.random2D();
    vel.mult(start_v);
    acc = new PVector(0, 0);
    trail = new PVector[len];
    for (int i = 0; i < len; i++) {
      trail[i] = pos;
    }
  }

  void applyForce(PVector temp_acc) {
    acc = temp_acc;
    update();
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    bounceOffEdges();

    for (int i = 0; i < len-1; i++) {
      trail[i] = trail[i+1];
    }
    trail[len-1] = pos.copy();
  }

  void show() {
    colorMode(HSB);
    noStroke();
    for (int i = 0; i < len; i++) {
      float a = map(i, 0, len, 0, 255);
      fill(col, 255, 255, a);
      circle(trail[i].x, trail[i].y, 2*r);
    }
    stroke(0);
    strokeWeight(2);
    fill(col, 255, 255);
    circle(pos.x, pos.y, 2*r);
  }

  void bounceOffEdges() {
    if (pos.x < r) {
      vel.x *= (-1)*damp;
      pos.x = r;
    }
    if (pos.x > width-r) {
      vel.x *= (-1)*damp;
      pos.x = width-r;
    }
    if (pos.y < r) {
      vel.y *= (-1)*damp;
      pos.y = r;
    }
    if (pos.y > height-r) {
      vel.y *= (-1)*damp;
      pos.y = height-r;
    }
  }
}
