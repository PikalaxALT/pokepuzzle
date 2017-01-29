INCLUDE "macros/enum.asm"

dr: MACRO
INCBIN "baserom.gbc", \1, \2 - \1
ENDM

dbw: MACRO
	db \1
	dw \2
	ENDM

dba: MACRO
	dbw BANK(\1), \1
	ENDM

dwb: MACRO
	dw \1
	db \2
	ENDM

dab: MACRO
	dwb \1, BANK(\1)
	ENDM

RGB: MACRO
	dw (\3 << 10) | (\2 << 5) | (\1)
	ENDM

bankswitch: MACRO
	ld [hROMBank], a
	ld [MBC5RomBank], a
	ENDM

bankswitchhi: MACRO
	ld [hROMBankHi], a
	ld [MBC5RomBankHi], a
	ENDM

disablesram: MACRO
	ld a, SRAM_DISABLE
	ld [hSRamEnable], a
	ld [MBC5SRamEnable], a
	ENDM

wrambankswitch: MACRO
	ld [hWRAMBank], a
	ld [rSVBK], a
	ENDM

srambankswitch: MACRO
	ld [hSRAMBank], a
	ld [MBC5SRamBank], a
	ENDM

vrambankswitch: MACRO
	ld [hVRAMBank], a
	ld [rVBK], a
	ENDM

homecall: MACRO
	ld a, [hROMBank]
	push af
	ld a, BANK(\1)
	bankswitch
	call \1
	pop af
	bankswitch
	ENDM

farcall: MACRO
	call StackFarCall
	dab \1
	ENDM
