import os
import time
import ctypes
import numpy as np


cor_lib_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "../build/cor.so"))
cor_lib = ctypes.CDLL(cor_lib_path)

# Pearson
pearson = cor_lib.pearson_vecvec
pearson.restype = ctypes.c_double

# Spearman
spearman = cor_lib.spearman_vecvec
spearman.restype = ctypes.c_double

N = 10**6

a = np.random.randint(100, size=N)
a = a.astype(ctypes.c_double)
b = np.random.randint(100, size=N)
b = b.astype(ctypes.c_double)
res = ctypes.c_double()
n = ctypes.c_int(N)

doublep = ctypes.POINTER(ctypes.c_double)

a1 = a.ctypes.data_as(doublep)
b1 = b.ctypes.data_as(doublep)

t1 = time.time()
print(pearson(a1, b1, n))
t2 = time.time()

print("Time elapsed for pearson_vecvec: ", t2 - t1)

t3 = time.time()
print(spearman(a1, b1, n))
t4 = time.time()

print("Time elapsed for spearman_vecvec: ", t4 - t3)