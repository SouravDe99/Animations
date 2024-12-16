void quicksort(int[] arr, int start, int end) {
  if (start < end) {
    int index = partition(arr, start, end);
    quicksort(arr, start, index-1);
    quicksort(arr, index+1, end);
  }
}

int partition(int[] arr, int start, int end) {
  int pivot = arr[end];
  int index = start;
  int temp;
  for (int i = start; i < end; i++) {
    if (arr[i] < pivot) {
      temp = arr[i];
      arr[i] = arr[index];
      arr[index] = temp;
      index++;
    }
  }
  arr[end] = arr[index];
  arr[index] = pivot;
  return index;
}
