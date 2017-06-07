packages := str
objects = src/parseCSV.byte src/parseCSV.native
testFile = example-data/big.csv

install:
	opam install core

clean:
	corebuild -clean

build:
	corebuild -pkgs $(packages) $(objects)

bench-native:
	time ./parseCSV.native $(testFile) -o out-byte.csv

bench-byte:
	time ./parseCSV.byte $(testFile) -o out-native.csv

bench-node:
	time ./src-js/index.js $(testFile) out-node.csv

bench:
	make bench-native bench-byte bench-node
