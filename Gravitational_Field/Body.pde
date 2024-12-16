class Body {
  float mass;
  float radius;
  PVector position;
  PVector velocity;
  PVector accelaration;

  Body(float x, float y) {
    mass = random(8, 32);
    radius = map(mass, 8, 32, 10, 50);
    position = new PVector(x, y);
    velocity =  new PVector(0, 0);
    accelaration = new PVector(0, 0);
  }

  void applyForce(PVector f) {
    PVector force = f.copy();
    force.div(mass);
    accelaration.add(force);
  }

  void update() {
    velocity.add(accelaration);
    position.add(velocity);
    accelaration = new PVector(0, 0);
  }

  PVector attractBody(Body b) {
    PVector position1 = position.copy();
    PVector position2 = b.position.copy();
    PVector force = position2.sub(position1);
    float distance = force.mag();
    if (distance < (radius + b.radius)) {
      distance = radius + b.radius;
    }
    float magnitude = (G*mass*b.mass)/(distance*distance);
    force.setMag(magnitude);
    return force;
  }

  void show() {
    noStroke();
    fill(255, 128);
    circle(position.x, position.y, 2*radius);
  }
}
