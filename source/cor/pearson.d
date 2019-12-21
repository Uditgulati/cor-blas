module cor.pearson;

import cblas : dot, gemm, Transpose, Order;
import std.stdio;
import std.math : sqrt;

import cor.utils: mean;

double pearson_vecvec(const double* x, const double* y, const int n) {
  double[] minusmean_x = new double[n];
  double[] minusmean_y = new double[n];

  double normx = 0.0, normy = 0.0;

  double meanx = mean(x, n);
  double meany = mean(y, n);

  //calc minusmean_x, minusmean_y
  for(int i = 0; i < n; i++) {
    minusmean_x[i] = x[i] - meanx;
    minusmean_y[i] = y[i] - meany;
  }

  //calc dot product
  double dp = dot(n, x, 1, y, 1);
  writefln("%f\n", dp);

  //calc normx
  //calc normx

  double cor = dp / sqrt(normx * normy);
  return cor;
}