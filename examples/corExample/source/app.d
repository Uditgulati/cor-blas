import cor.pearson;
import cor.spearman;
import std.stdio;
import std.datetime;


void main() {
  double[] A = [];
  double[] B = [];

  for(int i = 0; i < 1000000; i++) {
    A ~= (i + 1);
    B ~= (i + 1);
  }

  StopWatch sw;

  sw.start();
  for(int i = 0; i < 1; i++) {
    double val = pearson_vecvec(A.ptr, B.ptr, 1000000);
  }
  sw.stop();

  writeln(sw.peek().msecs);
}