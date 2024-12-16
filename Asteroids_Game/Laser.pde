class Laser {

  PVector pos;
  PVector vel;

  Laser(PVector p, float angle) {
    pos = p.copy();
    vel = PVector.fromAngle(angle);
    vel.mult(16);
  }

  void update() {
    pos.add(vel);
  }

  void show() {
    pushMatrix();
    stroke(255);
    strokeWeight(4);
    point(pos.x, pos.y);
    popMatrix();
  }

  boolean outOfEdges() {
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      return true;
    } else {
      return false;
    }
  }
}
