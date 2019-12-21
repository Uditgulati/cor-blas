module cor.utils;

double mean(const double* x, int n) {
  double sum = 0.0;

  for(int i = 0; i < n; i++) {
    sum += x[i];
  }

  return (sum / cast(double)n);
}

double crossprod() {
  return 0.0;
}