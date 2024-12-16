class Snake {

  int res;
  PVector head;
  ArrayList<PVector> tail;
  PVector vel;

  Snake(PVector h, int r) {
    res = r;
    head = h;
    tail = new ArrayList<PVector>();
    vel = new PVector(0, 0);
  }

  void update() {
    tail.add(head.copy());
    tail.remove(0);
    head.add(vel);
  }

  boolean eat(PVector food) {
    if ((head.x == food.x) && (head.y == food.y)) {
      return true;
    } else {
      return false;
    }
  }

  void grow() {
    tail.add(head.copy());
    head.add(vel);
  }

  boolean bite() {
    boolean bitten = false;
    for (PVector t : tail) {
      if ((head.x == t.x) && (head.y == t.y)) {
        bitten = true;
      }
    }
    return bitten;
  }

  void show() {
    stroke(0);
    fill(150, 255, 0);
    for (PVector t : tail) {
      rect(t.x, t.y, res, res);
    }
    fill(0, 255, 0);
    rect(head.x - 0.05*res, head.y - 0.05*res, 1.1*res, 1.1*res);
  }

  void wrapEdges() {
    if (head.x < 0) {
      head.x = width - res;
    }
    if (head.x > width - res) {
      head.x = 0;
    }
    if (head.y < 0) {
      head.y = height - res;
    }
    if (head.y > height - res) {
      head.y = 0;
    }
  }
}
