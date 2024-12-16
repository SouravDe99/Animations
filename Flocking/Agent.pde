class Boid {

  float mass;
  float radius;
  PVector position;
  PVector velocity;
  PVector accelaration;
  float maxSpeed;
  float maxForce;
  float vison;

  Boid(float x, float y) {
    mass = 16;
    radius = 16;
    position = new PVector(x, y);
    velocity =  PVector.random2D();
    accelaration = new PVector(0, 0);
    maxSpeed = 8;
    maxForce = 16;
    vison = 128;
  }

  void applyForce(PVector f) {
    PVector force = f.copy();
    force.div(mass);
    accelaration.add(force);
  }

  void update() {
    velocity.add(accelaration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    accelaration = new PVector(0, 0);
  }

  PVector seperate(ArrayList<Boid> boids) {
    int count = 0;
    PVector desired = new PVector(0, 0);
    for (Boid b : boids) {
      float d = PVector.dist(position, b.position);
      if ((d > 0) && (d < vison)) {
        PVector distance = PVector.sub(position, b.position);
        desired.add(distance);
        count++;
      }
    }
    if (count > 0) {
      desired.div(count);
      desired.setMag(maxSpeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector align(ArrayList<Boid> boids) {
    int count = 0;
    PVector desired = new PVector(0, 0);
    for (Boid b : boids) {
      float d = PVector.dist(position, b.position);
      if ((d > 0) && (d < vison)) {
        desired.add(b.velocity);
        count++;
      }
    }
    if (count > 0) {
      desired.div(count);
      desired.setMag(maxSpeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector cohesion(ArrayList<Boid> boids) {
    int count = 0;
    PVector desired = new PVector(0, 0);
    for (Boid b : boids) {
      float d = PVector.dist(position, b.position);
      if ((d > 0) && (d < vison)) {
        desired.add(b.position);
        count++;
      }
    }
    if (count > 0) {
      desired.div(count);
      desired.setMag(maxSpeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  void show() {
    noStroke();
    fill(128, 128);
    //circle(position.x, position.y, 2*radius);
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading());
    triangle(0, 0.5*radius, 2*radius, 0, 0, -0.5*radius);
    popMatrix();
    stroke(0);
    noFill();
    //circle(position.x, position.y, 2*vison);
  }
  
  void wrapEdges() {
    if (position.x < 0) {
      position.x = width;
    }
    if (position.x > width) {
      position.x = 0;
    }
    if (position.y < 0) {
      position.y = height;
    }
    if (position.y > height) {
      position.y = 0;
    }
  }
}
