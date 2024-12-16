ArrayList<Boid> boids;
PVector[][] grid;

void setup() {
  //size(960, 540);
  fullScreen();
  boids = new ArrayList<Boid>();
}

void draw() {
  background(255);

  for (Boid b : boids) {
    PVector f1 = b.seperate(boids);
    f1.mult(0.5);
    b.applyForce(f1);
    PVector f2 = b.align(boids);
    f2.mult(2);
    b.applyForce(f2);
    PVector f3 = b.cohesion(boids);
    f3.mult(4);
    b.applyForce(f3);
  }
  
  for (Boid b : boids) {
    b.update();
    b.wrapEdges();
    b.show();
  }
}

void mousePressed() {
  Boid temp = new Boid(mouseX, mouseY);
  boids.add(temp);
}
