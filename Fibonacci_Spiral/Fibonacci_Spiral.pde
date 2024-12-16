float s;
float q;

void setup() {
  size(987, 610);
  s = height;
}

void draw() {
  background(0);
  noFill();
    
  q = map(mouseY, 0, height, 0, (float)width/height - 1);
  
  rotate(-HALF_PI);
  translate(-height, 0);
  
  stroke(255, 50);
  strokeWeight(4);
  arc(s/2, s/2, sqrt(2)*s, sqrt(2)*s, QUARTER_PI, QUARTER_PI + acos((1-q*q)/(1+q*q)));
  
  for (int i = 0; i < 16; i++) {
    stroke(255, 100);
    strokeWeight(4);
    square(0, 0, s*pow(q,i));
    
    stroke(255);
    strokeWeight(4);
    arc(0, s*pow(q,i), 2*s*pow(q,i), 2*s*pow(q,i), -HALF_PI, 0);
    
    translate(s*pow(q,i), s*pow(q,i));
    rotate(HALF_PI);
  } 
}
