module cor.utils;

import std.stdio;
import std.algorithm.sorting; //sort() method
import std.typecons;  //Tulpe
import core.runtime: Runtime;

bool initialized = false;

void initializeIfNotAlreadyDone() {
  if (!initialized) {
    Runtime.initialize();
    initialized = true;
  }
}

double mean(const double* x, const int n) {
  double sum = 0.0;

  for(int i = 0; i < n; i++) {
    sum += x[i];
  }

  return (sum / cast(double)n);
}

double median(const double* x, const int n) {
  if(n % 2) { //odd length
    return x[n / 2];
  }
  else {  //even legth
    return (x[n/2] + x[n/2 - 1]) / 2.00;
  }
}

double* rank(double* x, const int n) {
  Tuple!(double, int)[] index_pairs = new Tuple!(double, int)[n];
  for(int i = 0; i <  n; i++) {
    index_pairs[i] = tuple(x[i], i);
  }

  index_pairs.sort();

  double[] ranks = new double[n];

  for(int i = 0 ; i < n; i++) {
    int index = index_pairs[i][1];
    ranks[index] = i + 1;
  }

  return ranks.ptr;
}