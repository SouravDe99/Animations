Snake s;
PVector food;
int res;
int rows;
int cols;

void setup() {
  frameRate(10);
  size(960, 540);
  res = 30;
  cols = width/res;
  rows = height/res;
  PVector pos = new PVector(cols/2, rows/2);
  pos.mult(res);
  s = new Snake(pos, res);
  createfood();
}

void draw() {
  background(255);

  stroke(0);
  fill(255, 0, 0);
  circle(food.x + res/2, food.y + res/2, res);

  s.show();
  s.update();
  s.wrapEdges();
  if (s.eat(food)) {
    s.grow();
    createfood();
  }
  if (s.bite()) {
    println("Game Over");
    println("Score: " + (1 + s.tail.size()));
    noLoop();
  }
}

void createfood() {
  int x = (int)(Math.random()*cols);
  int y = (int)(Math.random()*rows);
  food = new PVector(x*res, y*res);
}

void keyPressed() {
  PVector vel = new PVector();
  switch(keyCode) {
  case UP:
    vel = new PVector(0, -1);
    break;
  case LEFT:
    vel = new PVector(-1, 0);
    break;
  case DOWN:
    vel = new PVector(0, 1);
    break;
  case RIGHT:
    vel = new PVector(1, 0);
    break;
  }
  vel.mult(res);
  if (s.tail.size() > 0) {
    if ((vel.x + s.vel.x != 0) && (vel.y + s.vel.y != 0)) {
      s.vel = vel;
    }
  } else {
    s.vel = vel;
  }
  draw();
}
