int len;
int w;
int[] h;

void setup() {
  size(960, 540);
  //frameRate(10);
  len = 48;
  w = width/len;
  h = new int[len];
  for (int k = 0; k < len; k++) {
    h[k] = 1+(int)random(height-1);
  }
}

void draw() {
  background(0);
  stroke(0);
  strokeWeight(2);

  //quicksort(h, 0, len-1);
  mergesort(h, 0, len-1);

  for (int k = 0; k < len; k++) {
    fill(255);
    rect(k*w, height-h[k], w, h[k]);
  }

  noLoop();
}

void display(int start, int end) {
  background(0);
  stroke(0);
  strokeWeight(2);

  for (int k = 0; k < len; k++) {
    if ((k == start) || (k == end)) {
      fill(0, 0, 255);
    } else {
      fill(255);
    }
    rect(k*w, height-h[k], w, h[k]);
  }
}
