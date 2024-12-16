int len;
int w;
int[] h;
int min;
int i, j, temp;

void setup() {
  size(960, 540);
  //frameRate(20);
  len = 48;
  w = width/len;
  h = new int[len];
  for (int k = 0; k < len; k++) {
    h[k] = 1+(int)random(height-1);
  }
  i = 0;
  j = 0;
  min = 0;
}

void draw() {
  background(0);
  stroke(0);
  strokeWeight(2);

  //bubblesort();
  selectionsort();
}
