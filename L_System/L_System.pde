System L;

void setup() {
  size(960, 540);
  L = new System(3);
  L.str = L.axiom;
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);

  translate(width/2, height-14);
  rotate(PI);

  for (int i = 0; i < L.str.length(); i++) {
    switch(L.str.charAt(i)) {
    case 'A':
      line(0, 0, 0, L.len);
      translate(0, L.len);
      break;
    case 'B':
      line(0, 0, 0, L.len);
      translate(0, L.len);
      break;
    case '+':
      rotate(L.angle);
      break;
    case '-':
      rotate(-L.angle);
      break;
    case '[':
      push();
      break;
    case ']':
      pop();
      break;
    }
  }
}

void mousePressed() {
  String newstr = "";
  boolean replaced;
  for (int i = 0; i < L.str.length(); i++) {
    replaced = false;
    for (char rule : L.rules.keySet()) {
      if (L.str.charAt(i) == rule) {
        newstr += L.rules.get(rule);
        replaced = true;
      }
    }
    if (!replaced) {
      newstr += L.str.charAt(i);
    }
  }
  L.str = newstr;
  L.len *= L.factor;
}
