INCLUDE "includes.asm"

SECTION "RST Space", ROM0 [$0]
REPT $40
	db $ff
ENDR

SECTION "High Home", ROM0 [$68]
REPT $100 - $68
	db $ff
ENDR

SECTION "VBlank", ROM0 [$40]
	dr $40, $48

SECTION "LCD", ROM0 [$48]
	dr $48, $50

SECTION "Timer", ROM0 [$50]
	dr $50, $58

SECTION "Serial", ROM0 [$58]
	dr $58, $60

SECTION "Joypad", ROM0 [$60]
	dr $60, $68

SECTION "Start", ROM0 [$100]
	dr $100, $104

SECTION "Home", ROM0 [$150]
	dr $150, $4000
