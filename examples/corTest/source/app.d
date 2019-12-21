import cor.pearson;
import std.stdio;


void main() {
  double[] A = [1, 2];
  double val = pearson_vecvec(A.ptr, A.ptr, 2);
}