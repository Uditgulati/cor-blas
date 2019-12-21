module cor.utils;

double mean(const double* x, const int n) {
  double sum = 0.0;

  for(int i = 0; i < n; i++) {
    sum += x[i];
  }

  return (sum / cast(double)n);
}