Func_0d91:: ; d91 (0:0d91)
	call Func_0daf
	di
	ld a, $0
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	ei
	ret

Fimc_0d9f:: ; 0d9f
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
	call ClearMemory
	ld de, wc100
	ld bc, $200
	call ClearMemory
	ld de, hFFE7
	ld bc, $a
	call ClearMemory
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

Func_0df9:: ; 0df9
	xor a
	ld [rSB], a
	ld [hFFEC], a
	ld [hFFE8], a
	ld [hFFEB], a
	ret

Func_0e03:: ; 0e03
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

Func_0e16:: ; 0e16
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
	jr z, .not_linked
	call Func_0e20
	jr z, asm_0e27
.not_linked
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
