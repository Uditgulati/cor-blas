import os
import ctypes
import numpy as np


cor_lib_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../build/cor.so"))
cor_lib = ctypes.CDLL(cor_lib_path)

# Pearson
pearson = cor_lib.pearson_vecvec

pearson.restype = ctypes.c_double

a = np.array([1, 2, 3, 4], dtype=ctypes.c_double)
b = np.array([1, 0, 30, 4], dtype=ctypes.c_double)
res = ctypes.c_double()
n = ctypes.c_int(4)

doublep = ctypes.POINTER(ctypes.c_double)

a1 = a.ctypes.data_as(doublep)
b1 = b.ctypes.data_as(doublep)

print(pearson(a1, b1, n))

# Spearman
spearman = cor_lib.spearman_vecvec

spearman.restype = ctypes.c_double

a = np.array([1, 2, 3, 4], dtype=ctypes.c_double)
b = np.array([1, 0, 30, 4], dtype=ctypes.c_double)
res = ctypes.c_double()
n = ctypes.c_int(4)

doublep = ctypes.POINTER(ctypes.c_double)

a1 = a.ctypes.data_as(doublep)
b1 = b.ctypes.data_as(doublep)

print(spearman(a1, b1, n))