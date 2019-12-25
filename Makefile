D_COMPILER=ldc2

LDMD=ldmd2

DUB_INCLUDE = -I~/.dub/packages/cblas-2.0.4/cblas/source/
DUB_LIBS =

DFLAGS = -wi -I./source $(DUB_INCLUDE)
RPATH  =
LIBS   = -L=-lopenblas
SRC    = $(wildcard source/cor/*.d  tests/*.d)
IR     = $(wildcard source/cor/*.ll tests/*.ll)
BC     = $(wildcard source/cor/*.bc tests/*.bc)
OBJ    = $(SRC:.d=.o)
OUT    = build/cor

debug: DFLAGS += -O0 -g -d-debug $(RPATH) -link-debuglib $(BACKEND_FLAG) -unittest
release: DFLAGS += -O -release $(RPATH)

.PHONY:test

all: debug

build-setup:
	mkdir -p build/

ifeq ($(FORCE_DUPLICATE),1)
  DFLAGS += -d-version=FORCE_DUPLICATE
endif


default debug release profile getIR getBC gperf: $(OUT)

# ---- Compile step
%.o: %.d
	$(D_COMPILER) -shared -m64 -relocation-model=pic $(DFLAGS) -c $< -od=$(dir $@) $(BACKEND_FLAG)

# ---- Link step
$(OUT): build-setup $(OBJ)
	$(D_COMPILER) -of=build/cor.so -shared -m64 -relocation-model=pic $(DFLAGS)  $(OBJ) $(LIBS) $(DUB_LIBS) $(BACKEND_FLAG)

test:
	chmod 755 build/cor
	./run_tests.sh

clean:
	rm -rf build/*
	rm -f $(OBJ) $(OUT) trace.{def,log}