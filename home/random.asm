Func_1f46::
	ld b, $0
	ld a, [hJoyPressed]
	and a
	jr nz, .asm_1f4e
	inc b
.asm_1f4e
	inc b
	ld hl, wRandomStateIdx
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
	ld hl, wRandomStateIdx
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
	ld a, BANK(PseudoRNGTable)
	bankswitch
	ld a, [hl]
	ld hl, PseudoRNGTable
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
