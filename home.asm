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
	; wVBlank:: jp DefaultVBlank
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

Func_05f2:: ; 5f2 (0:05f2)
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
addr = hFFC4
REPT 6
	ld a, [addr]
	ld l, a
	ld a, [addr + 1]
	ld h, a
	push hl
addr = addr + 2
ENDR
	ld hl, sp+$e
	ld bc, hFFC4
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
	ld a, [hFFC4]
	ld l, a
	ld a, [hFFC5]
	ld h, a
	cp $80
	jr c, .soft_lock
	cp $a0
	jr c, .vram
	cp $c0
	jr c, .sram
	cp $d0
	jr c, .continue
	ld a, [hFFC6]
	wrambankswitch
	jr .continue

.sram
	ld a, [hFFC6]
	srambankswitch
	jr .continue

.vram
	ld a, [hFFC6]
	vrambankswitch
	jr .continue

.soft_lock
	jr .soft_lock

.continue
	ld a, [hFFC7]
	ld e, a
	ld a, [hFFC8]
	ld d, a
	cp $80
	jr c, .rom2
	cp $a0
	jr c, .vram2
	cp $c0
	jr c, .sram2
	cp $d0
	jr c, .continue2
	ld a, [hFFC9]
	wrambankswitch
	jr .continue2

.sram2
	ld a, [hFFC9]
	srambankswitch
	jr .continue2

.vram2
	ld a, [hFFC9]
	vrambankswitch
	jr .continue2

.rom2
	ld a, [hFFC9]
	bankswitch
.continue2
	ld a, [hFFCC]
	ld c, a
	ld a, [hFFCD]
	ld b, a
	ld a, [hFFCE]
	and a
	jr z, .asm_079e
	ld a, [hFFCF]
	inc a
	ld [hFFCF], a
.asm_079e
	push bc
	ld a, [hFFCA]
	ld c, a
	ld a, [hFFCB]
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
	ld a, [hFFCE]
	dec a
	ld [hFFCE], a
	jr nz, .asm_079e
	ld a, [hFFCF]
	dec a
	ld [hFFCF], a
	jr nz, .asm_079e
	pop af
	wrambankswitch
	pop af
	srambankswitch
	pop af
	vrambankswitch
	pop af
	bankswitch
addr = hFFCE
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

Func_09a0::
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
.asm_0a3e
	add hl, bc
	ld c, $7
.asm_0a42
	ld a, [de]
	cp [hl]
	jr nz, .asm_0a4d
	dec de
	dec hl
	dec c
	jr nz, .asm_0a42
	xor a
	and a
.asm_0a4d
	pop bc
	ret

Func_0a4f::
	push de
	push bc
	push bc
	ld c, $dc
	ld b, $a
	ld a, [de]
	add [hl]
	cp b
	jr c, .asm_0a5c
	sub b
.asm_0a5c
	ld [hFFDC], a
	ccf
	inc hl
	inc de
	ld a, [de]
	adc [hl]
	cp b
	jr c, .asm_0a67
	sub b
.asm_0a67
	ld [hFFDD], a
	ccf
	inc hl
	inc de
	ld a, [de]
	adc [hl]
	cp b
	jr c, .asm_0a72
	sub b
.asm_0a72
	ld [hFFDE], a
	ccf
	inc hl
	inc de
	ld a, [de]
	adc [hl]
	cp b
	jr c, .asm_0a7d
	sub b
.asm_0a7d
	ld [hFFDF], a
	ccf
	inc hl
	inc de
	ld a, [de]
	adc [hl]
	cp b
	jr c, .asm_0a88
	sub b
.asm_0a88
	ld [hFFE0], a
	ccf
	inc hl
	inc de
	ld a, [de]
	adc [hl]
	cp b
	jr c, .asm_0a93
	sub b
.asm_0a93
	ld [hFFE1], a
	ccf
	inc hl
	inc de
	ld a, [de]
	adc [hl]
	cp b
	jr c, .asm_0a9e
	sub b
.asm_0a9e
	ld [hFFE2], a
	pop hl
	ld de, $6
	add hl, de
	ld a, [hFFE2]
	cp [hl]
	jr z, .asm_0aae
	jr nc, .asm_0b02
	jr .asm_0aea

.asm_0aae
	dec hl
	ld a, [hFFE1]
	cp [hl]
	jr z, .asm_0ab8
	jr nc, .asm_0b02
	jr .asm_0aea

.asm_0ab8
	dec hl
	ld a, [hFFE0]
	cp [hl]
	jr z, .asm_0ac2
	jr nc, .asm_0b02
	jr .asm_0aea

.asm_0ac2
	dec hl
	ld a, [hFFDF]
	cp [hl]
	jr z, .asm_0acc
	jr nc, .asm_0b02
	jr .asm_0aea

.asm_0acc
	dec hl
	ld a, [hFFDE]
	cp [hl]
	jr z, .asm_0ad6
	jr nc, .asm_0b02
	jr .asm_0aea

.asm_0ad6
	dec hl
	ld a, [hFFDD]
	cp [hl]
	jr z, .asm_0ae0
	jr nc, .asm_0b02
	jr .asm_0aea

.asm_0ae0
	dec hl
	ld a, [hFFDC]
	cp [hl]
	jr z, .asm_0aea
	jr nc, .asm_0b02
	jr .asm_0aea

.asm_0aea
	pop hl
	pop hl
	ld a, [hFFDC]
	ld [hli], a
	ld a, [hFFDD]
	ld [hli], a
	ld a, [hFFDE]
	ld [hli], a
	ld a, [hFFDF]
	ld [hli], a
	ld a, [hFFE0]
	ld [hli], a
	ld a, [hFFE1]
	ld [hli], a
	ld a, [hFFE2]
	ld [hli], a
	ret

.asm_0b02
	pop hl
	pop de
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
	ld a, $0
	ld [wc36e], a
	ld [wc36f], a
	ld [wc370], a
	ld [wc371], a
	ret

Func_0d05::
	call Func_0d3a
	ld a, $3a
	ld [wc3a0], a
	ld [wc360], a
	ld [wc364], a
	ld [wc36c], a
	ret

Func_0d17::
	call Func_0cf3
	ld a, $3a
	ld [wc3a0], a
	ld [wc360], a
	ld [wc364], a
	ret

Func_0d26::
	call Func_0d3a
	ld a, $18
	ld [wc362], a
	ld hl, Data_1013d
	ld a, BANK(Data_1013d)
	call GetFarByteHL
	ld [wc363], a
	ret

Func_0d3a:: ; d3a (0:0d3a)
	push hl
	push de
	call Func_05f2
	ld b, d
	jp Func_1c00

Func_0d43::
	ld b, c
	inc b
	ld a, l
	nop
	pop de
	pop hl
	ld a, $2a
	ld [wc362], a
	ld a, $e2
	ld [wc363], a
	ld a, $2a
	ld [wc372], a
	ld a, $fe
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

Func_0f49:: ; f49 (0::0f49)
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

Func_0fca:: ; fca (0::0fca)
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

Func_137a::
	dr $137a, $13eb

Func_13eb::
	dr $13eb, $1c00

Func_1c00::
	dr $1c00, $2a99

Func_2a99::
	dr $2a99, $2b03

Func_2b03::
	dr $2b03, $35b6
