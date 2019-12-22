module cor.spearman;

import cblas : dot, syrk, Transpose, Order, Uplo;
import std.stdio;
import std.math : sqrt;

import cor.utils : mean, rank;

double spearman_vecvec(const double* x, const double* y, const int n) {
  double[] copy_x = new double[n];
  double[] copy_y = new double[n];

  for(int i = 0; i < n; i++) {
    copy_x[i] = x[i];
    copy_y[i] = y[i];
  }

  double* rank_x = rank(copy_x.ptr, n);
  double* rank_y = rank(copy_y.ptr, n);

  double meanx = mean(rank_x, n);
  double meany = mean(rank_y, n);

  //calc minusmean_x, minusmean_y
  for(int i = 0; i < n; i++) {
    *(rank_x + i) -= meanx;
    *(rank_y + i) -= meany;
  }

  //calc dot product
  double dp = dot(n, rank_x, 1, rank_y, 1);

  //calc normx & normy
  double normx = dot(n, rank_x, 1, rank_x, 1);
  double normy = dot(n, rank_y, 1, rank_y, 1);

  double cor = dp / sqrt(normx * normy);
  return cor;
}