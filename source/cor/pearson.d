module cor.pearson;

import cblas : dot, syrk, Transpose, Order, Uplo;
import std.stdio;
import std.math : sqrt;

import cor.utils: mean, initializeIfNotAlreadyDone;

extern (C) double pearson_vecvec(const double* x, const double* y, const int n) {
  initializeIfNotAlreadyDone();

  double[] minusmean_x = new double[n];
  double[] minusmean_y = new double[n];

  double meanx = mean(x, n);
  double meany = mean(y, n);

  //calc minusmean_x, minusmean_y
  for(int i = 0; i < n; i++) {
    minusmean_x[i] = x[i] - meanx;
    minusmean_y[i] = y[i] - meany;
  }

  //calc dot product
  double dp = dot(n, minusmean_x.ptr, 1, minusmean_y.ptr, 1);

  //calc normx & normy
  double normx = dot(n, minusmean_x.ptr, 1, minusmean_x.ptr, 1);
  double normy = dot(n, minusmean_y.ptr, 1, minusmean_y.ptr, 1);

  double cor = dp / sqrt(normx * normy);
  return cor;
}