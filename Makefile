packages := str
objects = src/parseCSV.byte src/parseCSV.native

install:
	opam install core

clean:
	corebuild -clean

build:
	corebuild -pkgs $(packages) $(objects)
