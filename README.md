# Correlation OpenBLAS

Implementation of pearson, spearman and bicor correlations using OpenBLAS.

## Installation

### Install dependency libraries

**Debian based systems**

```bash
sudo apt install libopenblas
```

### Build the library

```bash
git clone https://github.com/Uditgulati/cor-blas
cd cor-blas
dub build --compiler=ldc2
```

## Usage

### Running examples

```bash
cd examples/corTest/
dub build --compiler=ldc2
./cortest
```

## Docs

//TODO

## Contributing

Any kind of improvements are welcome. Feel free to fork and open a pull request.