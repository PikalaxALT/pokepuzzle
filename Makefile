PYTHON := python
MD5 := md5sum -c --quiet

2bpp     := $(PYTHON) gfx.py 2bpp
1bpp     := $(PYTHON) gfx.py 1bpp
pcm      := $(PYTHON) extras/pokemontools/pcm.py pcm
pic      := $(PYTHON) extras/pokemontools/pic.py compress
includes := $(PYTHON) extras/pokemontools/scan_includes.py

objs := \
	main.o \
	wram.o \
	home.o

$(foreach obj, $(objs:.o=), \
	$(eval $(obj)_dep := $(shell $(includes) $(obj).asm)) \
)

opts = -Cjv -k 01 -l 0x33 -m 0x1b -n 0x00 -p 0xFF -r 03 -t "POKEMONPC" -i "BPNE"

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp
.SECONDEXPANSION:
.PRECIOUS: .2bpp .1bpp
.PHONY: all clean tidy

rom := pokepuzzle.gbc

all: $(rom)

compare: $(rom)
	md5sum -c roms.md5

tidy:
	rm -f $(rom) $(objs) $(rom:.gbc=.sym) $(rom:.gbc=.map)

clean: tidy
	find . -iname "*.[12]bpp" -exec rm {} +

%.asm: ;
$(objs): %.o: %.asm $$(%_dep)
	rgbasm -o $@ $*.asm

$(rom): $(objs)
	rgblink -n $*.sym -m $*.map -p 0xFF -o $@ $^
	rgbfix $(opts) $@

%.png:  ;
%.2bpp: %.png  ; @$(2bpp) $<
%.1bpp: %.png  ; @$(1bpp) $<
