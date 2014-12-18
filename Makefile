FCC=mxmlc
EXE=src/Main.swf
SRC=$(wildcard src/*.as)
MAPS=$(wildcard map/*.bmp)
MKMAP=./mkmap.py
DATA=$(wildcard assets/*.txt) $(wildcard assets/*.png) $(wildcard assets/*.mp3)
.PHONY: all

all: $(EXE)

clean:
	@rm -f $(EXE)

assets/map01.txt: map/map01.bmp
	@$(MKMAP) $< $@

assets/map02.txt: map/map02.bmp
	@$(MKMAP) $< $@

run: $(EXE)
	@flashplayer ./$(EXE)

$(EXE): Makefile $(SRC) $(DATA)
	$(FCC) -static-link-runtime-shared-libraries=true src/Main.as
