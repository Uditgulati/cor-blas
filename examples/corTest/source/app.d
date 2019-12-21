import cor.pearson;
import std.stdio;


void main() {
  double[] A = [1, 2, 3, 1];
  double[] B = [4, 1, 2, 10];
  double val = pearson_vecvec(A.ptr, B.ptr, 4);
  writeln(val);
}