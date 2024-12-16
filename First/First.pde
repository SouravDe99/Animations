int r = 25;
float x, y;
float vx, vy;
float damp = 0.75;

void setup() {
  size(960, 540);
  x = r;
  y = r;
  vx = 6.25;
  vy = 6.25;
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  fill(255, 150, 150);
  circle(x, y, 2*r);
  
  x += vx;
  y += vy;
  
  reflectOffEdges();
}

void reflectOffEdges(){
  if(x < r){
    vx *= (-1)*damp;
    x = r;
  }
   if(x > width-r){
    vx *= (-1)*damp;
    x = width-r;
  }
   if(y < r){
    vy *= (-1)*damp;
    y = r;
  }
   if(y > height-r){
    vy *= (-1)*damp;
    y = height-r;
  }
}
