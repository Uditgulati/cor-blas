module cor.utils;

import std.stdio;
import std.algorithm.sorting;
import std.typecons;

double mean(const double* x, const int n) {
  double sum = 0.0;

  for(int i = 0; i < n; i++) {
    sum += x[i];
  }

  return (sum / cast(double)n);
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