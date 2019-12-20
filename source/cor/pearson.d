module cor.pearson;

double pearson_vecvec(const double* x, const double* y, const int n) {
  double* minusmean_x, minusmean_y;

  double normx, normy;
  double meanx, meany;

  //find mean of x and y

  //calc minusmean_x, minusmean_y
  //after memory alloc

  //calc dot product

  //calc normx
  //calc normx

  free(minusmean_x);
  free(minusmean_y);

  double cor = cp / sqrt(normx * normy);
  return cor;
}