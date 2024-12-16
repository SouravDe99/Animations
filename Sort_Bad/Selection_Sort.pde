void selectionsort() {

  for (int k = 0; k < len; k++) {
    if (k == min) {
      fill(0, 0, 255);
    } else if (k == i) {
      fill(255, 0, 0);
    } else if (k == j) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    rect(k*w, height-h[k], w, h[k]);
  }

  if (h[min] > h[j]) {
    min = j;
  }

  if (i < len-1) {
    if (j < len-1) {
      j++;
    } else {
      temp = h[min];
      h[min] = h[i];
      h[i] = temp;
      i++;
      j = i;
      min = i;
    }
  } else {
    noLoop();
  }
}
