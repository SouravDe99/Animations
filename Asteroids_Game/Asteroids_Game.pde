Spaceship s;
ArrayList<Asteroid> asteroids;
ArrayList<Laser> lasers;
int score;
int lives;
float text;

void setup() {
  fullScreen();
  s = new Spaceship();
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 8; i++) {
    asteroids.add(new Asteroid());
  }
  lasers = new ArrayList<Laser>();
  score = 0;
  lives = 5;
  text = 32;
}

void draw() {
  background(0);

  fill(255);
  textSize(text);
  text("Score = "+score, 0, text);
  text("Lives = "+lives, 0, 2*text);

  if (asteroids.size() == 0 || lives == 0) {
    fill(255);
    textSize(4*text);
    text("GAME OVER", 0.5*width-11.5625*text, 0.5*height+1.5*text);
    noLoop();
  }

  for (Asteroid a : asteroids) {
    a.show();
    a.update();
    a.wrapEdges();
  }

  for (Laser l : lasers) {
    l.show();
    l.update();
  }

  s.show();
  s.update();
  s.wrapEdges();

  for (int i = 0; i < lasers.size(); i++) {
    Laser l = lasers.get(i);
    if (l.outOfEdges()) {
      lasers.remove(l);
    }
  }

  for (int i = 0; i < lasers.size(); i++) {
    Laser l = lasers.get(i);
    for (int j = 0; j < asteroids.size(); j++) {
      Asteroid a = asteroids.get(j);
      if (a.hit(l)) {
        score++;
        if (a.r > s.r) {
          asteroids.add(new Asteroid(a.pos, 0.5*a.r));
          asteroids.add(new Asteroid(a.pos, 0.5*a.r));
        }
        asteroids.remove(a);
        lasers.remove(l);
        break;
      }
    }
  }

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a = asteroids.get(i);
    if (a.hit(s)) {
      lives--;
      if (a.r > s.r) {
        asteroids.add(new Asteroid(a.pos, 0.5*a.r));
        asteroids.add(new Asteroid(a.pos, 0.5*a.r));
      }
      asteroids.remove(a);
      s.reset();
      break;
    }
  }
}

void keyPressed() {
  if (key == 'd') {
    s.rightTurn = 0.0625;
  }
  if (key == 'a') {
    s.leftTurn = 0.0625;
  }
  if (key == 'w') {
    s.thrust = 0.625;
  }
}

void keyReleased() {
  if (key == 'd') {
    s.rightTurn = 0;
  }
  if (key == 'a') {
    s.leftTurn = 0;
  }
  if (key == 'w') {
    s.thrust = 0;
  }
}

void mousePressed() {
  lasers.add(new Laser(s.pos, s.heading));
  s.nextShotAllowed = false;
}

void mouseReleased() {
  s.nextShotAllowed = true;
}
