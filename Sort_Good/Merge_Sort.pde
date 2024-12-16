void mergesort(int[] arr, int start, int end) {
  if (start < end) {
    int mid = (start + end) / 2;
    mergesort(arr, start, mid);
    mergesort(arr, mid+1, end);
    merge(arr, start, mid, end);
  }
}

void merge(int[] arr, int start, int mid, int end) {
  int i = 0, j = 0;
  int k = start;
  int[] larr = new int[mid - start + 1];
  int[] rarr = new int[end - mid];
  for (int p = 0; p < mid - start + 1; p++) {
    larr[p] = arr[p + start];
  }
  for (int p = 0; p < end - mid; p++) {
    rarr[p] = arr[p + mid + 1];
  }
  while ((i < mid - start + 1) && (j < end - mid)) {
    if (larr[i] < rarr[j]) {
      arr[k] = larr[i];
      i++;
    } else {
      arr[k] = rarr[j];
      j++;
    }
    k++;
  }
  while (i < mid - start + 1) {
    arr[k] = larr[i];
    i++;
    k++;
  }
  while (j < end - mid) {
    arr[k] = rarr[j];
    j++;
    k++;
  }
}
