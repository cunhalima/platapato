FCC=mxmlc
EXE=src/Main.swf
SRC=$(wildcard src/*.as)
DATA=$(wildcard assets/*.png) $(wildcard assets/*.mp3)
.PHONY: all

all: $(EXE)

clean:
	@rm -f $(EXE)

run: $(EXE)
	@flashplayer ./$(EXE)

$(EXE): Makefile $(SRC) $(DATA)
	$(FCC) -static-link-runtime-shared-libraries=true src/Main.as
