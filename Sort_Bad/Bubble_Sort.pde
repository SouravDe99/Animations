void bubblesort() {

  for (int k = 0; k < len; k++) {
    if (k == j+1) {
      fill(0, 255, 0);
    } else if (k == j) {
      fill(0, 0, 255);
    } else if (k == len-i-1) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    rect(k*w, height-h[k], w, h[k]);
  }

  if (h[j] > h[j+1]) {
    temp = h[j+1];
    h[j+1] = h[j];
    h[j] = temp;
  }

  if (i < len-1) {
    if (j < len-i-2) {
      j++;
    } else {
      i++;
      j = 0;
    }
  } else {
    noLoop();
  }
}
