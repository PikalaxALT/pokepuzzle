INCLUDE "macros/enum.asm"

percent EQUS "* 256 / 100"

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

pushsramstateandenable_nobankswitch: MACRO
	ld a, [hSRamEnable]
	push af
	enablesram
	ENDM

pushsramstateandenable: MACRO
	pushsramstateandenable_nobankswitch
	ld a, [hSRAMBank]
	push af
	ld a, \1
	srambankswitch
	ENDM

popsramstate_nobankswitch: MACRO
	pop af
	sramstate
	ENDM

popsramstate: MACRO
	pop af
	srambankswitch
	popsramstate_nobankswitch
	ENDM

bankswitch: MACRO
	ld [hROMBank], a
	ld [MBC5RomBank], a
	ENDM

bankswitchhi: MACRO
	ld [hROMBankHi], a
	ld [MBC5RomBankHi], a
	ENDM

sramstate: MACRO
	ld [hSRamEnable], a
	ld [MBC5SRamEnable], a
	ENDM

enablesram: MACRO
	ld a, SRAM_ENABLE
	sramstate
	ENDM

disablesram: MACRO
	ld a, SRAM_DISABLE
	sramstate
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
