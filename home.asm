INCLUDE "includes.asm"

SECTION "VBlank", ROM0 [$40]
	jp wVBlank

SECTION "LCD", ROM0 [$48]
	jp wLCDInterrupt

SECTION "Timer", ROM0 [$50]
	jp Timer

SECTION "Serial", ROM0 [$58]
	jp Serial

SECTION "Joypad", ROM0 [$60]
	reti

SECTION "Start", ROM0 [$100]
	nop
	jp Start

SECTION "Header", ROM0 [$104]
	ds $4c

SECTION "Home", ROM0 [$150]
Start:: ; 150 (0:0150)
	di
	ld sp, wStack
	ld [hFFA8], a
	cp $11
	jr z, .cgb
	cp $1
	jr z, .not_cgb
	cp $ff
	jr z, .not_cgb
.cgb
	ld a, $1
	jr .got_flag

.not_cgb
	xor a
	jr .got_flag

.got_flag
	ld [hGBC], a
	farcall Func_6a7b4
	farcall Func_10996
	xor a
	ld [wc601], a
	ld [wc7ce], a
	ld a, SCREEN_HEIGHT_PX + 1
	ld hl, rLY
.wait_ly
	cp [hl]
	jr nc, .wait_ly
Func_0186:: ; 186 (0:0186)
	di
	ld sp, wStack
	ld b, $80
	call Func_09b0
	disablesram
	xor a
	bankswitch
	bankswitchhi
	srambankswitch
	vrambankswitch
	wrambankswitch
	xor a
	ld [hFFB6], a
	ld [rLCDC], a
	ld [hLCDC], a
	ld [rIF], a
	ld [rIE], a
	ld [rRP], a
	ld [hFFAA], a
	ld [hJoyPressed], a
	ld [hJoyNew], a
	ld [hJoyRepeat], a
	ld [hVBlankHasOccurred], a
	ld [wc59e], a
	ld [hFFB5], a
	ld [hFFBA], a
	ld [hFFBB], a
	ld a, $a0
	ld [rWX], a
	ld a, $90
	ld [rWY], a
	ld a, $8
	ld [rSCY], a
	ld [hFFAD], a
	xor a
	ld [rSCX], a
	ld [hFFAC], a
	ld a, $a
	ld [hJoyHoldTimerResetFirst], a
	ld a, $1
	ld [hJoyHoldTimerResetSubsequent], a
	ld a, $d9 ; reti
	ld [wLCDInterrupt], a
	; wVBlank: jp DefaultVBlank
	ld hl, wVBlank
	ld [hl], $c3 ; jp
	inc hl
	ld [hl], DefaultVBlank % $100
	inc hl
	ld [hl], DefaultVBlank / $100
	homecall Func_10000 ; LoadPushOAM
	ld a, [wc7ce]
	ld l, a
	ld a, [wc601]
	ld h, a
	push hl
	call Func_137a
	pop hl
	ld a, h
	ld [wc601], a
	ld a, l
	ld [wc7ce], a
	call Func_038c
	call Func_0d91
	xor a
	ld [rIF], a
	ld a, $40
	ld [rSTAT], a
	xor a
	ld [rIF], a
	ld a, $1
	ld [hFFAA], a
	ld [rIE], a
	ei
	farcall Func_109c0
	farcall Func_10c000
.game_loop
	call Func_0249
	jr .game_loop

Func_0249:: ; 249 (0:0249)
	ld a, [hFFB6]
	ld e, a
	ld d, $0
	ld hl, Pointers_09c5 + 2
	add hl, de
	add hl, de
	add hl, de
	ld a, [hld]
	bankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
	jp [hl]

Func_025e:: ; 25e (0:025e)
	push bc
	push de
	push hl
	ld a, [hFFB8]
	push af
	call Func_0532
	call ReadJoypad
	call Func_038c
	call Func_0e31
	pop af
	inc a
.loop
	push af
	ld a, [hFFEB]
	and a
	call nz, Func_13eb
	pop af
	dec a
	jr nz, .loop
	pop hl
	pop de
	pop bc
	ret

DefaultVBlank:
	push af
	push bc
	push de
	push hl
	ld a, [hVBlankHasOccurred]
	and a
	jr z, .asm_02c5
	ld a, [hFFBB]
	and a
	jr z, .asm_02a6
	ld h, a
	ld a, [hFFBA]
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, [hFFBC]
	bankswitch
	call ._hl_
	pop af
	bankswitch
.asm_02a6
	call hPushOAM
	ei
	xor a
	ld [hVBlankHasOccurred], a
	call Func_0504
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	ld hl, hFFB7
	inc [hl]
	ld hl, hFFB8
	ld [hl], $0
	pop hl
	pop de
	pop bc
	pop af
	reti
._hl_
	jp [hl]

.asm_02c5
	ld b, $1
.asm_02c7
	dec b
	jr nz, .asm_02c7
	ei
	call Func_051d
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	ld hl, hFFB8
	inc [hl]
	pop hl
	pop de
	pop bc
	pop af
	reti
	ld a, [hFFB6]
	cp $5
	ret nz
	ld hl, wcdf2
	ld a, [hl]
	inc [hl]
	cp $a
	ret c
	ld [wcdf4], sp
	farcall Func_46b39
Func_02f3:: ; 2f3 (0:02f3)
	jp [hl]

Func_02f4::
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_02f8:: ; 2f8 (0:02f8)
	ld a, [hFFB5]
	ld e, a
	srl a
	srl a
	ld d, a
	ld a, $28
	sub d
	ret z
	cp [hl]
	jr nc, .asm_030c
	ld [hFF8B], a
	inc hl
	jr .asm_0311

.asm_030c
	ld a, [hli]
	and a
	ret z
	ld [hFF8B], a
.asm_0311
	ld d, $c0
.asm_0313
	ld a, [hli]
	add c
	ld [de], a
	inc e
	ld a, [hli]
	add b
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hFF8B]
	dec a
	ld [hFF8B], a
	jr nz, .asm_0313
	ld a, e
	ld [hFFB5], a
	ret

Func_032c:
	ld a, [hROMBank]
	push af
	ld a, e
	bankswitch
	call Func_02f8
	pop af
	bankswitch
	ret

Func_033f:: ; 33f (0:033f)
	ld a, [hFFB5]
	ld e, a
	srl a
	srl a
	ld d, a
	ld a, $28
	sub d
	ret z
	cp [hl]
	jr nc, .asm_0353
	ld [hFF8B], a
	inc hl
	jr .asm_0358

.asm_0353
	ld a, [hli]
	and a
	ret z
	ld [hFF8B], a
.asm_0358
	ld d, $c0
.asm_035a
	ld a, [hli]
	add c
	ld [de], a
	inc e
	ld a, [hli]
	add b
	ld [de], a
	inc e
	ld a, [hFF8C]
	add [hl]
	inc hl
	ld [de], a
	inc e
	ld a, [hFF8D]
	add [hl]
	inc hl
	ld [de], a
	inc e
	ld a, [hFF8B]
	dec a
	ld [hFF8B], a
	jr nz, .asm_035a
	ld a, e
	ld [hFFB5], a
	ret

Func_0379:
	ld a, [hROMBank]
	push af
	ld a, e
	bankswitch
	call Func_033f
	pop af
	bankswitch
	ret

Func_038c:: ; 38c (0:038c)
	ld hl, wOAMBuffer
	ld de, 4
	ld c, 40
	xor a
	ld [hFFB5], a
.asm_0397
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_0397
	ret

Func_039d::
	ld a, [hFFB5]
	cp $a0
	jr nc, .asm_03b5
	rrca
	ld c, a
	xor a
	ld b, a
	ld hl, Func_03b9
	add hl, bc
	push hl
	ld [hFFB5], a
	ld hl, wOAMBufferEnd
	ld de, -4
	ret

.asm_03b5
	xor a
	ld [hFFB5], a
	ret

Func_03b9::
REPT 40
	add hl, de
	ld [hl], a
ENDR
	ret

Func_040a:: ; 40a (0:040a)
	push af
	push de
	inc h
	dec h
	jr nz, .asm_0416
	cp l
	jr c, .asm_0416
	ld e, a
	ld a, l
	ld l, e
.asm_0416
	ld e, l
	ld d, h
	ld l, $0
	ld h, l
	and a
	jr z, .asm_042a
.asm_041e
	add hl, de
	dec a
	jr z, .asm_042a
	add hl, de
	dec a
	jr z, .asm_042a
	add hl, de
	dec a
	jr nz, .asm_041e
.asm_042a
	pop de
	pop af
	ret

ReadJoypad:: ; 42d (0:042d)
	ld a, [wc59e]
	bit 7, a
	ret nz
	ld a, R_DPAD
	ld [rJOYP], a
REPT 5
	push hl
	pop hl
ENDR
	ld a, [rJOYP]
	and $f
	ld c, a
	ld a, R_BUTTONS
	ld [rJOYP], a
REPT 5
	push hl
	pop hl
ENDR
	ld a, [rJOYP]
	and $f
	swap c
	or c
	cpl
	ld [hJoyPressed], a
	ld c, a
	ld a, [hJoyLast]
	xor c
	and c
	ld [hJoyNew], a
	ld [hJoyRepeat], a
	ld a, c
	or a
	jr z, .asm_047f
	ld hl, hJoyLast
	cp [hl]
	jr nz, .asm_047f
	ld hl, hJoyHoldTimer
	dec [hl]
	jr nz, .asm_0483
	ld [hJoyRepeat], a
	ld a, [hJoyHoldTimerResetSubsequent]
	ld [hJoyHoldTimer], a
	jr .asm_0483

.asm_047f
	ld a, [hJoyHoldTimerResetFirst]
	ld [hJoyHoldTimer], a
.asm_0483
	ld a, c
	ld [hJoyLast], a
	ld a, $30
	ld [rJOYP], a
	ld a, [hJoyPressed]
	cp BUTTONS
	jr nz, .soft_reset
	ld a, [hJoyNew]
	and BUTTONS
	jr z, .soft_reset
	ld hl, wc59e
	set 7, [hl]
	ei
	ld a, [wc7ce]
	ld l, a
	ld a, [wc601]
	ld h, a
	push hl
	call Func_137a
	pop hl
	ld a, h
	ld [wc601], a
	ld a, l
	ld [wc7ce], a
	call Func_04c4
	xor a
	ld [hFFBB], a
	jp Func_0186

.soft_reset
	ret

Func_04bb::
	ld a, [hLCDC]
	set 7, a
	ld [hLCDC], a
	ld [rLCDC], a
	ret

Func_04c4:: ; 4c4 (0:04c4)
	ld a, [rLCDC]
	bit 7, a
	jr nz, .asm_04d3
	ld a, [hLCDC]
	res 7, a
	ld [hLCDC], a
	ld [rLCDC], a
	ret

.asm_04d3
	ld a, [hFFBB]
	push af
	ld a, [hFFBC]
	push af
	ld a, [hFFBA]
	push af
	xor a
	ld [hFFBB], a
	ld a, Func_04fb % $100
	ld [hFFBA], a
	ld a, $0
	ld [hFFBC], a
	ld a, Func_04fb / $100
	ld [hFFBB], a
	call Func_025e
	xor a
	ld [hFFBB], a
	pop af
	ld [hFFBA], a
	pop af
	ld [hFFBC], a
	pop af
	ld [hFFBB], a
	ret

Func_04fb::
	ld a, [hLCDC]
	res 7, a
	ld [hLCDC], a
	ld [rLCDC], a
	ret

Func_0504:: ; 504 (0:0504)
	ld a, [hLCDC]
	ld [rLCDC], a
	ld a, [hFFAC]
	ld [rSCX], a
	ld [hSCX], a
	ld a, [hFFAD]
	ld [rSCY], a
	ld [hSCY], a
	ld a, [hFFAE]
	ld [rWX], a
	ld a, [hFFAF]
	ld [rWY], a
	ret

Func_051d:: ; 51d (0:051d)
	ld a, [hLCDC]
	ld [rLCDC], a
	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a
	ld a, [hFFAE]
	ld [rWX], a
	ld a, [hFFAF]
	ld [rWY], a
	ret

Func_0532:: ; 532 (0:0532)
	ld hl, hVBlankHasOccurred
	ld a, $1
	ld [hl], a
	xor a
.asm_0539
	cp [hl]
	jr nz, .asm_0539
	ret

Func_053d::
	ld hl, hFFB8
	ld a, [hl]
.asm_0541
	cp [hl]
	jr z, .asm_0541
	ret

Func_0545::
	ld hl, wc495
	ld b, $40
	ld c, $69
	ld a, $80
	ld [rBGPI], a
.asm_0550
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .asm_0550
	ld b, $40
	ld a, $80
	ld [rOBPI], a
	ld c, $6b
.asm_055d
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .asm_055d
	ret

CopyBytes::
	dec bc
	inc b
	inc c
.asm_0566
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_0566
	dec b
	jr nz, .asm_0566
	ret

Func_0570:: ; 570 (0:0570)
	xor a
	ld l, e
	ld h, d
	dec bc
	inc b
	inc c
.asm_0576
	ld [hli], a
	dec c
	jr nz, .asm_0576
	dec b
	jr nz, .asm_0576
	ret

Func_057e::
	dec bc
	inc b
	inc c
.asm_0581
	ld a, [de]
	cp [hl]
	ret nz
	inc hl
	inc de
	dec c
	jr nz, .asm_0581
	dec b
	jr nz, .asm_0581
	ret

Func_058d::
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	ld c, a
	ld a, [hVRAMBank]
	push af
	ld a, [hSRAMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld a, [hFF8A]
	push af
	ld a, [hFF8B]
	push af
	ld a, [hFF8C]
	push af
	ld a, c
	ld [hFF8C], a
	ld a, d
	call Func_08ef
	push de
	dec hl
	ld a, [hld]
	ld d, a
	ld a, [hld]
	ld e, a
	ld a, [hld]
	ld b, a
	ld c, [hl]
	dec bc
	inc b
	inc c
	ld a, b
	ld [hFF8B], a
	ld a, c
	ld [hFF8A], a
	pop hl
.asm_05c0
	ld a, [hFF8A]
	ld c, a
	ld a, [hFF8B]
	ld b, a
	ld a, [hFF8C]
.asm_05c8
	ld [hli], a
	dec c
	jr nz, .asm_05c8
	dec b
	jr nz, .asm_05c8
	ld a, l
	add e
	ld l, a
	jr nc, .asm_05d5
	inc h
.asm_05d5
	dec d
	jr nz, .asm_05c0
	pop af
	ld [hFF8C], a
	pop af
	ld [hFF8B], a
	pop af
	ld [hFF8A], a
	pop af
	wrambankswitch
	pop af
	srambankswitch
	pop af
	vrambankswitch
	ret

StackFarCopyMemory:: ; 5f2 (0:05f2)
	pop de
	ld hl, $8
	add hl, de
	push hl
	add sp, -12
	ld hl, sp+$0
REPT 8
	ld a, [de]
	ld [hli], a
	inc de
ENDR
	xor a
	ld [hli], a
	ld [hli], a
	inc a
	ld [hli], a
	xor a
	ld [hli], a
	call Func_06c8
	add sp, 12
	ret

Func_0621::
	pop de
	ld hl, $d
	add hl, de
	push hl
	push bc
	ld b, a
	ld a, [hROMBank]
	push af
	add sp, -12
	ld hl, $6
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, b
	call Func_040a
	ld c, l
	ld b, h
	ld hl, $3
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	ld a, [hROMBank]
	push af
	ld hl, $5
	add hl, de
	ld a, [hl]
	bankswitch
	ld hl, sp+$5
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	ld [hli], a
	pop af
	bankswitch
	ld hl, sp+$0
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	inc de
	inc de
	inc de
	inc de
	ld hl, sp+$6
REPT 6
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	call Func_06c8
	add sp, 12
	pop af
	bankswitch
	pop bc
	ret

Func_0692:: ; 692 (0:0692)
	push hl
	push bc
	push de
	ld c, l
	ld b, h
	add sp, -12
	ld hl, sp+$0
REPT 12
	ld a, [bc]
	inc bc
	ld [hli], a
ENDR
	call Func_06c8
	add sp, 12
	pop de
	pop bc
	pop hl
	ret

Func_06c8:: ; 6c8 (0:06c8)
addr = hGFXSourceAddr
REPT 6
	ld a, [addr]
	ld l, a
	ld a, [addr + 1]
	ld h, a
	push hl
addr = addr + 2
ENDR
	ld hl, sp+$e
	ld bc, hGFXSourceAddr
REPT 12
	ld a, [hli]
	ld [bc], a
	inc bc
ENDR
	ld a, [hROMBank]
	push af
	ld a, [hVRAMBank]
	push af
	ld a, [hSRAMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld a, [hGFXSourceAddr]
	ld l, a
	ld a, [hGFXSourceAddr + 1]
	ld h, a
	cp $80
	jr c, .soft_lock
	cp $a0
	jr c, .vram
	cp $c0
	jr c, .sram
	cp $d0
	jr c, .continue
	ld a, [hGFXSourceBank]
	wrambankswitch
	jr .continue

.sram
	ld a, [hGFXSourceBank]
	srambankswitch
	jr .continue

.vram
	ld a, [hGFXSourceBank]
	vrambankswitch
	jr .continue

.soft_lock
	jr .soft_lock

.continue
	ld a, [hGFXDestAddr]
	ld e, a
	ld a, [hGFXDestAddr + 1]
	ld d, a
	cp $80
	jr c, .rom2
	cp $a0
	jr c, .vram2
	cp $c0
	jr c, .sram2
	cp $d0
	jr c, .continue2
	ld a, [hGFXDestBank]
	wrambankswitch
	jr .continue2

.sram2
	ld a, [hGFXDestBank]
	srambankswitch
	jr .continue2

.vram2
	ld a, [hGFXDestBank]
	vrambankswitch
	jr .continue2

.rom2
	ld a, [hGFXDestBank]
	bankswitch
.continue2
	ld a, [hGFXBlockSize]
	ld c, a
	ld a, [hGFXBlockSize + 1]
	ld b, a
	ld a, [hGFXNumBlocks]
	and a
	jr z, .asm_079e
	ld a, [hGFXNumBlocks + 1]
	inc a
	ld [hGFXNumBlocks + 1], a
.asm_079e
	push bc
	ld a, [hGFXSubBlockSize]
	ld c, a
	ld a, [hGFXSubBlockSize + 1]
	ld b, a
	dec bc
	inc c
	inc b
.asm_07a8
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_07a8
	dec b
	jr nz, .asm_07a8
	pop bc
	add hl, bc
	ld a, [hGFXNumBlocks]
	dec a
	ld [hGFXNumBlocks], a
	jr nz, .asm_079e
	ld a, [hGFXNumBlocks + 1]
	dec a
	ld [hGFXNumBlocks + 1], a
	jr nz, .asm_079e
	pop af
	wrambankswitch
	pop af
	srambankswitch
	pop af
	vrambankswitch
	pop af
	bankswitch
addr = hGFXNumBlocks
REPT 6
	pop hl
	ld a, h
	ld [addr + 1], a
	ld a, l
	ld [addr], a
addr = addr +- 2
ENDR
	ret

Func_0802::
	pop hl
	ld c, l
	ld b, h
	ld de, $c
	add hl, de
	push hl
	ld l, c
	ld h, b
	call Func_0692
	ret

Func_0180::
	push af
	push hl
	ld hl, sp+$4
	ld a, [hl]
	add $3
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hld], a
	ld l, [hl]
	ld h, a
	ld a, [hROMBank]
	push af
	dec hl
	ld a, [hld]
	push af
	ld a, [hld]
	ld l, [hl]
	ld h, a
	pop af
	and a
	jr z, .asm_0830
	bankswitch
.asm_0830
	call Func_084f
	push de
	push af
	push hl
	ld hl, sp+$a
	ld e, l
	ld d, h
	ld hl, sp+$2
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop hl
	pop af
	pop de
	pop af
	bankswitch
	add sp, $2
	pop af
	ret

Func_084f:: ; 84f (0:084f)
	push hl
	push de
	push af
	push hl
	ld hl, sp+$0
	ld e, l
	ld d, h
	ld hl, sp+$c
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop hl
	pop af
	pop de
	ret

StackFarCall:: ; 869 (0:0869)
	pop hl
	inc hl
	inc hl
	inc hl
	push hl
	dec hl
	ld a, [hROMBank]
	push af
	ld a, [hld]
	push af
	ld a, [hld]
	ld l, [hl]
	ld h, a
	pop af
	bankswitch
	call ._hl_
	pop af
	bankswitch
	ret

._hl_
	jp [hl]

Func_0888::
	ld c, a
	pop de
	ld hl, $4
	add hl, de
	push hl
	ld a, [hROMBank]
	push af
	ld l, e
	ld h, d
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld l, [hl]
	ld h, $0
	bankswitch
	ld a, c
	call Func_040a
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	bankswitch
	ld l, e
	ld h, d
	call Func_02f3
	pop af
	bankswitch
	ret

Func_08bc::
	push hl
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, d
	bankswitch
	xor a
	ld d, a
	ld h, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld h, [hl]
	pop af
	bankswitch
	ld a, h
	pop hl
	ret

GetFarByteHL:: ; 8da (0:08da)
	push de
	ld e, a
	ld a, [hROMBank]
	push af
	ld a, e
	bankswitch
	ld e, [hl]
	pop af
	bankswitch
	ld a, e
	pop de
	ret

Func_08ef:: ; 8ef (0:08ef)
	cp $e0
	jr nc, asm_093b ; ERAM or GBIO
	cp $d0
	jr nc, asm_0936 ; WRAMX
	cp $c0
	jr nc, asm_093b ; WRAM0
	cp $a0
	jr nc, asm_092e ; SRAMX
	cp $80
	jr nc, asm_0927 ; VRAMX
	; better luck next time
.asm_0903
	jr .asm_0903

Func_0905::
	cp $e0
	jr nc, asm_093b ; ERAM or GBIO
	cp $d0
	jr nc, asm_0936 ; WRAMX
	cp $c0
	jr nc, asm_093b ; WRAM0
	cp $a0
	jr nc, asm_092e ; SRAMX
	cp $80
	jr nc, asm_0927 ; VRAMX
	cp $40
	jr nc, asm_091f ; ROMX
	; ROM0
	scf
	ret

asm_091f
	ld a, b
	bankswitch
	scf
	ret

asm_0927
	ld a, b
	vrambankswitch
	and a
	ret

asm_092e
	ld a, b
	srambankswitch
	and a
	ret

asm_0936
	ld a, b
	wrambankswitch
asm_093b
	and a
	ret

Func_093d:: ; 93d (0:093d)
	ld b, a
	ld a, [hVRAMBank]
	push af
	ld a, [hSRAMBank]
	push af
	ld a, [hWRAMBank]
	push af
	push bc
	push af
	ld a, d
	push bc
	ld b, c
	call Func_08ef
	pop bc
	pop af
	pop bc
	ld a, b
	call Func_0c49
	pop af
	wrambankswitch
	pop af
	srambankswitch
	pop af
	vrambankswitch
	ret

Func_0967::
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	push bc
	push de
	ld d, a
	dec hl
	ld a, [hld]
	push hl
	ld l, d
	ld h, $0
	call Func_040a
	ld e, l
	ld d, h
	pop hl
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld l, [hl]
	ld h, a
	add hl, de
	ld a, [hROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, l
	ld l, b
	ld b, a
	pop af
	bankswitch
.asm_0999
	ld a, b
	pop de
	pop bc
	call Func_093d
	ret

RequestHDMATransfer::
	ld a, h
	ld [rHDMA1], a
	ld a, l
	ld [rHDMA2], a
	ld a, d
	ld [rHDMA3], a
	ld a, e
	ld [rHDMA4], a
	ld a, c
	ld [rHDMA5], a
	ret

Func_09b0:: ; 9b0 (0:09b0)
	ld a, [hGBC]
	dec a
	ret nz
	ld a, [rKEY1]
	and $80
	cp b
	ret z
	ld a, $30
	ld [rJOYP], a
	ld a, $1
	ld [rKEY1], a
	stop
	ret

Pointers_09c5:
	dab Func_10018
	dab Func_c000
	dab Func_c04e
	dab Func_50000
	dab Func_5001f
	dab Func_4003
	dab Func_5170a
	dab Func_74000
	dab Func_74140
	dab Func_617fb
	dab Func_5485a
	dab Func_55ded
	dab Func_5343d
	dab Func_55282
	dab Func_48825
	dab Func_56aa2
	dab Func_4c219
	dab Func_58d49
	dab Func_58d64
	dab Func_5d40c
	dab Func_46e47
	dab Func_608c0
	dab Func_528f3
	dab Func_60000
	dab Func_d08b
	dab Func_2a99
	dab Func_2b03
	dab Func_c02c0
	dab Func_c0367
	dab Func_c727a
	dab Func_c738a
	dab Func_c7391
	dab Func_c73d6
	dab Func_c7a99
	dab Func_108018
	dab Func_108040

Func_0a31::
	push bc
	ld c, l
	ld b, h
	ld hl, $6
	add hl, de
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld bc, $6
	add hl, bc
	ld c, $7
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	dec de
	dec hl
	dec c
	jr nz, .loop
	xor a
	and a
.done
	pop bc
	ret

Func_0a4f::
	push de
	push bc
	push bc
	ld c, $dc
	ld b, $a
haddr = hFFDC
REPT 7
	ld a, [de]
IF haddr == hFFDC
	add [hl]
ELSE
	adc [hl]
ENDC
	cp b
	jr c, .okay_\@
	sub b
.okay_\@
	ld [haddr], a
IF haddr < hFFE2
	ccf
	inc hl
	inc de
haddr = haddr + 1
ENDC
ENDR
	pop hl
	ld de, $6
	add hl, de
REPT 7
	ld a, [haddr]
	cp [hl]
	jr z, .next_\@
	jr nc, .copy_original
	jr .copy_sum

.next_\@
IF haddr > hFFDC
	dec hl
haddr = haddr +- 1
ENDC
ENDR
.copy_sum
	pop hl
	pop hl
REPT 7
	ld a, [haddr]
	ld [hli], a
haddr = haddr + 1
ENDR
	ret

.copy_original
	pop hl
	pop de
REPT 6
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, [hli]
	ld [de], a
	ret

Func_0b19::
	add a
	ld e, a
	ld d, $0
	ld hl, Halfwords_0b25
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ret

Halfwords_0b25:
y = $10
REPT 10
x = $10
REPT 10
	db x, y
x = x + 1
ENDR
y = y + 1
ENDR

Func_0bef::
	ld l, e
	ld h, d
	ld de, -1
	ld bc, -600
.asm_0bf5
	inc d
	add hl, bc
	ld a, h
	and $80
	jr z, .asm_0bf5
	ld bc, 600
	add hl, bc
	ld bc, -60
.asm_0c03
	inc e
	add hl, bc
	ld a, h
	and $80
	jr z, .asm_0c03
	ret

Func_0c0b:: ; c0b (0:0c0b)
	dec bc
	inc b
	inc c
.asm_0c0e
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_0c0e
	dec b
	jr nz, .asm_0c0e
	ret

Func_0c18:: ; c18 (0:0c18)
	ld a, [hFFD1]
	ld c, a
	ld a, [hFFD2]
	ld b, a
	ret

Func_0c1f::
	ld hl, hFFDA
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_0c26::
	ld a, l
	ld [hFFDA], a
	ld a, h
	ld [hFFDB], a
	ret

Func_0c2d::
	ld hl, hFFD5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_0c34:: ; c34 (0:0c34)
	ld a, l
	ld [hFFD5], a
	ld a, h
	ld [hFFD6], a
	ret

Func_0c3b::
	ld a, [hFFD3]
	ld e, a
	ld a, [hFFD4]
	ld d, a
	ret

Func_0c42:: ; c42 (0:0c42)
	ld a, e
	ld [hFFD3], a
	ld a, d
	ld [hFFD4], a
	ret

Func_0c49:: ; c49 (0:0c49)
	ld c, a
	ld a, [hROMBank]
	push af
	ld a, c
	bankswitch
	call Func_0c34
	call Func_0c42
	call Func_0c63
	pop af
	bankswitch
	ret

Func_0c63:: ; c63 (0:0c63)
	ld a, [hli]
	bit 7, a
	jr nz, .asm_0c72
	ld c, a
	ld b, $0
	inc bc
	call Func_0c0b
	jp Func_0c63

.asm_0c72
	bit 6, a
	jr nz, .asm_0c98
	ld [hFFD0], a
	and $3
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc b
	ld h, a
	ld a, [hFFD0]
	srl a
	srl a
	and $f
	add $2
	ld c, a
	xor a
	ld b, a
	call Func_0c0b
	pop hl
	jp Func_0c63

.asm_0c98
	bit 5, a
	jr nz, .asm_0cc2
	ld c, a
	ld a, [hli]
	ld b, a
	add a
	ld a, c
	rla
	and $3f
	add $2
	ld [hFFD1], a
	xor a
	ld [hFFD2], a
	ld a, [hli]
	ld c, a
	ld a, b
	and $7f
	ld b, a
	push hl
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc b
	ld h, a
	call Func_0c18
	call Func_0c0b
	pop hl
	jp Func_0c63

.asm_0cc2
	bit 4, a
	jr nz, .asm_0cd1
	and $f
	ld b, a
	ld a, [hli]
	ld c, a
	inc bc
	inc bc
	inc bc
	ld a, [hli]
	jr .asm_0ce0

.asm_0cd1
	bit 3, a
	jr nz, .asm_0cdf
	and $7
	add $3
	ld c, a
	xor a
	ld b, a
	ld a, [hli]
	jr .asm_0ce0

.asm_0cdf
	ret

.asm_0ce0
	dec bc
	inc b
	inc c
	push hl
	ld l, e
	ld h, d
.asm_0ce6
	ld [hli], a
	dec c
	jr nz, .asm_0ce6
	dec b
	jr nz, .asm_0ce6
	ld e, l
	ld d, h
	pop hl
	jp Func_0c63

Func_0cf3:: ; cf3 (0:0cf3)
	call Func_0d3a
	ld a, $0 ; nop
	ld [wc36e], a
	ld [wc36f], a
	ld [wc370], a
	ld [wc371], a
	ret

Func_0d05::
	call Func_0d3a
	ld a, $3a ; ld a, [hld]
	ld [wc3a0], a
	ld [wc360], a
	ld [wc364], a
	ld [wc36c], a
	ret

Func_0d17::
	call Func_0cf3
	ld a, $3a ; ld a, [hld]
	ld [wc3a0], a
	ld [wc360], a
	ld [wc364], a
	ret

Func_0d26::
	call Func_0d3a
	ld a, $18 ; jr
	ld [wc362], a
	ld hl, LCDInterrupt + wc363 - wLCDInterrupt
	ld a, BANK(LCDInterrupt)
	call GetFarByteHL
	ld [wc363], a ; asm_1018e - asm_1014c + 2
	ret

Func_0d3a:: ; d3a (0:0d3a)
	push hl
	push de
	call StackFarCopyMemory
	dab wLCDInterrupt
	dab LCDInterrupt
	dw $007d
	pop de
	pop hl
	ld a, $2a ; ld a, [hli]
	ld [wc362], a
	ld a, $e2 ; ld [$ff00+c], a
	ld [wc363], a
	ld a, $2a ; ld a, [hli]
	ld [wc372], a
	ld a, $fe ; cp $ff
	ld [wc373], a
	ld a, $ff
	ld [wc374], a
	ld a, [hli]
	ld [wc351], a
	ld [wc356], a
	ld a, [hli]
	ld [wc352], a
	ld [wc357], a
	ld a, [hli]
	ld [wc35d], a
	ld [wc369], a
	ld a, [hli]
	ld [wc359], a
	ld a, [hli]
	ld [wc35b], a
	ld [wc391], a
	ld a, [hli]
	ld [wc367], a
	ld a, [hli]
	ld [wc34d], a
	ld [wc3bc], a
	ld [wLCDInterrupt + 7], a
	ret

Func_0d91:: ; d91 (0:0d91)
	call Func_0daf
	di
	ld a, $0
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	ei
	ret

Fimc_0d9f::
	call Func_0daf
	di
	ld a, $dd
	ld [hFFEC], a
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	ei
	ret

Func_0daf:: ; daf (0:0daf)
	ld de, wc320
	ld bc, $22
	call Func_0570
	ld de, wc100
	ld bc, $200
	call Func_0570
	ld de, hFFE7
	ld bc, $a
	call Func_0570
	ld a, $20
	ld [hFFE9], a
	ld a, [hGBC]
	cp $0
	jr z, .asm_0de0
	cp $1
	jr z, .asm_0de4
	cp $2
	jr z, .asm_0de0
	cp $3
	jr z, .asm_0de0
.asm_0de0
	ld a, $e0
	jr .asm_0de8

.asm_0de4
	ld a, $c0
	jr .asm_0de8

.asm_0de8
	ld [hFFEF], a
	ld a, $3
	ld [rTAC], a
	ld a, $7
	ld [rTMA], a
	ld [rTIMA], a
	ld a, $3
	ld [rTAC], a
	ret

Func_0df9::
	xor a
	ld [rSB], a
	ld [hFFEC], a
	ld [hFFE8], a
	ld [hFFEB], a
	ret

Func_0e03::
	ld a, [hFFEB]
	and a
	jr nz, .asm_0e15
	ld a, $fe
	ld [hFFED], a
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	xor a
	ld [hFFF0], a
.asm_0e15
	ret

Func_0e16::
	ld a, [hFFEB]
	and a
	ret

.asm_0e1a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0e1a
	ret

Func_0e20:: ; e20 (0:0e20)
	ld a, [hFFF0]
	inc a
	ret z
	ld [hFFF0], a
	ret

asm_0e27
	ld a, BANK(Func_1025e)
	bankswitch
	jp Func_1025e

Func_0e31:: ; e31 (0:0e31)
	call Func_0e3f
	ld a, [hFFEB]
	and a
	jr z, .asm_0e3e
	call Func_0e20
	jr z, asm_0e27
.asm_0e3e
	ret

Func_0e3f:: ; e3f (0:0e3f)
	ld a, [hFFEB]
	and a
	ret z
	ld a, [hFFEA]
	and a
	ret nz
	ld a, [hFFE7]
	and a
	ret z
	ld a, [hFFEA]
	and a
	ret nz
	ld a, $81
	ld [rSC], a
	ret

Serial::
	ei
	push af
	push hl
	push bc
	push de
	ld a, [hFFEE]
	and a
	jr z, .asm_0e63
	pop de
	pop bc
	pop hl
	pop af
	reti
.asm_0e63
	ld a, $1
	ld [hFFEE], a
	xor a
	ld [hFFF0], a
	ld a, [hFFEB]
	and a
	jr nz, .asm_0eae
	ld a, [hFFEC]
	and a
	jr z, .asm_0ea5
	ld a, [rSB]
	cp $dd
	jr z, .asm_0e8d
	cp $fe
	jr z, .asm_0e97
.asm_0e7e
	xor a
	ld [hFFE7], a
	ld [hFFED], a
	ld a, $dd
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	jr .asm_0ef0

.asm_0e8d
	ld a, $1
	ld [hFFEB], a
	ld [hFFE8], a
	ld [hFFE7], a
	jr .asm_0ea5

.asm_0e97
	ld a, [hFFED]
	and a
	jr nz, .asm_0e7e
	ld a, $1
	ld [hFFEB], a
	xor a
	ld [hFFE8], a
	ld [hFFE7], a
.asm_0ea5
	xor a
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	jr .asm_0ef0

.asm_0eae
	ld a, $1
	ld [hFFEA], a
	ld a, [hFFE7]
	xor $1
	ld [hFFE7], a
	ld h, wc300 / $100
	ld a, [hFFE9]
	ld l, a
	ld a, [rSB]
	ld [hl], a
	ld a, l
	ld b, a
	add $7
	ld l, a
	ld a, [hl]
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	inc b
	ld a, b
	ld [hFFE9], a
	cp $24
	jr nz, .asm_0ee3
	ld a, $20
	ld [hFFE9], a
	xor a
	ld [hFFEA], a
	call Func_0f49
	call Func_0f24
	jr .asm_0ef0

.asm_0ee3
	ld a, [hFFE7]
	and a
	jr z, .asm_0ef0
	ld a, [hFFEF]
	ld [rTIMA], a
	ld a, $7
	ld [rTAC], a
.asm_0ef0
	xor a
	ld [hFFEE], a
	pop de
	pop bc
	pop hl
	pop af
	reti

Timer::
	push af
	ld a, $3
	ld [rTAC], a
	ld a, $81
	ld [rSC], a
	pop af
	reti
	ld hl, wc336
	ld a, [hld]
	ld b, a
	ld a, [hld]
	or [hl]
	or b
	ret z
	ld a, [wc33a]
	ld e, a
	ld d, wc100 / $100
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	inc e
	xor a
	ld [hld], a
	ld [hld], a
	ld [hl], a
	ld a, e
	ld [wc33a], a
	ret

Func_0f24::
	ld a, [wc33b]
	ld e, a
	ld a, [wc33a]
	cp e
	jr z, .asm_0f41
	ld d, $c1
	ld hl, wc327
	ld a, [de]
	inc e
	ld [hli], a
	ld a, [de]
	inc e
	ld [hli], a
	ld a, [de]
	inc e
	ld [hli], a
	ld a, e
	ld [wc33b], a
	ret

.asm_0f41
	ld hl, wc327
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Func_0f49:: ; f49 (0:0f49)
	ld hl, wc323
	ld a, [hld]
	ld b, a
	ld a, [hld]
	or [hl]
	or b
	ret z
	ld a, [wc33c]
	ld e, a
	ld d, wc200 / $100
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	inc e
	xor a
	ld [hld], a
	ld [hld], a
	ld [hl], a
	ld a, e
	ld [wc33c], a
	ret

Func_0f6a::
	ld a, [wc33d]
	ld e, a
	ld a, [wc33c]
	cp e
	jr z, .asm_0f87
	ld d, wc200 / $100
	ld hl, wc32e
	ld a, [de]
	inc e
	ld [hli], a
	ld a, [de]
	inc e
	ld [hli], a
	ld a, [de]
	inc e
	ld [hli], a
	ld a, e
	ld [wc33d], a
	ret

.asm_0f87
	ld hl, wc32e
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Func_0f8f::
	push hl
	push bc
	push de
	ld de, wc5a7
	ld bc, $38
	call Func_0570
	pop de
	pop bc
	pop hl
	ret

Func_0f9f::
	add a
	add a
	add a
	ld c, a
	ld b, $0
	ld hl, wc5a7
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ret

Func_0fad::
	push hl
	ld hl, wc5a7
	add hl, de
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a
	inc hl
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	ret

Func_0fc1::
	ld hl, wc5ad
	add hl, de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	ret

Func_0fca:: ; fca (0:0fca)
	ld a, [wc5a1]
	and a
	jr nz, .asm_0fec
.asm_0fd0
	ld a, [hli]
	bit 7, a
	jr nz, .asm_1014
	ld [wc5a1], a
	ld a, [hli]
	ld [wc5a2], a
	ld a, [hli]
	ld [wc5a3], a
	ld a, [hli]
	ld [wc5a4], a
	ld a, l
	ld [wc59f], a
	ld a, h
	ld [wc5a0], a
.asm_0fec
	ld a, [wc5a5]
	ld b, a
	ld a, [wc5a6]
	ld c, a
	ld a, [wc5a2]
	ld l, a
	ld a, [wc5a3]
	ld h, a
	or l
	jr z, .asm_100c
	push hl
	push bc
	push de
	ld a, [wc5a4]
	ld e, a
	call Func_032c
	pop de
	pop bc
	pop hl
.asm_100c
	ld a, [wc5a1]
	dec a
	ld [wc5a1], a
	ret

.asm_1014
	cp $80
	jr nz, .asm_1027
	ld a, [hli]
	ld [wc59f], a
	ld a, [hl]
	ld [wc5a0], a
	ld h, a
	ld a, [wc59f]
	ld l, a
	jr .asm_0fd0

.asm_1027
	cp $81
	jr nz, .asm_1035
	ld a, [hli]
	ld [wc5a6], a
	ld a, [hli]
	ld [wc5a5], a
	jr .asm_0fd0

.asm_1035
	cp $82
	jr nz, .asm_104c
	ld a, [wc5a6]
	add [hl]
	ld [wc5a6], a
	inc hl
	ld a, [wc5a5]
	add [hl]
	ld [wc5a5], a
	inc hl
	jp .asm_0fd0

.asm_104c
	cp $83
	jr nz, .asm_105f
	ld a, $df
	add [hl]
	ld e, a
	ld a, $c5
	adc $0
	ld d, a
	inc hl
	ld a, [hli]
	ld [de], a
	jp .asm_0fd0

.asm_105f
	cp $84
	jr nz, .asm_1075
	ld a, wc5df % $100
	add [hl]
	ld e, a
	ld a, wc5df / $100
	adc $0
	ld d, a
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	jp .asm_0fd0

.asm_1075
	cp $85
	jr nz, .asm_1086
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ._hl_
	pop hl
	inc hl
	inc hl
	jp .asm_0fd0

.asm_1086
	cp $86
	jr nz, .soft_lock
	xor a
	ld [wc59f], a
	ld [wc5a0], a
	ret

._hl_
	jp [hl]

.soft_lock
	jr .soft_lock

Func_1095::
	ld e, $7
	ld hl, wc5a7
.asm_109a
	push de
	push hl
	ld bc, wc59f
	ld d, $8
.asm_10a1
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .asm_10a1
	ld a, [wc59f]
	ld l, a
	ld a, [wc5a0]
	ld h, a
	or l
	call nz, Func_0fca
	pop hl
	ld bc, wc59f
	ld d, $8
.asm_10b9
	ld a, [bc]
	ld [hli], a
	inc bc
	dec d
	jr nz, .asm_10b9
	pop de
	dec e
	jr nz, .asm_109a
	ret

INCLUDE "home/music.asm"

Data_1514::
	dr $1514, $185c

Func_185c: ; 185c (0:185c)
	ld a, [hROMBank]
	push af
	ld a, e
	ld [MBC5RomBank], a
	ld [hROMBank], a
	push hl
	push bc
	ld hl, rWave_0
	ld b, $10
	ld a, $ff
.asm_186e
	ld [hli], a
	dec b
	jr nz, .asm_186e
	ld a, $80
	ld [rNR30], a
	ld a, $20
	ld [rNR32], a
	ld a, $ff
	ld [rNR33], a
	ld a, $80
	ld [rNR34], a
	pop bc
	pop hl
	ld a, [hFFA8]
	ld e, a
	ld a, $11
	sub e
	ld e, a
.asm_188b
	inc e
	dec e
	call z, Func_18dd
	ld a, [hl]
	and $30
	sla a
	ld [rNR32], a
	ld a, [hl]
	and $c0
	swap a
	srl a
	srl a
	inc a
	dec a
	jr z, .asm_18af
.asm_18a4
	inc e
	dec e
	call z, Func_18dd
	call Func_18dd
	dec a
	jr nz, .asm_18a4
.asm_18af
	inc e
	dec e
	call z, Func_18dd
	ld a, [hl]
	and $3
	sla a
	swap a
	ld [rNR32], a
	ld a, [hli]
	srl a
	srl a
	and $3
	jr z, .asm_18d1
.asm_18c6
	inc e
	dec e
	call z, Func_18dd
	call Func_18dd
	dec a
	jr nz, .asm_18c6
.asm_18d1
	dec bc
	ld a, c
	or b
	jr nz, .asm_188b
	pop af
	ld [MBC5RomBank], a
	ld [hROMBank], a
	ret

Func_18dd: ; 18dd (0:18dd)
	inc e
	dec e
	jr nz, .asm_18e9
	inc d
	dec d
	jr nz, .asm_18eb
	nop
	nop
	nop
	nop
.asm_18e9
	nop
	nop
.asm_18eb
	nop
	nop
	nop
	nop
	nop
	ret

Func_18f1::
	ld e, a
	add a
	add a
	add e
	ld e, a
	push de
	ld d, $0
	ld hl, Data_1911 + 4
	add hl, de
	pop de
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld e, a
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, [wc7ce]
	and a
	jr nz, .asm_1910
	call Func_185c
.asm_1910
	ret

Data_1911::
	dab Data_180d40
	dw $0c3b

	dab Data_99880
	dw $0c49

	dab Data_90000
	dw $076c

	dab Data_9a4d0
	dw $065f

Func_1925::
	homecall Func_198c03
	ret

Func_1939::
	homecall Func_198c5c
	ret

Data_194d::
	dr $194d, $1968

Func_1968: ; 1968 (0:1968)
	bankswitch
	ret

FarCall::
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, b
	bankswitch
	call ._hl_
	pop af
	bankswitch
	ret

._hl_
	jp [hl]

Bank1FarCall::
	bankswitch
	call ._hl_
	ld a, $1
	bankswitch
	ret

._hl_:
	jp [hl]

FarCopyBytes::
	push bc
	ld b, a
	ld a, [hROMBank]
	ld c, a
	ld a, b
	call Func_1968
	ld a, c
	pop bc
	push af
	call CopyBytes
	pop af
	call Func_1968
	ret

FarRequestHDMATransfer::
	push bc
	ld b, a
	ld a, [hROMBank]
	ld c, a
	ld a, b
	call Func_1968
	ld a, c
	pop bc
	push af
	call RequestHDMATransfer
	pop af
	call Func_1968
	ret

Func_19bc::
	jp Func_025e

Func_19bf::
	xor a
	vrambankswitch
last_src = $00
last_dest = $00
cur_src = $dd80
cur_dest = $9800
cur_vbank = 0
REPT 40
IF cur_dest >= $9a80
cur_dest = $9800
cur_vbank = 1
	inc a
	vrambankswitch
ENDC
IF (last_src != (cur_src >> 8)) & (cur_vbank == 0)
	ld hl, rHDMA1
	ld a, cur_src / $100
	ld [hli], a
	ld a, cur_src % $100
	ld [hli], a
	ld a, cur_dest / $100
	ld [hli], a
	ld a, cur_dest % $100
	ld [hli], a
	xor a
	ld [hl], a
ELSE
IF last_src != (cur_src >> 8)
	ld a, cur_src / $100
	ld [rHDMA1], a
ENDC
	ld a, cur_src % $100
	ld [rHDMA2], a
IF last_dest != (cur_dest >> 8)
	ld a, cur_dest / $100
	ld [rHDMA3], a
ENDC
	ld a, cur_dest % $100
	ld [rHDMA4], a
	xor a
	ld [rHDMA5], a
ENDC
last_src = cur_src >> 8
last_dest = cur_dest >> 8
cur_src = cur_src + $10
cur_dest = cur_dest + $20
ENDR
	ret

Func_1ba2::
	ld hl, wc51a
	ld de, wc9be
REPT $3F
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, [hli]
	ld [de], a
	ret

Func_1c68::
	ld a, $1
	vrambankswitch
	ld a, [hWRAMBank]
	push af
	ld a, $4
	wrambankswitch
	ld hl, wc8ef
	ld a, [hld]
	ld c, [hl]
	ld b, a
	ld hl, rHDMA1
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $9600 / $100
	ld [hli], a
	ld a, $9600 % $100
	ld [hli], a
	xor a
	ld [hl], a
	pop af
	wrambankswitch
	ret

Func_1c92::
	ld hl, wc86a
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, asm_1ca0
	scf
	ret

Func_1c9d::
	ld hl, wc86c
asm_1ca0
	inc hl
	ld a, [hl]
	swap a
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, GFX_49420
	add hl, bc
	ld c, l
	ld b, h
	ld a, [hROMBank]
	push af
	ld a, BANK(GFX_49420)
	bankswitch
	xor a
	vrambankswitch
	ld hl, rHDMA1
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $93a0 / $100
	ld [hli], a
	ld a, $93a0 % $100
	ld [hli], a
	ld a, $3
	ld [hl], a
	pop af
	bankswitch
	and a
	ret

Func_1cd6::
	ld bc, wc8da
	ld hl, wc8db
	ld a, [bc]
	cp [hl]
	jr z, .asm_1d13
	ld [hl], a
	swap a
	ld l, a
	ld h, $0
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, bc
	ld bc, GFX_496a0
	add hl, bc
	ld c, l
	ld b, h
	ld a, BANK(GFX_496a0)
	ld [MBC5RomBank], a
	ld a, $1
	vrambankswitch
	ld hl, rHDMA1
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $9540 / $100
	ld [hli], a
	ld a, $9540 % $100
	ld [hli], a
	ld a, $5
	ld [hl], a
	ld a, [hROMBank]
	ld [MBC5RomBank], a
	and a
	ret

.asm_1d13
	scf
	ret

Func_1d15::
	call Func_1d25
	ret nz
	ld hl, wca16
	ld a, [hli]
	ld [wc9fa], a
	ld a, [hl]
	ld [wc9fb], a
	ret

Func_1d25:: ; 1d25 (0:1d25)
	ld a, [wcea1]
	cp $6
	ret z
	cp $7
	ret z
	cp $8
	ret

Func_1d31::
	ld a, [wcea1]
	cp $5
	ret z
	cp $d
.softlock
	jr z, .softlock
	ret

Func_1d3c::
	ld a, [wcea1]
	cp $f
	jr z, .asm_1d48
	cp $d
.softlock
	jr z, .softlock
	ret

.asm_1d48
	ld a, $2
	ld [wcea1], a
	ret

Func_1d4e::
	ld a, $5
	ld [wcea1], a
	ret

Func_1d54::
	and a
	jr z, .asm_1d69
	dec a
	jr nz, .asm_1d5e
	inc c
	inc c
	jr .asm_1d69

.asm_1d5e
	ld b, $0
	add hl, bc
	inc hl
	ld l, [hl]
	ld h, $0
	add hl, de
	ld d, h
	ld e, l
	ret

.asm_1d69
	ld b, $0
	push hl
	add hl, bc
	ld a, [hli]
	cp $80
	jr nz, .asm_1d77
	ld c, $0
	pop hl
	jr .asm_1d69

.asm_1d77
	ld b, a
	ld l, [hl]
	ld h, $0
	add hl, de
	ld d, h
	ld e, l
	ld a, b
	pop hl
	ret

Func_1d81::
	farcall Func_68c73
	ret

Func_1d88:: ; 1d88 (0:1d88)
	farcall Func_68d42
	ret

Func_1d8f:: ; 1d8f (0:1d8f)
	ld a, [hWRAMBank]
	push af
	ld a, $2
	wrambankswitch
	ld hl, wd780
	add hl, de
	ld a, [hli]
	ld [hFF8A], a
	ld a, [hli]
	ld [hFF8B], a
	ld a, [hli]
	ld [hFF8C], a
	ld a, [hli]
	ld [hFF8D], a
	ld a, [hli]
	ld [hFF8E], a
	ld a, [hl]
	ld [hFF8F], a
	ld hl, wd180
	add hl, de
	ld a, [hFF8A]
	add [hl]
	ld [hli], a
	ld a, [hFF8B]
	adc [hl]
	ld [hl], a
	ld b, d
	ld c, e
	sra b
	rr c
	sra b
	rr c
	ld a, [hl]
	ld hl, wd000
	add hl, bc
	ld c, a
	ld a, [hl]
	and $e0
	or c
	ld [hl], a
	ld hl, wd182
	add hl, de
	ld a, [hFF8C]
	add [hl]
	ld [hli], a
	ld a, [hFF8D]
	adc [hl]
	ld [hl], a
	ld b, d
	ld c, e
	sra b
	rr c
	sra b
	rr c
	ld a, [hl]
	ld hl, wd000
	add hl, bc
	ld b, a
	and $7
	swap a
	add a
	ld c, a
	ld a, [hl]
	and $1f
	or c
	ld [hli], a
	ld a, b
	and $18
	rra
	rra
	rra
	ld c, a
	ld a, [hl]
	and $fc
	or c
	ld [hl], a
	ld hl, wd184
	add hl, de
	ld a, [hFF8E]
	add [hl]
	ld [hli], a
	ld a, [hFF8F]
	adc [hl]
	ld [hl], a
	ld b, d
	ld c, e
	sra b
	rr c
	sra b
	rr c
	ld a, [hl]
	ld hl, wd001
	add hl, bc
	add a
	add a
	ld c, a
	ld a, [hl]
	and $83
	or c
	ld [hl], a
	pop af
	wrambankswitch
	ret

Func_1e2b::
	ld de, $0
.asm_1e2e
	call Func_1d8f
	ld a, e
	add $8
	ld e, a
	ld a, d
	adc $0
	ld d, a
	sub $3
	jr c, .asm_1e2e
	ld hl, wcd67
	ld a, [hl]
	and a
	jr z, asm_1e65
	dec a
	ld [hl], a
	jr asm_1e65

Func_1e48::
	ld de, $0
.asm_1e4b
	call Func_1d88
	ld hl, $8
	add hl, de
	ld d, h
	ld e, l
	ld a, e
	sub $0
	ld a, d
	sbc $3
	jr c, .asm_1e4b
	ld hl, wcd67
	ld a, [hl]
	and a
	jr z, asm_1e65
	dec a
	ld [hl], a
asm_1e65
	ld a, [hWRAMBank]
	push af
	ld a, $2
	wrambankswitch
	ld hl, wd000
	ld de, wc495
	ld bc, $80
	dec bc
	inc b
	inc c
.asm_1e7a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1e7a
	dec b
	jr nz, .asm_1e7a
	ld hl, wd080
	ld de, wc51a
	ld bc, $40
	dec bc
	inc b
	inc c
.asm_1e8f
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1e8f
	dec b
	jr nz, .asm_1e8f
	pop af
	wrambankswitch
	ld a, [wcd67]
	and a
	jr z, .asm_1ea5
	and a
	ret

.asm_1ea5
	scf
	ret

Func_1ea7::
	ld a, [hWRAMBank]
	push af
	ld a, $2
	wrambankswitch
	dec bc
	inc b
	inc c
.asm_1eb3
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1eb3
	dec b
	jr nz, .asm_1eb3
	pop af
	wrambankswitch
	ret

Func_1ec2::
	push bc
	ld a, [hFF8A]
	add a
	ld c, a
	ld b, $0
	pop hl
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
.asm_1ece
	ld a, [bc]
	inc bc
	inc a
	jr z, .asm_1eeb
	push bc
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, GFX_28000
	add hl, bc
	ld a, BANK(GFX_28000)
	ld bc, $10
	call FarCopyBytes
	pop bc
	jr .asm_1ece

.asm_1eeb
	ret

Func_1eec::
	ld [hFFBC], a
	ld a, [hGBC]
	dec a
	jr z, .asm_1efa
	ld a, c
	ld [hFFBA], a
	ld a, b
	ld [hFFBB], a
	ret

.asm_1efa
	ld a, e
	ld [hFFBA], a
	ld a, d
	ld [hFFBB], a
	ret

Func_1f01::
	push bc
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld l, c
	ld h, b
	pop bc
	ret

Func_1f12::
	push bc
	push hl
	ld hl, wc8d3
	ld a, [hl]
	ld c, a
	ld b, $0
	inc a
	cp $a
	jr c, .asm_1f21
	xor a
.asm_1f21
	ld [hl], a
	ld a, [hFF8A]
	ld hl, wc8be
	add hl, bc
	ld [hl], a
	ld hl, wc8c8
	add hl, bc
	ld a, [hFF8B]
	and $f8
	add a
	swap a
	ld [hl], a
	pop hl
	pop bc
	ret

Func_1f38::
	ld a, [wcead]
	and a
	jr nz, .asm_1f42
	ld hl, wceab
	ret

.asm_1f42
	ld hl, wc833
	ret

Func_1f46::
	ld b, $0
	ld a, [hJoyPressed]
	and a
	jr nz, .asm_1f4e
	inc b
.asm_1f4e
	inc b
	ld hl, wc83c
	ld a, [hl]
	add b
	ld [hli], a
	ld c, a
	ld a, [hl]
	adc $0
	and $7
	ld [hli], a
	or c
	jr nz, .asm_1f60
	inc [hl]
.asm_1f60
	ret

Random:: ; 1f61 (0:1f61)
	push bc
	push de
	push hl
	ld hl, wc83c
	ld a, [hl]
	add $1
	ld [hli], a
	ld c, a
	ld a, [hl]
	adc $0
	and $7
	ld [hli], a
	ld b, a
	or c
	jr nz, .asm_1f77
	inc [hl]
.asm_1f77
	ld a, [hROMBank]
	ld d, a
	ld a, BANK(Data_68ef9)
	bankswitch
	ld a, [hl]
	ld hl, Data_68ef9
	add hl, bc
	add [hl]
	ld e, a
	ld a, d
	bankswitch
	ld a, e
	pop hl
	pop de
	pop bc
	ret

Random_1in1::
	xor a
	ret

Random_1in2::
	call Random
	and $1
	ret

Random_1in3::
	call Random_1in6
	srl a
	ret

Random_1in4::
	call Random
	and $3
	ret

Random_1in5::
	call Random
RoughlyDivideBy5::
	cp $33
	jr c, .asm_1fc6
	cp $66
	jr c, .asm_1fc3
	cp $99
	jr c, .asm_1fc0
	cp $cc
	jr c, .asm_1fbd
	ld a, $4
	ret

.asm_1fbd
	ld a, $3
	ret

.asm_1fc0
	ld a, $2
	ret

.asm_1fc3
	ld a, $1
	ret

.asm_1fc6
	xor a
	ret

Random_1in6:: ; 1fc8 (0:1fc8)
	call Random
RoughlyDivideBy6::
	cp $2b
	jr c, .asm_1fee
	cp $56
	jr c, .asm_1feb
	cp $81
	jr c, .asm_1fe8
	cp $ac
	jr c, .asm_1fe5
	cp $d6
	jr c, .asm_1fe2
	ld a, $5
	ret

.asm_1fe2
	ld a, $4
	ret

.asm_1fe5
	ld a, $3
	ret

.asm_1fe8
	ld a, $2
	ret

.asm_1feb
	ld a, $1
	ret

.asm_1fee
	xor a
	ret

Func_1ff0::
	ld a, [wcadf]
	dec a
	jr z, .asm_1ffa
	dec a
	jr z, .asm_200b
	ret

.asm_1ffa
	ld a, [wc869]
	ld [wcae1], a
	ld a, $2
	ld [wcadf], a
	ld hl, wcae2
	xor a
	ld [hli], a
	ld [hl], a
.asm_200b
	ld hl, wcae4
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcae2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .asm_2066
	cp $81
	jr z, .asm_2042
	cp $82
	jr z, .asm_2054
	xor a
	ld [wcae7], a
	ld a, [hl]
	ld d, a
	ld [wcae6], a
	and $80
	jr z, .asm_2036
	ld hl, wcae7
	dec [hl]
.asm_2036
	ld hl, wcae1
	ld a, [hl]
	add d
	ld [hl], a
	ld [hFFAD], a
	ld a, $1
	jr .asm_2070

.asm_2042
	inc hl
	ld a, [wc7ce]
	and a
	jr nz, .asm_204d
	ld a, [hl]
	ld [wc7cb], a
.asm_204d
	ld a, $2
	call .asm_2070
	jr .asm_200b

.asm_2054
	inc hl
	ld a, [wc7ce]
	and a
	jr nz, .asm_205f
	ld a, [hl]
	ld [wc7cd], a
.asm_205f
	ld a, $2
	call .asm_2070
	jr .asm_200b

.asm_2066
	xor a
	ld [wcadf], a
	ld hl, wcae6
	ld [hli], a
	ld [hl], a
	ret

.asm_2070
	ld hl, wcae2
	add [hl]
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	ret

Func_207a:: ; 207a (0:207a)
	ld de, $0
	dec bc
	inc b
	inc c
.asm_2080
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $0
	ld d, a
	dec c
	jr nz, .asm_2080
	dec b
	jr nz, .asm_2080
	ret

Func_208e::
	pushsramstateandenable 1
	ld hl, s1_a002
	ld bc, $682
	call Func_207a
	ld hl, s1_a000
	ld a, e
	ld [hli], a
	ld [hl], d
	call StackFarCopyMemory
	dab w7_d000
	dab s1_a000
	dw $0684
	call StackFarCopyMemory
	dab s2_a000
	dab w7_d000
	dw $0684
	popsramstate
	ret

Func_20d4::
	pushsramstateandenable 1
	ld hl, s1_a686
	ld bc, $1831
	call Func_207a
	ld hl, s1_a684
	ld a, e
	ld [hli], a
	ld [hl], d
	popsramstate
	ret

Func_2104::
	pushsramstateandenable 1
	ld b, $0
.asm_211a
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	ld a, b
	cp c
	jr nz, .asm_211a
	popsramstate
	ret

Func_212f::
	pushsramstateandenable 1
	ld b, $0
.asm_2145
	ld a, [de]
	ld [hli], a
	inc de
	inc b
	ld a, b
	cp c
	jr nz, .asm_2145
	popsramstate
	ret

Func_215a::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add a
	add c
	add a
	ld c, a
	ld a, [wcdc4]
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a00e
	add hl, bc
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hl], a
	popsramstate
	ret

Func_2198::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add a
	add c
	add a
	ld c, a
	ld a, [wcdc4]
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a00e
	add hl, bc
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hl]
	ld [wcdc6], a
	popsramstate
	ret

Func_21d6::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a032
	add hl, bc
	ld a, [wcdc4]
	ld [hli], a
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hl], a
	popsramstate
	ret

Func_2210::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a032
	add hl, bc
	ld a, [hli]
	ld [wcdc4], a
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hl]
	ld [wcdc6], a
	popsramstate
	ret

Func_224a::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add a
	add a
	add c
	add a
	add a
	ld c, a
	ld a, [wcdc4]
	ld b, a
	add a
	add b
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a076
	add hl, bc
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hli], a
	ld a, [wcdc7]
	ld [hli], a
	ld a, [wcdc8]
	ld [hli], a
	ld a, [wcdc9]
	ld [hli], a
	ld a, [wcdca]
	ld [hl], a
	popsramstate
	ret

Func_229d::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add a
	add a
	add c
	add a
	add a
	ld c, a
	ld a, [wcdc4]
	ld b, a
	add a
	add b
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a076
	add hl, bc
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hli]
	ld [wcdc6], a
	ld a, [hli]
	ld [wcdc7], a
	ld a, [hli]
	ld [wcdc8], a
	ld a, [hli]
	ld [wcdc9], a
	ld a, [hl]
	ld [wcdca], a
	popsramstate
	ret

Func_22f0::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add a
	ld c, a
	ld a, [wcdc4]
	add a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a0eb
	add hl, bc
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hli], a
	ld a, [wcdc7]
	ld [hli], a
	ld a, [wcdc8]
	ld [hl], a
	popsramstate
	ret

Func_2338::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add a
	ld c, a
	ld a, [wcdc4]
	add a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a0eb
	add hl, bc
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hli]
	ld [wcdc6], a
	ld a, [hli]
	ld [wcdc7], a
	ld a, [hl]
	ld [wcdc8], a
	popsramstate
	ret

Func_2380::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a108
	add hl, bc
	ld e, l
	ld d, h
	ld hl, wcdc4
	ld bc, $7
	call CopyBytes
	popsramstate
	ret

Func_23bb::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a108
	add hl, bc
	ld de, wcdc4
	ld bc, $7
	call CopyBytes
	popsramstate
	ret

Func_23f4::
	pushsramstateandenable 1
	call Func_2444
	ld a, [wcdc5]
	ld [hl], a
	popsramstate
	ret

Func_241c::
	pushsramstateandenable 1
	call Func_2444
	ld a, [hl]
	ld [wcdc5], a
	popsramstate
	ret

Func_2444:: ; 2444 (0:2444)
	ld a, [wcdc3]
	ld l, a
	ld h, $0
	push bc
	ld c, l
	ld b, h
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, bc
	add hl, hl
	pop bc
	ld de, s1_a11d
	add hl, de
	ld a, [wcdc4]
	and $f0
	swap a
	ld e, a
	add a
	add a
	add e
	ld e, a
	ld a, [wcdc4]
	and $f
	add e
	ld e, a
	ld d, $0
	add hl, de
	ret

Func_2470::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a17d
	add hl, bc
	ld e, l
	ld d, h
	ld hl, wcdc4
	ld bc, $d
	call CopyBytes
	popsramstate
	ret

Func_24ac::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a17d
	add hl, bc
	ld de, wcdc4
	ld bc, $d
	call CopyBytes
	popsramstate
	ret

Func_24e6::
	pushsramstateandenable 1
	call Func_253d
	ld a, [wcdc6]
	ld [hl], a
	call Func_257e
	ld a, [wcdc6]
	ld [hl], a
	popsramstate
	ret

Func_2515::
	pushsramstateandenable 1
	call Func_253d
	ld a, [hl]
	ld [wcdc6], a
	popsramstate
	ret

Func_253d:: ; 253d (0:253d)
	ld a, [wcdc3]
	ld l, a
	ld h, $0
	push bc
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl
	pop bc
	ld a, [wcdc5]
	push bc
	ld b, a
	add a
	add a
	add a
	add a
	add b
	add a
	add b
	add a
	pop bc
	ld c, a
	ld b, $0
	ld de, s1_a1ac
	add hl, bc
	add hl, de
	ld a, [wcdc4]
	and $f0
	swap a
	add a
	ld e, a
	add a
	add a
	add e
	ld e, a
	ld a, [wcdc4]
	and $f
	add e
	ld e, a
	ld d, $0
	add hl, de
	ret

Func_257e:: ; 257e (0:257e)
	ld a, [wcdc5]
	push bc
	ld b, a
	add a
	add a
	add a
	add a
	add b
	add a
	add b
	add a
	pop bc
	ld c, a
	ld b, $0
	ld hl, s1_a350
	add hl, bc
	ld a, [wcdc4]
	and $f0
	swap a
	add a
	ld e, a
	add a
	add a
	add e
	ld e, a
	ld a, [wcdc4]
	and $f
	add e
	ld e, a
	ld d, $0
	add hl, de
	ret

Func_25ab::
	pushsramstateandenable 1
	call Func_26d4
	push hl
	ld a, [wcdc3]
	push bc
	ld b, a
	add a
	add b
	add a
	add a
	pop bc
	ld c, a
	ld b, $0
	ld a, [wcdc5]
	and a
	jr nz, .asm_25db
	ld hl, s1_a3df
	jr .asm_25de

.asm_25db
	ld hl, s1_a406
.asm_25de
	add hl, bc
	ld d, $c
	ld a, [wcdc4]
	ld e, a
.asm_25e5
	ld a, [hl]
	cp $ff
	jr z, .asm_25f5
	cp e
	jr z, .asm_2614
	inc hl
	dec d
	ld a, d
	and a
	jr nz, .asm_25e5
	jr .asm_25fa

.asm_25f5
	pop de
	ld a, [de]
	and a
	jr nz, .asm_260c
.asm_25fa
	ld a, $1
	ld [wcdc6], a
	popsramstate
	ret

.asm_260c
	dec a
	ld [de], a
	ld a, [wcdc4]
	ld [hl], a
	jr .asm_2615

.asm_2614
	pop de
.asm_2615
	xor a
	ld [wcdc6], a
	popsramstate
	ret

Func_2626::
	pushsramstateandenable 1
	call Func_26d4
	ld a, [hl]
	ld [wcdc7], a
	ld a, [wcdc3]
	push bc
	ld b, a
	add a
	add b
	add a
	add a
	pop bc
	ld c, a
	ld b, $0
	ld a, [wcdc5]
	and a
	jr nz, .asm_2659
	ld hl, s1_a3df
	jr .asm_265c

.asm_2659
	ld hl, s1_a406
.asm_265c
	add hl, bc
	ld d, $c
	xor a
	ld [wcdc6], a
	ld a, [wcdc4]
	ld e, a
.asm_2667
	ld a, [hli]
	cp e
	jr nz, .asm_2672
	ld a, $1
	ld [wcdc6], a
	jr .asm_2677

.asm_2672
	dec d
	ld a, d
	and a
	jr nz, .asm_2667
.asm_2677
	popsramstate
	ret

Func_2684::
	pushsramstateandenable 1
	call Func_26d4
	ld a, [wcdc7]
	ld [hl], a
	popsramstate
	ret

Func_26ac::
	pushsramstateandenable 1
	call Func_26d4
	ld a, [hl]
	ld [wcdc7], a
	popsramstate
	ret

Func_26d4:: ; 26d4 (0:26d4)
	ld a, [wcdc3]
	ld c, a
	ld b, $0
	ld a, [wcdc5]
	and a
	jr nz, .asm_26e5
	ld hl, s1_a3dc
	jr .asm_26e8

.asm_26e5
	ld hl, s1_a403
.asm_26e8
	add hl, bc
	ret

Func_26ea:: ; 26ea (0:26ea)
	pushsramstateandenable_nobankswitch
	call StackFarCopyMemory
	dab s1_a42a
	dab wcdc3
	dw $0016
	popsramstate_nobankswitch
	ret

Func_2706::
	pushsramstateandenable_nobankswitch
	call StackFarCopyMemory
	dab wcdc3
	dab s1_a42a
	dw $0016
	popsramstate_nobankswitch
	ret

Func_2722::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a440
	add hl, bc
	ld a, [wcdc4]
	ld [hli], a
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hli], a
	popsramstate
	ret

Func_275c::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a440
	add hl, bc
	ld a, [hli]
	ld [wcdc4], a
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hli]
	ld [wcdc6], a
	popsramstate
	ret

Func_2796:: ; 2796 (0:2796)
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add c
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wcdc4]
	ld [hli], a
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hli], a
	ld a, [wcdc7]
	ld [hli], a
	ld a, [wcdc8]
	ld [hli], a
	ld a, [wcdc9]
	ld [hli], a
	ld a, [wcdca]
	ld [hli], a
	ld a, [wcdcb]
	ld [hli], a
	ld a, [wcdcc]
	ld [hli], a
	ld a, [wcdcd]
	ld [hli], a
	ld a, [wcdce]
	ld [hli], a
	ld a, [wcdcf]
	ld [hli], a
	ld a, [wcdd0]
	ld [hli], a
	ld a, [wcdd1]
	ld [hli], a
	popsramstate
	ret

Func_27fd:: ; 27fd (0:27fd)
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add c
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [wcdc4], a
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hli]
	ld [wcdc6], a
	ld a, [hli]
	ld [wcdc7], a
	ld a, [hli]
	ld [wcdc8], a
	ld a, [hli]
	ld [wcdc9], a
	ld a, [hli]
	ld [wcdca], a
	ld a, [hli]
	ld [wcdcb], a
	ld a, [hli]
	ld [wcdcc], a
	ld a, [hli]
	ld [wcdcd], a
	ld a, [hli]
	ld [wcdce], a
	ld a, [hli]
	ld [wcdcf], a
	ld a, [hli]
	ld [wcdd0], a
	ld a, [hli]
	ld [wcdd1], a
	popsramstate
	ret

Func_2864::
	ld hl, s1_a45c
	call Func_2796
	ret

Func_286b::
	ld hl, s1_a632
	xor a
	ld [wcdc3], a
	call Func_2796
	ret

Func_2876::
	ld hl, s1_a45c
	call Func_27fd
	ret

Func_287d::
	ld hl, s1_a632
	xor a
	ld [wcdc3], a
	call Func_27fd
	ret

Func_2888::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add c
	add a
	ld c, a
	ld b, $0
	ld hl, s1_a46a
	add hl, bc
	ld a, [wcdc4]
	ld [hli], a
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hli], a
	ld a, [wcdc7]
	ld [hli], a
	ld a, [wcdc8]
	ld [hli], a
	ld a, [wcdc9]
	ld [hli], a
	ld a, [wcdca]
	ld [hli], a
	ld a, [wcdcb]
	ld [hli], a
	ld a, [wcdcc]
	ld [hli], a
	ld a, [wcdcd]
	ld [hli], a
	ld a, [wcdce]
	ld [hli], a
	ld a, [wcdcf]
	ld [hli], a
	popsramstate
	ret

Func_28ea::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	add a
	add a
	add c
	add a
	ld c, a
	ld b, $0
	ld hl, s1_a46a
	add hl, bc
	ld a, [hli]
	ld [wcdc4], a
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hli]
	ld [wcdc6], a
	ld a, [hli]
	ld [wcdc7], a
	ld a, [hli]
	ld [wcdc8], a
	ld a, [hli]
	ld [wcdc9], a
	ld a, [hli]
	ld [wcdca], a
	ld a, [hli]
	ld [wcdcb], a
	ld a, [hli]
	ld [wcdcc], a
	ld a, [hli]
	ld [wcdcd], a
	ld a, [hli]
	ld [wcdce], a
	ld a, [hli]
	ld [wcdcf], a
	popsramstate
	ret

Func_294c::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add a
	add c
	add a
	ld c, a
	ld a, [wcdc4]
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a042
	add hl, bc
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hl], a
	popsramstate
	ret

Func_298a::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add a
	add c
	add a
	ld c, a
	ld a, [wcdc4]
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a042
	add hl, bc
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hl]
	ld [wcdc6], a
	popsramstate
	ret

Func_29c8::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a066
	add hl, bc
	ld a, [wcdc4]
	ld [hli], a
	ld a, [wcdc5]
	ld [hli], a
	ld a, [wcdc6]
	ld [hl], a
	popsramstate
	ret

Func_2a02::
	pushsramstateandenable 1
	ld a, [wcdc3]
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, s1_a066
	add hl, bc
	ld a, [hli]
	ld [wcdc4], a
	ld a, [hli]
	ld [wcdc5], a
	ld a, [hl]
	ld [wcdc6], a
	popsramstate
	ret

Func_2a3c::
	pushsramstateandenable 1
	call Func_2a8c
	ld a, [wcdc5]
	ld [hl], a
	popsramstate
	ret

Func_2a64::
	pushsramstateandenable 1
	call Func_2a8c
	ld a, [hl]
	ld [wcdc5], a
	popsramstate
	ret

Func_2a8c:: ; 2a8c (0:2a8c)
	push bc
	ld a, [wcdc4]
	ld c, a
	ld b, $0
	ld hl, s1_a64e
	add hl, bc
	pop bc
	ret

Func_2a99: ; 2a99 (0:2a99)
	ld a, [hSRAMBank]
	push af
	ld a, $0
	srambankswitch
	ld a, [hSRamEnable]
	push af
	enablesram
	ld de, s0_a000
	ld bc, $a00
	call Func_0570
	pop af
	sramstate
	pop af
	srambankswitch
	call Func_2af5
	jr c, .asm_2aca
	call Func_2de3
.asm_2aca
	ld a, $0
	ld [wce34], a
	xor a
	ld [wce95], a
	ld [wce96], a
	ld [wce97], a
	ld [wce98], a
	ld [wce99], a
	ld [wdad1], a
	ld [wce9b], a
	ld [wcead], a
	ld [wceab], a
	ld a, $1
	ld [wc897], a
	ld hl, hFFB6
	inc [hl]
	ret

Func_2af5: ; 2af5 (0:2af5)
	farcall Func_6af04
	ld a, b
	and a
	jr z, .asm_2b01
	scf
	ret

.asm_2b01
	and a
	ret

Func_2b03: ; 2b03 (0:2b03)
	pushsramstateandenable 0
.asm_2b17
	call Func_2b30
	call Func_2cd9
	ld a, [hFFB6]
	cp $1a
	jr z, .asm_2b17
	popsramstate
	ret

Func_2b30: ; 2b30 (0:2b30)
	ld a, [wce34]
	ld e, a
	ld d, $0
	ld hl, Pointers_2b46 + 2
	add hl, de
	add hl, de
	add hl, de
	ld a, [hld]
	bankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
	jp [hl]

Pointers_2b46::
	dab Func_7c000
	dab Func_7c0a7
	dab Func_14000
	dab Func_14257
	dab Func_2015a
	dab Func_2027f
	dab Func_2435b
	dab Func_244c1
	dab Func_1442e
	dab Func_7c33a
	dab Func_1813f
	dab Func_1821d
	dab Func_182b0
	dab Func_30255
	dab Func_3067d
	dab Func_b8156
	dab Func_b8175
	dab Func_b878c
	dab Func_b8b16
	dab Func_b6aa8
	dab Func_b6bdf
	dab Func_1c000
	dab Func_1c2f4
	dab Func_3d5ab
	dab Func_3d6f4
	dab Func_3d706
	dab Func_1c524
	dab Func_1c747
	dab Func_1cc63
	dab Func_1cc76
	dab Func_64000
	dab Func_649c1
	dab Func_649ce
	dab Func_64c67
	dab Func_64db5
	dab Func_65fc4
	dab Func_661c3
	dab Func_661d0
	dab Func_662c3
	dab Func_662dd
	dab Func_a4f4e
	dab Func_a507a
	dab Func_a509b
	dab Func_a50c5
	dab Func_7dbff
	dab Func_7defa
	dab Func_7df32
	dab Func_7e055
	dab Func_7e182
	dab Func_7e19a
	dab Func_2402f
	dab Func_241b4
	dab Func_104000
	dab Func_104222
	dab Func_10424f
	dab Func_1042b3
	dab Func_1042c6
	dab Func_106719
	dab Func_106865
	dab Func_106992
	dab Func_188cf
	dab Func_18a9d
	dab Func_9cf0f
	dab Func_9d0ff
	dab Func_9d106
	dab Func_9d130
	dab Func_1887e
	dab Func_188a3
	dab Func_d56c9
	dab Func_d5828
	dab Func_d584f
	dab Func_d5879

Func_2c1e::
	push af
	push bc
	push de
	push hl
	ld a, [hVBlankHasOccurred]
	and a
	jr z, .asm_2c97
	ld a, [hFFBB]
	and a
	jr z, .asm_2c43
	ld h, a
	ld a, [hFFBA]
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, [hFFBC]
	ld [hROMBank], a
	ld [MBC5RomBank], a
	call Func_2cd8
	pop af
	ld [hROMBank], a
	ld [MBC5RomBank], a
.asm_2c43
	call hPushOAM
	ld a, [wcf0c]
	and a
	call nz, Func_347d
	call wce4b
	call wce48
	call wce51
	ei
	xor a
	ld [hVBlankHasOccurred], a
	ld a, [hLCDC]
.asm_2c5c
	ld [rLCDC], a
	ld a, [wce3b]
	and a
	jr nz, .asm_2c80
	ld a, [hFFAC]
	ld [rSCX], a
	ld [wce3d], a
	ld a, [hFFAD]
	ld [rSCY], a
.asm_2c6f
	ld [wce3e], a
	ld a, [hFFAE]
	ld [rWX], a
	ld [wce3f], a
	ld a, [hFFAF]
	ld [rWY], a
	ld [wce40], a
.asm_2c80
	call Func_2d7c
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	ld hl, hFFB7
	inc [hl]
	ld hl, hFFB8
	ld [hl], $0
	pop hl
	pop de
	pop bc
	pop af
	reti
.asm_2c97
	ld b, $1
.asm_2c99
	dec b
	jr nz, .asm_2c99
	ei
	ld a, [hLCDC]
	ld [rLCDC], a
	ld a, [wce3b]
	and a
	jr nz, .asm_2cc6
	ld a, [hFFAC]
	ld [rSCX], a
	ld [wce3d], a
	ld a, [hFFAD]
	ld [rSCY], a
	ld [wce3e], a
	ld a, [hFFAE]
	ld [rWX], a
	ld [wce3f], a
	ld a, [hFFAF]
	ld [rWY], a
	ld [wce40], a
	call Func_0504
.asm_2cc6
	call Func_2d7c
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	ld hl, hFFB8
	inc [hl]
	pop hl
	pop de
	pop bc
	pop af
	reti
Func_2cd8: ; 2cd8 (0:2cd8)
	jp [hl]

Func_2cd9: ; 2cd9 (0:2cd9)
	push bc
	push de
	push hl
	ld a, [hFFB8]
	push af
	call Func_0532
	call ReadJoypad
	call Func_038c
	call Func_0e31
	ld hl, wce35
	inc [hl]
	pop af
	inc a
.asm_2cf1
	push af
	ld a, [hFFEB]
	and a
	call nz, Func_13eb
	pop af
	dec a
	jr nz, .asm_2cf1
	pop hl
	pop de
	pop bc
	ret

Func_2d00::
	farcall Func_1036d
	ret

Func_2d07::
	ld a, [hVRAMBank]
	push af
	xor a
	vrambankswitch
	ld a, [wce54]
	and a
	jr z, .asm_2d2e
	dec a
	jr nz, .asm_2d44
	ld a, $a300 / $100
	ld [rHDMA1], a
	ld a, $a300 % $100
	ld [rHDMA2], a
	ld a, $9500 / $100
	ld [rHDMA3], a
	ld a, $9500 % $100
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a
	jr .asm_2d58

.asm_2d2e
	ld a, $a300 / $100
	ld [rHDMA1], a
	ld a, $a300 % $100
	ld [rHDMA2], a
	ld a, $9100 / $100
	ld [rHDMA3], a
	ld a, $9100 % $100
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a
	jr .asm_2d58

.asm_2d44
	ld a, $a300 / $100
	ld [rHDMA1], a
	ld a, $a300 % $100
	ld [rHDMA2], a
	ld a, $9160 / $100
	ld [rHDMA3], a
	ld a, $9160 % $100
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a
.asm_2d58
	ld a, $c9
	ld [wce48], a
	pop af
	vrambankswitch
	ret

Func_2d63::
	ld a, [hVRAMBank]
	push af
	xor a
	vrambankswitch
	farcall Func_a5383
	ld a, $c9
	ld [wce51], a
	pop af
	vrambankswitch
	ret

Func_2d7c:: ; 2d7c (0:2d7c)
	ld a, [wce3a]
	and a
	jr nz, .asm_2d85
	call Func_0545
.asm_2d85
	ret

Func_2d86::
	ld hl, wc495
	ld a, $80
	ld [rBGPI], a
	ld b, $10
	ld c, $69
.asm_2d91
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .asm_2d91
	ret

Func_2d97::
	ld a, $b4
	ld [rBGPI], a
	ld a, [wc5df]
	ld [rBGPD], a
	ld a, [wc5e0]
	ld [rBGPD], a
	ld a, $bc
	ld [rBGPI], a
	ld a, [wc5e1]
	ld [rBGPD], a
	ld a, [wc5e2]
	ld [rBGPD], a
	ret

Func_2db4:: ; 2db4 (0:2db4)
	ld a, $c9
	ld [wce48], a
	ld [wce4e], a
	ld [wce4b], a
	ld [wce51], a
	ret

Func_2dc3::
	call Func_2db4
	xor a
	ld [hFFBA], a
	ld [hFFBB], a
	ld hl, wVBlank
	ld [hl], $c3 ; jp
	inc hl
	ld [hl], Func_2c1e % $100
	inc hl
	ld [hl], Func_2c1e / $100
	ret

Func_2dd7::
	ld hl, wVBlank
	ld [hl], $c3 ; jp
	inc hl
	ld [hl], DefaultVBlank % $100
	inc hl
	ld [hl], DefaultVBlank / $100
	ret

Func_2de3:: ; 2de3 (0::2de3)
	call Func_2dea
	call Func_2e04
	ret

Func_2dea:: ; 2dea (0::2dea)
	ld de, wce34
	ld bc, $68
	call Func_0570
	call Func_2db4
	ret

Func_2df7::
	ld de, wce3a
	ld bc, $62
	call Func_0570
	call Func_2db4
	ret

Func_2e04:: ; 2e04 (0::2e04)
	ld a, [hWRAMBank]
	push af
	ld a, $1
	wrambankswitch
	ld de, wdaa1
	ld bc, $50f
	call Func_0570
	pop af
	wrambankswitch
	ret

Func_2e1c::
	ld a, $1
	wrambankswitch
	ld a, [wcea1]
	ld c, a
	ld b, $0
	ld hl, Data_2e3d
	add hl, bc
	ld a, [hl]
	ld [wce36], a
	ld a, $e
	ld [wce34], a
	ld a, $1a
	ld [hFFB6], a
	xor a
	ld [hFFBB], a
	ret

Data_2e3d::
	db $4f
	db $60
	db $7e
	db $91
	db $a2
	db $71
	db $b3
	db $bc
	db $c5

Func_2e46::
	ld a, [hWRAMBank]
	push af
	ld a, $1
	wrambankswitch
	ld a, [wddb6]
	cp $4
	jr z, .asm_2e6b
	call Func_0180
	cpl
	ld d, c
	ld b, b
	and a
	jr z, .asm_2e6b
	ld a, $1
	ld [wdefb], a
	ld a, $10
	ld [wce34], a
	jr .asm_2e72

.asm_2e6b
	ld a, $a
	ld [wce34], a
	jr .asm_2e72

.asm_2e72
	ld a, $1a
	ld [hFFB6], a
	xor a
	ld [hFFBB], a
	pop af
	wrambankswitch
	ret

Func_2e7f::
	dec bc
	inc b
	inc c
.asm_2e82
	ld a, [rSTAT]
	and $3
	jr z, .asm_2e82
.asm_2e88
	ld a, [rSTAT]
	and $3
	jr nz, .asm_2e88
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2e82
	dec b
	jr nz, .asm_2e82
	ret

Func_2e98::
.asm_2e98
	ld a, [rSTAT]
	and $3
	jr z, .asm_2e98
.asm_2e9e
	ld a, [rSTAT]
	and $3
	jr nz, .asm_2e9e
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2e98
	ret

Func_2eab::
	pop bc
	ld hl, $9
	add hl, bc
	push hl
	ld l, c
	ld h, b
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [hFF8C], a
	ld a, [hli]
	ld [hFF8D], a
	ld a, [hli]
	ld [hFF8E], a
	ld a, [hli]
	ld [hFF8F], a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [hFF90], a
	ld a, [hROMBank]
	push af
	ld a, [hSRAMBank]
	push af
	ld a, [hVRAMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld a, d
	cp $80
	jr c, .asm_2efc
	cp $a0
	jr c, .asm_2ef4
	cp $c0
	jr c, .asm_2eeb
	ld a, [hFF8C]
	wrambankswitch
	jr .asm_2efe

.asm_2eeb
	ld a, [hFF8C]
	srambankswitch
	jr .asm_2efe

.asm_2ef4
	ld a, [hFF8C]
	vrambankswitch
	jr .asm_2efe

.asm_2efc
	jr .asm_2efc

.asm_2efe
	ld a, [hFF8D]
	ld l, a
	ld a, [hFF8E]
	ld h, a
	cp $80
	jr c, .asm_2f29
	cp $a0
	jr c, .asm_2f21
	cp $c0
	jr c, .asm_2f18
	ld a, [hFF8F]
	wrambankswitch
	jr .asm_2f30

.asm_2f18
	ld a, [hFF8F]
	srambankswitch
	jr .asm_2f30

.asm_2f21
	ld a, [hFF8F]
	vrambankswitch
	jr .asm_2f30

.asm_2f29
	ld a, [hFF8F]
	bankswitch
.asm_2f30
	ld a, c
	and a
	jr nz, .asm_2f38
	ld a, b
	and a
	jr z, .asm_2f5f
.asm_2f38
	dec bc
	inc b
	inc c
.asm_2f3b
	ld a, [rSTAT]
	and $3
	jr z, .asm_2f3b
.asm_2f41
	ld a, [rSTAT]
	and $3
	jr nz, .asm_2f41
	ld a, [rLY]
	cp $98
	jr nc, .asm_2f3b
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2f3b
	dec b
	jr nz, .asm_2f3b
.asm_2f5f
	ld a, [hFF90]
	and a
	jr z, .asm_2f7d
	ld b, a
.asm_2f65
	ld a, [rSTAT]
	and $3
	jr z, .asm_2f65
.asm_2f6b
	ld a, [rSTAT]
	and $3
	jr nz, .asm_2f6b
	ld a, [rLY]
	cp $98
	jr nc, .asm_2f65
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2f65
.asm_2f7d
	pop af
	wrambankswitch
	pop af
	vrambankswitch
	pop af
	srambankswitch
	pop af
	bankswitch
	ret

Func_2f94::
	pop bc
	ld hl, $8
	add hl, bc
	push hl
	ld l, c
	ld h, b
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [hFF8C], a
	ld a, [hli]
	ld [hFF8D], a
	ld a, [hli]
	ld [hFF8E], a
	ld a, [hli]
	ld [hFF8F], a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, [hSRAMBank]
	push af
	ld a, [hVRAMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld a, d
	cp $80
	jr c, .asm_2fe2
	cp $a0
	jr c, .asm_2fda
	cp $c0
	jr c, .asm_2fd1
	ld a, [hFF8C]
	wrambankswitch
	jr .asm_2fe4

.asm_2fd1
	ld a, [hFF8C]
	srambankswitch
	jr .asm_2fe4

.asm_2fda
	ld a, [hFF8C]
	vrambankswitch
	jr .asm_2fe4

.asm_2fe2
	jr .asm_2fe2

.asm_2fe4
	ld a, [hFF8D]
	ld l, a
	ld a, [hFF8E]
	ld h, a
	cp $80
	jr c, .asm_300f
	cp $a0
	jr c, .asm_3007
	cp $c0
	jr c, .asm_2ffe
	ld a, [hFF8F]
	wrambankswitch
	jr .asm_3016

.asm_2ffe
	ld a, [hFF8F]
	srambankswitch
	jr .asm_3016

.asm_3007
	ld a, [hFF8F]
	vrambankswitch
	jr .asm_3016

.asm_300f
	ld a, [hFF8F]
	bankswitch
.asm_3016
	dec bc
	inc b
	inc c
.asm_3019
	ld a, [rSTAT]
	and $3
	jr z, .asm_3019
.asm_301f
	ld a, [rSTAT]
	and $3
	jr nz, .asm_301f
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3019
	dec b
	jr nz, .asm_3019
	pop af
	wrambankswitch
	pop af
	vrambankswitch
	pop af
	srambankswitch
	pop af
	bankswitch
	ret

.asm_3045
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_3045
	ld a, [hFF8A]
	ld b, a
	ld a, [hFF8B]
.asm_3050
	inc de
	dec a
	jr nz, .asm_3050
	dec c
	jr nz, .asm_3045
	ret

.asm_3058
	ld a, [rSTAT]
	and $3
	jr z, .asm_3058
.asm_305e
	ld a, [rSTAT]
	and $3
	jr nz, .asm_305e
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_3058
	ld a, [hFF8A]
	ld b, a
	ld a, [hFF8B]
.asm_306f
	inc de
	dec a
	jr nz, .asm_306f
	dec c
	jr nz, .asm_3058
	ret

.asm_3077
	ld a, [rSTAT]
	and $3
	jr z, .asm_3077
.asm_307d
	ld a, [rSTAT]
	and $3
	jr nz, .asm_307d
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_3077
	ld a, [hFF8A]
	ld b, a
	ld a, [hFF8B]
.asm_308e
	inc de
	inc hl
	dec a
	jr nz, .asm_308e
	dec c
	jr nz, .asm_3077
	ret

Func_3097::
	pop bc
	ld hl, $9
	add hl, bc
	push hl
	ld l, c
	ld h, b
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [hFF8C], a
	ld a, [hli]
	ld [hFF8D], a
	ld a, [hli]
	ld [hFF8E], a
	ld a, [hli]
	ld [hFF8F], a
	ld a, [hli]
	ld [hFF90], a
	ld a, [hli]
	ld [hFF91], a
	ld a, [hli]
	ld [hFF92], a
	ld a, [hROMBank]
	push af
	ld a, [hSRAMBank]
	push af
	ld a, [hVRAMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld a, d
	cp $80
	jr c, .asm_30ea
	cp $a0
	jr c, .asm_30e2
	cp $c0
	jr c, .asm_30d9
	ld a, [hFF8C]
	wrambankswitch
	jr .asm_30ec

.asm_30d9
	ld a, [hFF8C]
	srambankswitch
	jr .asm_30ec

.asm_30e2
	ld a, [hFF8C]
	vrambankswitch
	jr .asm_30ec

.asm_30ea
	jr .asm_30ea

.asm_30ec
	ld a, [hFF8D]
	ld l, a
	ld a, [hFF8E]
	ld h, a
	cp $80
	jr c, .asm_3117
	cp $a0
	jr c, .asm_310f
	cp $c0
	jr c, .asm_3106
	ld a, [hFF8F]
	wrambankswitch
	jr .asm_311e

.asm_3106
	ld a, [hFF8F]
	srambankswitch
	jr .asm_311e

.asm_310f
	ld a, [hFF8F]
	vrambankswitch
	jr .asm_311e

.asm_3117
	ld a, [hFF8F]
	bankswitch
.asm_311e
	ld a, [hFF90]
	ld b, a
	ld a, [hFF92]
	ld c, a
.asm_3124
	ld a, [rSTAT]
	and $3
	jr z, .asm_3124
.asm_312a
	ld a, [rSTAT]
	and $3
	jr nz, .asm_312a
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_3124
	ld a, [hFF90]
	ld b, a
	ld a, [hFF91]
	add e
	ld e, a
	jr nc, .asm_3140
	inc d
.asm_3140
	dec c
	jr nz, .asm_3124
	pop af
	wrambankswitch
	pop af
	vrambankswitch
	pop af
	srambankswitch
	pop af
	bankswitch
	ret

Func_315a::
	ld l, e
	ld h, d
	dec bc
	inc b
	inc c
.asm_315f
	ld a, [rSTAT]
	and $3
	jr z, .asm_315f
.asm_3165
	ld a, [rSTAT]
	and $3
	jr nz, .asm_3165
	xor a
	ld [hli], a
	dec c
	jr nz, .asm_315f
	dec b
	jr nz, .asm_315f
	ret

.asm_3174
	ld a, [rSTAT]
	and $3
	jr z, .asm_3174
.asm_317a
	ld a, [rSTAT]
	and $3
	jr nz, .asm_317a
	xor a
	ld [hli], a
	dec c
	jr nz, .asm_3174
	ret

.asm_3186
	ld a, [rSTAT]
	and $3
	jr z, .asm_3186
.asm_318c
	ld a, [rSTAT]
	and $3
	jr nz, .asm_318c
	ret

	push af
.asm_3194
	ld a, [rSTAT]
	and $3
	jr z, .asm_3194
.asm_319a
	ld a, [rSTAT]
	and $3
	jr nz, .asm_319a
	pop af
	ret

Func_31a2::
	ld hl, Func_31c2
	ld de, wLCDInterrupt
	ld bc, $7
	call CopyBytes
	ld a, [rSTAT]
	or $40
	ld [rSTAT], a
	ld a, $77
	ld [rLYC], a
	xor a
	ld [rIF], a
	ld a, $3
	ld [hFFAA], a
	ld [rIE], a
	ret

Func_31c2::
	push af
	ld a, $b0
	ld [rWX], a
	pop af
	reti

Func_31c9::
.asm_31c9
	ld a, [rSTAT]
	and $3
	jr z, .asm_31c9
.asm_31cf
	ld a, [rSTAT]
	and $3
	jr nz, .asm_31cf
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_31c9
	ret

.asm_31dc
	push af
.asm_31dd
	ld a, [rSTAT]
	and $3
	jr z, .asm_31dd
.asm_31e3
	ld a, [rSTAT]
	and $3
	jr nz, .asm_31e3
	ld a, $1
	vrambankswitch
	ld a, [de]
	ld [hl], a
	ld a, $0
	vrambankswitch
	ld a, [bc]
	ld [hli], a
	inc de
	inc bc
	pop af
	dec a
	jr nz, .asm_31dc
	ret

.asm_3200
	ld a, [rSTAT]
	and $3
	jr z, .asm_3200
.asm_3206
	ld a, [rSTAT]
	and $3
	jr nz, .asm_3206
	push hl
	ld l, c
	ld h, b
	ld a, $1
	vrambankswitch
	ld a, [hli]
	ld [de], a
	ld c, l
	ld b, h
	pop hl
	xor a
	vrambankswitch
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hFF8C]
	dec a
	ld [hFF8C], a
	jr nz, .asm_3200
	ld a, [hFF8D]
	ld [hFF8C], a
	ld a, [hFF8B]
.asm_322f
	inc de
	dec a
	jr nz, .asm_322f
	ld a, [hFF8A]
	dec a
	ld [hFF8A], a
	jr nz, .asm_3200
	ret

.asm_323b
	ld [hli], a
	dec b
	jr nz, .asm_323b
	ret

Func_3240::
	ld d, a
.asm_3241
	ld a, [rSTAT]
	and $3
	jr z, .asm_3241
.asm_3247
	ld a, [rSTAT]
	and $3
	jr nz, .asm_3247
	ld a, d
	ld [hli], a
	dec b
	jr nz, .asm_3241
	ret

Func_3253::
	dec bc
	inc b
	inc c
.asm_3256
	ld [hli], a
	dec c
	jr nz, .asm_3256
	dec b
	jr nz, .asm_3256
	ret

Func_325e::
.asm_325e
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	dec b
	jr nz, .asm_325e
	ret

Func_3266::
	call Random
	jp RoughlyDivideBy5

Func_326c::
	call Random
	jp RoughlyDivideBy6

Func_3272::
	push hl
	push de
	push bc
	ld a, [hFFB8]
	push af
	call Func_0532
	call ReadJoypad
	call Func_0e31
	pop af
	inc a
.asm_3283
	push af
	ld a, [hFFEB]
	and a
	call nz, Func_13eb
	farcall Func_10e63
	pop af
	dec a
	jr nz, .asm_3283
	pop bc
	pop de
	pop hl
	ret

Func_3298::
	push af
	push bc
	push de
	push hl
	ld a, [hVBlankHasOccurred]
	and a
	jr z, .asm_32cf
	call hPushOAM
	call wd28c
	ei
	ld a, [hLCDC]
	ld [rLCDC], a
	ld a, [hFFAC]
	ld [rSCX], a
	ld a, [hFFAD]
	ld [rSCY], a
	ld a, [hFFAE]
	ld [rWX], a
	xor a
	ld [hVBlankHasOccurred], a
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	ld hl, hFFB7
	inc [hl]
	ld hl, hFFB8
	ld [hl], $0
	pop hl
	pop de
	pop bc
	pop af
	reti

.asm_32cf
	ei
	ld hl, hFFB8
	inc [hl]
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	pop hl
	pop de
	pop bc
	pop af
	reti
	push af
	push bc
	push de
	push hl
	ld a, [hVBlankHasOccurred]
	and a
	jr z, .asm_3329
	ld a, [hFFBB]
	and a
	jr z, .asm_3304
	ld h, a
	ld a, [hFFBA]
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, [hFFBC]
	bankswitch
	call ._hl_
	pop af
	bankswitch
.asm_3304
	ei
	ld a, [hLCDC]
	ld [rLCDC], a
	ld a, [hFFAC]
	ld [rSCX], a
	ld a, [hFFAD]
	ld [rSCY], a
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	ld hl, hFFB7
	inc [hl]
	ld hl, hFFB8
	ld [hl], $0
	xor a
	ld [hVBlankHasOccurred], a
	pop hl
	pop de
	pop bc
	pop af
	reti

._hl_
	jp [hl]

.asm_3329
	ei
	ld hl, hFFB8
	inc [hl]
	ld a, [hFFEB]
	and a
	call z, Func_13eb
	pop hl
	pop de
	pop bc
	pop af
	reti

Func_3339::
	ld a, [hVRAMBank]
	push af
	ld a, $0
	vrambankswitch
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_160445)
	bankswitch
	debgcoord 12, 2
	ld hl, Data_160445
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	debgcoord 2, 4
	ld hl, Data_1604c5
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	bankswitch
	pop af
	vrambankswitch
	ret

Func_3397::
	ld a, [hVRAMBank]
	push af
	ld a, $0
	vrambankswitch
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_16044d)
	bankswitch
	debgcoord 12, 2
	ld hl, Data_16044d
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	debgcoord 2, 4
	ld hl, Data_1604ce
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	bankswitch
	pop af
	vrambankswitch
	ret

Func_33f5::
	ld a, [hROMBank]
	push af
	ld hl, wdd21
	ld a, [hld]
	bankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, [hli]
	ld e, a
	ld a, l
	ld [wdd1f], a
	ld a, h
	ld [wdd20], a
	pop af
	bankswitch
	ld a, e
	ret

Func_3416:: ; 3416 (0::3416)
	ld c, a
	inc c
	ld a, [hROMBank]
	push af
.asm_341b
	ld hl, wdd14
	ld a, [hld]
	bankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
.asm_3427
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and a
	jr z, .asm_341b
	dec c
	jr nz, .asm_3427
	pop af
	bankswitch
	ret

Func_3438::
	ld a, [hROMBank]
	push af
.asm_343b
	ld hl, wdd1e
	ld a, [hld]
	bankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	inc d
	dec d
	jr nz, .asm_3465
	xor a
	call Func_3416
	ld a, e
	ld [wdd1c], a
	ld a, d
	ld [wdd1d], a
	ld a, [wdd14]
	ld [wdd1e], a
	jr .asm_343b

.asm_3465
	ld a, l
	ld [wdd1c], a
	ld a, h
	ld [wdd1d], a
	ld c, $0
	inc hl
	ld a, [hl]
	and a
	jr nz, .asm_3476
	ld c, $1
.asm_3476
	pop af
	bankswitch
	ret

Func_347d:: ; 347d (0::347d)
	ld a, [wcf0c]
	dec a
	jp z, Func_348f
	dec a
	jp z, Func_34b9
	dec a
	jp z, Func_3500
.soft_lock
	jr .soft_lock

Func_348e::
	ret

Func_348f:: ; 348f (0::348f)
	ld a, [hVRAMBank]
	push af
	ld hl, wcf0f
	ld a, [hld]
	vrambankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, wc300 / $100
	ld [rHDMA1], a
	ld a, wc300 % $100
	ld [rHDMA2], a
	ld a, h
	ld [rHDMA3], a
	ld a, l
	ld [rHDMA4], a
	ld a, $0
	ld [rHDMA5], a
	xor a
	ld [wcf0c], a
	pop af
	vrambankswitch
	ret

Func_34b9:: ; 34b9 (0::34b9)
	ld a, [hVRAMBank]
	push af
	ld hl, wcf0f
	ld a, [hld]
	vrambankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, wc300 / $100
	ld [rHDMA1], a
	ld a, wc300 % $100
	ld [rHDMA2], a
	ld a, h
	ld [rHDMA3], a
	ld a, l
	ld [rHDMA4], a
	ld a, $0
	ld [rHDMA5], a
	ld hl, wcf12
	ld a, [hld]
	vrambankswitch
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, wc310 / $100
	ld [rHDMA1], a
	ld a, wc310 % $100
	ld [rHDMA2], a
	ld a, h
	ld [rHDMA3], a
	ld a, l
	ld [rHDMA4], a
	ld a, $0
	ld [rHDMA5], a
	xor a
	ld [wcf0c], a
	pop af
	vrambankswitch
	ret

Func_3500:: ; 3500 (0::3500)
	ld a, [hVRAMBank]
	push af
	ld hl, wcf13
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $1
	vrambankswitch
	ld a, [wcf16]
	ld [hl], a
	xor a
	vrambankswitch
	ld a, [wcf15]
	ld [hl], a
	xor a
	ld [wcf0c], a
	pop af
	vrambankswitch
	ret

Func_3526::
	ld l, a
	ld h, $0
	ld a, [hROMBank]
	push af
	ld a, b
	bankswitch
	ld c, l
	ld b, h
	add hl, hl
	add hl, bc
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld b, [hl]
	farcall Func_10c011
	pop af
	bankswitch
	ret

Func_3549::
	ld a, [hROMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld hl, wdd26
	ld a, [hld]
	bankswitch
	dec hl
	call Func_02f4
	pop af
	wrambankswitch
	pop af
	bankswitch
	ret

Func_3568::
	ld a, [hROMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld hl, wdd26
	ld a, [hld]
	bankswitch
	dec hl
	call Func_02f4
	jr nc, .asm_358a
	pop af
	wrambankswitch
	pop af
	bankswitch
	scf
	ret

.asm_358a
	pop af
	wrambankswitch
	pop af
	bankswitch
	and a
	ret

Func_3597::
	ld a, [hROMBank]
	push af
	ld a, [hWRAMBank]
	push af
	ld hl, wdd17
	ld a, [hld]
	bankswitch
	dec hl
	call Func_02f4
	pop af
	wrambankswitch
	pop af
	bankswitch
	ret
