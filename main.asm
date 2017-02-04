INCLUDE "includes.asm"
SECTION "Bank 01", ROMX, BANK [$01]
Softlock_4000:: ; 4000
	jp Softlock_4000

Func_4003:: ; 4003 (1:4003)
	callba_bank1 Func_68ebb
	callba_bank1 Func_44000
Func_4013: ; 4013 (1:4013)
	xor a
	ld [wcdf2], a
	callba_bank1 Func_76ff5
	ld a, [wcd6f]
	and a
	jr z, .asm_4037
	ld a, [wc893]
	and a
	jp z, Func_40c2
	callba_bank1 Func_779a1
	jp Func_40c2

.asm_4037
	callba_bank1 Func_78000
	call Func_1ff0
	call Func_6c1f
	call Func_69b3
	call Func_427a
	call Func_43e0
	call Func_46c6
	call Func_4cf7
	call Func_4f43
	callba_bank1 Func_5146
	callba_bank1 Func_9c22
	callba_bank1 Func_808b
	callba_bank1 Func_8d59
	callba_bank1 Func_9306
	call Func_4763
	call Func_6ed3
	call Func_6ef3
	callba_bank1 Func_6c085
	callba_bank1 Func_40004
	ld hl, wca27
	ld a, [hl]
	add $1
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hld], a
	ld a, [hli]
	sub $10
	ld a, [hld]
	sbc $e
	jr c, Func_40c2
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wca25
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wca23
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hld], a
	jr nc, Func_40c2
	xor a
	ld [hli], a
	ld [hl], a
Func_40c2: ; 40c2 (1:40c2)
	call Func_413e
	ld a, [wc887]
	cp $0
	jp z, Func_4013
	ld a, [wc887]
	cp $1
	jr z, .asm_40e2
	cp $2
	jr z, .asm_40fa
	cp $3
	jr z, .asm_40ea
	cp $4
	jr z, .asm_40f2
.asm_40e0
	jr .asm_40e0

.asm_40e2
	ld a, $6
	ld [hFFB6], a
	xor a
	ld [hFFBB], a
	ret

.asm_40ea
	ld a, $7
	ld [hFFB6], a
	xor a
	ld [hFFBB], a
	ret

.asm_40f2
	ld a, $8
	ld [hFFB6], a
	xor a
	ld [hFFBB], a
	ret

.asm_40fa
	ld a, [wc886]
	add $a
	ld [hFFB6], a
	xor a
	ld [hFFBB], a
	ret

Func_4105:: ; 4105
	callba_bank1 Func_78000
	call Func_1ff0
	call Func_6c1f
	call Func_69b3
	call Func_43e0
	call Func_4cf7
	call Func_4f43
	callba_bank1 Func_5146
	callba_bank1 Func_8d59
	call Func_4763
	call Func_6ef3
	callba_bank1 Func_6c085
	ret

Func_413e: ; 413e (1:413e)
	push bc
	push de
	push hl
	ld a, [hFFB8]
	push af
	call WaitVBlank
	call ReadJoypad
	call Func_038c
	call Func_0e31
	pop af
	inc a
.asm_4152
	push af
	callba_bank1 Func_69b08
	ld a, [hFFEB]
	and a
	call nz, Func_13eb
	ld hl, wc877
	ld a, [hl]
	add $1
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	pop af
	dec a
	jr nz, .asm_4152
	pop hl
	pop de
	pop bc
	ret

Data_4174: ; 4174
	dr $4174, $427a

Func_427a: ; 427a (1:427a)
	ld a, [wcea1]
	cp $3
	ret z
	xor a
	ld [wc87e], a
	ld hl, wc87c
	ld a, [hli]
	or [hl]
	jr z, .asm_42ba
	ld hl, wccb3
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld hl, wc87c
	ld a, [hli]
	sub $1
	ld c, a
	ld a, [hl]
	sbc $0
	ld b, a
	jr c, .asm_42ba
	ld a, b
	ld [hld], a
	ld [hl], c
	ret

.asm_42ba
	ld hl, wBlocksOnScreen
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	ret nz
	ld a, [wc8a6]
	ld b, a
	ld a, [wcd6e]
	ld c, a
	ld a, [wcadf]
	ld hl, wc89d
	or [hl]
	or b
	or c
	ret nz
	ld a, [wc87b]
	and a
	jr z, .asm_42f3
	ld b, $ff
	ld a, [wceba]
	and a
	jr z, .asm_42ea
	ld b, $67
.asm_42ea
	ld hl, w6_d0b0
	call Func_73cc
	ret nz
	jr .asm_42fe

.asm_42f3
	call Func_7313
	ret nz
	call Func_6777
	ld c, l
	ld b, h
	jr .asm_430c

.asm_42fe
	ld a, [wc8e6]
	cp $ff
	jr z, .asm_4309
	cp $20
	jr c, .asm_430c
.asm_4309
	ld bc, $1000
.asm_430c
	xor a
	ld [wc880], a
	ld hl, wcad0
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hld], a
	ret nc
	ld d, $0
.asm_431c
	inc d
	ld a, $0
	add [hl]
	ld [hli], a
	ld a, $10
	adc [hl]
	ld [hld], a
	and $80
	jr nz, .asm_431c
	ld hl, wc869
	ld a, [hl]
	ld [hFF8A], a
	add d
	ld [hl], a
	ld [hFFAD], a
	ld bc, Func_0180
	ld hl, wGameCursorPosition
	ld a, [hl]
	and $f8
	jr nz, .asm_4357
	ld a, [hFF8A]
	and a
	jr nz, .asm_4357
	ld hl, hFFAD
	cp [hl]
	jr nz, .asm_434b
	jr .asm_4357

.asm_434b
	ld hl, wGameCursorPosition
	ld a, [hl]
	add b
	ld [hl], a
	ld hl, wc866
	ld a, [hl]
	add c
	ld [hl], a
.asm_4357
	ld hl, wc8e2
	ld a, [hl]
	add $10
	ld [hli], a
	ld a, [hl]
	adc $0
	jr c, .asm_4364
	ld [hl], a
.asm_4364
	ld hl, wcade
	ld a, [hl]
	add d
	ld [hl], a
	cp $10
	ret c
	ld hl, wc869
	ld a, [hl]
	and $f0
	sub $10
	ld [hl], a
	ld [hFFAD], a
	callba_bank1 Func_6e509
	call Func_5475
	ld a, [wc87b]
	and a
	jr z, .asm_438f
	ld bc, $1
	call Func_68f6
.asm_438f
	ld bc, Func_0180
	ld hl, wGameCursorPosition
	ld a, [hl]
	sub b
	ld [hl], a
	ld hl, wcad4
	ld a, [hl]
	sub b
	ld [hli], a
	ld a, [hl]
	sub b
	ld [hl], a
	ld hl, wc866
	ld a, [hl]
	sub c
	ld [hl], a
	ld hl, wcad9
	ld a, [hl]
	sub c
	ld [hl], a
	xor a
	ld [wcade], a
	ld [wc87b], a
	inc a
	ld [wc87e], a
	ld [wc880], a
	ld [wc892], a
	ld a, $3
	ld [wc89d], a
	ret

Func_43c4: ; 43c4 (1:43c4)
	ld a, [wcea1]
	cp $3
	jr nz, .asm_43dd
	ld hl, wc8da
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	call Func_6df0
	push bc
	push de
	call Func_20d4
	pop de
	pop bc
.asm_43dd
	ld a, $1
	ret

Func_43e0: ; 43e0 (1:43e0)
	ld a, [hJoyNew]
	and START
	jp z, Func_4401
	call Func_1d25
	jr z, .asm_43fc
	cp $e
	jr z, .asm_43fc
	ld a, $1
	ld [wc887], a
	ld a, $0
	ld [wc898], a
	jr Func_4401

.asm_43fc
	ld a, $1
	ld [wcd72], a
Func_4401: ; 4401 (1:4401)
	ld a, [wGameCursorPosition]
	ld b, a
	ld a, [wc865]
	ld d, a
	ld a, [wc866]
	ld e, a
	xor a
	ld [hFF8A], a
	ld a, [wcea1]
	cp $e
	jp z, .CheckDPad
	cp $3
	jr z, .asm_447d
	ld hl, wc89d
	ld a, [hl]
	and a
	jr z, .asm_4427
	dec [hl]
	jp .CheckDPad

.asm_4427
	ld a, [hJoyPressed]
	and B_BUTTON
	jp z, .CheckDPad
	ld hl, wc87c
	xor a
	ld [hli], a
	ld [hl], a
	ld a, [wceba]
	and a
	jr z, .asm_444c
	ld a, [wcadf]
	and a
	jr z, .asm_444c
	xor a
	ld [wcadf], a
	ld [wcae0], a
	ld a, [wc869]
	ld [hFFAD], a
.asm_444c
	ld hl, wc87b
	ld a, [wc8a6]
	ld c, a
	ld a, [wcadf]
	or [hl]
	or c
	jr nz, .CheckDPad
	ld hl, wBlocksOnScreen
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr nz, .CheckDPad
	ld a, [wceba]
	and a
	jr nz, .asm_4475
	call Func_7313
	and a
	jr nz, .CheckDPad
.asm_4475
	ld a, $1
	ld [wc87b], a
	jp Func_46b9

.asm_447d
	ld a, [hJoyNew]
	and B_BUTTON
	jp z, .CheckDPad
	ld hl, wc8dc
	ld a, [wc8da]
	cp [hl]
	jr z, .CheckDPad
	ld a, [wc7ce]
	and a
	jr nz, .asm_4498
	ld a, $4
	ld [wc7cb], a
.asm_4498
	ld a, $4
	ld [wc887], a
	jp Func_46b9

.CheckDPad: ; 44a0 (1:44a0)
	ld a, [hJoyPressed]
	and D_LEFT
	jr z, .asm_44de
	ld a, b
	dec a
	and $7
	cp $7
	jr z, .asm_44de
	ld hl, wc881
	ld a, [hl]
	and $c0
	cp $0
	jr z, .asm_44bb
	ld a, $0
	ld [hl], a
.asm_44bb
	ld a, [hl]
	inc a
	ld [hl], a
	and $3f
	cp $1
	jr z, .asm_44cb
	ld hl, wc882
	cp [hl]
	jp c, Func_45d0
.asm_44cb
	dec b
	ld a, d
	add $f0
	ld d, a
	ld a, [hl]
	and $3f
	cp $c
	jr nc, .asm_44db
	ld hl, hFF8A
	inc [hl]
.asm_44db
	jp Func_45d0

.asm_44de
	ld a, [hJoyPressed]
	and D_RIGHT
	jr z, .asm_451f
	ld a, b
	inc a
	and $7
	cp $5
	jr z, .asm_451f
	ld hl, wc881
	ld a, [hl]
	and $c0
	cp $40
	jr z, .asm_44f9
	ld a, $40
	ld [hl], a
.asm_44f9
	ld a, [hl]
	inc a
	ld [hl], a
	and $3f
	cp $1
	jr z, .asm_4509
	ld hl, wc882
	cp [hl]
	jp c, Func_45d0
.asm_4509
	inc b
	ld a, d
	add $10
	ld d, a
	ld hl, wc881
	ld a, [hl]
	and $3f
	cp $c
	jr nc, .asm_451c
	ld hl, hFF8A
	inc [hl]
.asm_451c
	jp Func_45d0

.asm_451f
	ld a, [hJoyPressed]
	and D_UP
	jr z, .asm_457a
	ld a, [wcea1]
	cp $e
	jr z, .asm_453f
	cp $3
	jr z, .asm_453f
	ld a, [wc869]
	and a
	jr z, .asm_453f
	ld a, b
	and $f8
	cp $8
	jr z, .asm_457a
	jr .asm_4544

.asm_453f
	ld a, b
	and $f8
	jr z, .asm_457a
.asm_4544
	ld hl, wc881
	ld a, [hl]
	and $c0
	cp $80
	jr z, .asm_4551
	ld a, $80
	ld [hl], a
.asm_4551
	ld a, [hl]
	inc a
	ld [hl], a
	and $3f
	cp $1
	jr z, .asm_4561
	ld hl, wc882
	cp [hl]
	jp c, Func_45d0
.asm_4561
	ld a, b
	sub $8
	ld b, a
	ld a, e
	add $f0
	ld e, a
	ld hl, wc881
	ld a, [hl]
	and $3f
	cp $c
	jr nc, .asm_4577
	ld hl, hFF8A
	inc [hl]
.asm_4577
	jp Func_45d0

.asm_457a
	ld a, [hJoyPressed]
	and D_DOWN
	jr z, .asm_45c1
	ld a, b
	add $8
	cp $48
	jr nc, .asm_45c1
	ld hl, wc881
	ld a, [hl]
	and $c0
	cp $c0
	jr z, .asm_4594
	ld a, $c0
	ld [hl], a
.asm_4594
	ld a, [hl]
	inc a
	ld [hl], a
	and $3f
	cp $1
	jr z, .asm_45a4
	ld hl, wc882
	cp [hl]
	jp c, Func_45d0
.asm_45a4
	ld a, b
	add $8
	cp $48
	jr nc, .asm_45c1
	ld b, a
	ld a, e
	add $10
	ld e, a
	ld hl, wc881
	ld a, [hl]
	and $3f
	cp $c
	jr nc, .asm_45be
	ld hl, hFF8A
	inc [hl]
.asm_45be
	jp Func_45d0

.asm_45c1
	ld a, $0
	ld [wc881], a
	ld a, $b
	ld [wc882], a
	ld a, [wc8da]
	and a
	ret z
Func_45d0: ; 45d0 (1:45d0)
	ld a, [hFF8A]
	and a
	jr z, .asm_45e0
	ld a, [wc7ce]
	and a
	jr nz, .asm_45e0
	ld a, $2
	ld [wc7cb], a
.asm_45e0
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_4644
	ld a, [wcad2]
	and a
	jp nz, Func_4644
	ld a, [wc881]
	and $3f
	cp $b
	jr c, .asm_4611
	ld a, [wGameCursorPosition]
	ld b, a
	ld a, [wc865]
	ld d, a
	ld a, [wc866]
	ld e, a
	ld hl, wc881
	ld a, [hl]
	and $c0
	or $1
	ld [hl], a
	ld a, $c
	ld [wc882], a
.asm_4611
	ld a, b
	call Func_55fb
	jr c, Func_4644
	ld a, [wcea1]
	cp $3
	jr z, .asm_4624
	cp $e
	jr z, .asm_462c
	jr .asm_4631

.asm_4624
	call Func_43c4
	and a
	jr z, Func_4644
	jr .asm_4631

.asm_462c
	ld a, $2
	ld [wc8da], a
.asm_4631
	ld a, [wc7ce]
	and a
	jr nz, .asm_463c
	ld a, $c3
	ld [wc7cb], a
.asm_463c
	ld a, $1
	ld [wcad2], a
	jp Func_46b9

Func_4644: ; 4644 (1:4644)
	ld a, [hJoyNew]
	and SELECT
	jp z, Func_46b9
	ld a, [wcea1]
	cp $3
	jr nz, Func_46b9
	ld a, [wc838]
	ld [wcdc3], a
	call Func_1f38
	ld a, [hl]
	ld [wcdc4], a
	ld a, [wcead]
	ld [wcdc5], a
	push bc
	push de
	call Func_2626
	pop de
	pop bc
	ld a, [wcdc6]
	and a
	jr nz, .asm_4685
	ld a, [wcdc7]
	and a
	jr nz, .asm_4685
	ld a, [wc7ce]
	and a
	jr nz, .asm_4683
	ld a, $28
	ld [wc7cd], a
.asm_4683
	jr Func_46b9

.asm_4685
	ld a, [wc838]
	ld [wcdc3], a
	call Func_1f38
	ld a, [hl]
	ld [wcdc4], a
	ld a, [wcead]
	ld [wcdc5], a
	push bc
	push de
	farcall Func_6a2f4
	call Func_208e
	pop de
	pop bc
	farcall Func_68a0f
	farcall Func_68b3d
	ld a, $3
	ld [wc887], a
	jp Func_46b9

Func_46b9: ; 46b9 (1:46b9)
	ld a, b
	ld [wGameCursorPosition], a
	ld a, d
	ld [wc865], a
	ld a, e
	ld [wc866], a
	ret

Func_46c6: ; 46c6 (1:46c6)
	ld a, [wc8da]
	and a
	jr z, .asm_46f3
	ld a, [hFFAD]
	ld b, a
	ld a, [wc866]
	sub b
	ld c, a
	ld a, [hFFAC]
	ld b, a
	ld a, [wc865]
	sub b
	ld b, a
	ld hl, wc867
	ld a, [hl]
	inc [hl]
	and $10
	jr nz, .asm_46ec
	ld hl, Data_4731
	call Func_02f8
	ret

.asm_46ec
	ld hl, Data_474a
	call Func_02f8
	ret

.asm_46f3
	ld a, [hFFAD]
	ld b, a
	ld a, [wc866]
	sub b
	ld c, a
	ld a, [hFFAC]
	ld b, a
	ld a, [wc865]
	sub b
	ld b, a
	ld hl, wc867
	inc [hl]
	ld a, [hl]
	and $2
	ret nz
	ld hl, Data_4731
	call Func_02f8
	ret

Func_4712: ; 4712
	ld a, [hFFAD]
	ld b, a
	ld a, [wc866]
	sub b
	ld c, a
	ld a, [hFFAC]
	ld b, a
	ld a, [wc865]
	sub b
	ld b, a
	ld hl, wc867
	inc [hl]
	ld a, [hl]
	and $1
	ret nz
	ld hl, Data_4731
	call Func_02f8
	ret

Data_4731: ; 4731
	db  6
	db -3, -3, $00, $00
	db  9, -3, $00, $40
	db  9, 25, $00, $60
	db -3, 25, $00, $20
	db -3, 11, $01, $00
	db  9, 11, $01, $40

Data_474a: ; 474a
	db  6
	db -4, -4, $00, $00
	db 10, -4, $00, $40
	db 10, 26, $00, $60
	db -4, 26, $00, $20
	db -4, 11, $01, $00
	db 10, 11, $01, $40

Func_4763: ; 4763 (1:4763)
	ld hl, w6_d0b0
	ld de, w6_d0b8
	ld b, $c0
	ld c, $3f
REPT 8
REPT 6
	ld a, [hl]
	and b
	jr z, .next_\@
	ld a, [hl]
	and c
	jr nz, .next_\@
	ld a, [de]
	and $5
	jr nz, .next_\@
	ld a, [hl]
	and c
	ld [hl], a
.next_\@
	inc l
	inc e
ENDR
	inc l
	inc l
	inc e
	inc e
ENDR
REPT 6
	ld a, [hl]
	and b
	jr z, .next_\@
	ld a, [hl]
	and c
	jr nz, .next_\@
	ld a, [hl]
	and c
	ld [hl], a
.next_\@
	inc l
	inc e
ENDR
	ld hl, w6_d0b0
	ld e, $c5
REPT 9
REPT 6
	ld a, [hli]
	and e
	jp nz, .asm_4c62
ENDR
	inc l
	inc l
ENDR
	jr .asm_4c6d

.asm_4c62
	ld a, [wc88a]
	and a
	ret z
	ld a, $1
	ld [wc8d4], a
	ret

.asm_4c6d
	ld a, [wc88a]
	and a
	jr z, .asm_4ca2
	ld b, a
	call Func_4cb3
	call Func_6969
	call Func_1d25
	jr z, .asm_4c94
	ld de, $a8
	ld bc, $1020
	ld a, $ff
	ld [wcae8], a
	callba_bank1 Func_8ce2
	jr .asm_4ca2

.asm_4c94
	ld a, $ff
	ld [hFF8A], a
	ld [hFF8B], a
	callba_bank1 Func_1f12
.asm_4ca2
	ld a, [wc88a]
	and a
	jr z, .asm_4cab
	nop
	nop
	nop
.asm_4cab
	xor a
	ld [wc8d4], a
	ld [wc88a], a
	ret

Func_4cb3: ; 4cb3 (1:4cb3)
	ld a, b
	cp $5
	jr nc, .asm_4ce5
	cp $4
	jr z, .asm_4cd3
	cp $3
	jr z, .asm_4cc1
	ret

.asm_4cc1
	ld a, [wcea1]
	cp $3
	ret z
	ld a, [wc7ce]
	and a
	jr nz, .asm_4cd2
	ld a, $a
	ld [wc7cd], a
.asm_4cd2
	ret

.asm_4cd3
	ld a, [wcea1]
	cp $3
	ret z
	ld a, [wc7ce]
	and a
	jr nz, .asm_4ce4
	ld a, $b
	ld [wc7cd], a
.asm_4ce4
	ret

.asm_4ce5
	ld a, [wcea1]
	cp $3
	ret z
	ld a, [wc7ce]
	and a
	jr nz, .asm_4cf6
	ld a, $c
	ld [wc7cd], a
.asm_4cf6
	ret

Func_4cf7: ; 4cf7 (1:4cf7)
	ld a, [wcad2]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_4d07
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_4d06: ; 4d06
	ret

Pointers_4d07: ; 4d07
	dw Func_4d06
	dw Func_4d0f
	dw Func_4dba
	dw Func_4dfe

Func_4d0f: ; 4d0f (1:4d0f)
	ld a, [wc865]
	dec a
	ld [wcad8], a
	ld a, [wc866]
	ld [wcad9], a
	ld a, [wGameCursorPosition]
	ld [wcad4], a
	ld c, a
	ld b, $0
	inc a
	ld [wcad5], a
	ld hl, wBlocksOnScreen
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4d4b
	ld hl, w6_d0b0
	add hl, bc
	ld a, [hl]
	or $1
	and $fb
	ld [hl], a
	ld hl, wBlocksOnScreen + 1 * 8 + 1
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4d4b
	ld hl, w6_d0b0
	add hl, bc
	ld a, [hl]
	or $4
	ld [hl], a
.asm_4d4b
	ld hl, wBlocksOnScreen + 1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4d6d
	ld hl, w6_d0b1
	add hl, bc
	ld a, [hl]
	or $1
	and $fb
	ld [hl], a
	ld hl, wBlocksOnScreen + 1 * 8
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4d6d
	ld hl, w6_d0b1
	add hl, bc
	ld a, [hl]
	or $4
	ld [hl], a
.asm_4d6d
	ld hl, wBlocksOnScreen
	add hl, bc
	ld a, [hli]
	ld [wcad6], a
	ld a, [hl]
	ld [wcad7], a
	ld a, [wcad4]
	call Func_5446
	ld hl, wcadb
	xor a
	ld [hli], a
	ld [hl], a
	call Func_4d98
	ld hl, wcadb
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hli], a
	ld a, $2
	ld [wcad2], a
	jr asm_4dc9

Func_4d98: ; 4d98 (1:4d98)
	ld a, [wcea5]
	cp $5
	jr z, .asm_4da2
	xor a
	jr .asm_4da6

.asm_4da2
	ld a, [wceb4]
	inc a
.asm_4da6
	add a
	ld c, a
	ld b, $0
	ld hl, Data_4db2
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

Data_4db2: ; 4db2
	dw $0400
	dw $0156
	dw $0100
	dw $0200

Func_4dba: ; 4dba
	ld a, [wGameCursorPosition]
	call Func_55fb
	jr c, asm_4dc9
	ld a, [hJoyNew]
	and A_BUTTON
	jp nz, Func_4e15
asm_4dc9
	ld a, [wcadc]
	ld b, a
	ld a, $10
	sub b
	ld c, a
	ld a, [wcad8]
	add c
	ld e, a
	ld a, [wcad7]
	push bc
	call Func_4e8b
	pop bc
	ld a, [wcad8]
	add b
	ld e, a
	ld a, [wcad6]
	call Func_4e8b
	call Func_4d98
	ld hl, wcadb
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hli], a
	cp $10
	ret c
	ld a, $3
	ld [wcad2], a
	ret

Func_4dfe: ; 4dfe
	ld a, [hJoyNew]
	and A_BUTTON
	jp nz, Func_4e15
	call Func_4e33
	xor a
	ld [wcad2], a
	ld a, $ff
	ld [wcad4], a
	ld [wcad5], a
	ret

Func_4e15: ; 4e15 (1:4e15)
	call Func_43c4
	and a
	ret z
	call Func_4e33
	ld a, [wGameCursorPosition]
	call Func_55fb
	jp nc, Func_4d0f
	xor a
	ld [wcad2], a
	ld a, $ff
	ld [wcad4], a
	ld [wcad5], a
	ret

Func_4e33: ; 4e33 (1:4e33)
	ld hl, w6_d0b0
	ld a, [wcad4]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	and $fe
	ld [hli], a
	ld a, [hl]
	and $fe
	ld [hld], a
	call Func_4e56
	inc bc
	call Func_4e56
	xor a
	ld [wcada], a
	ld a, $1
	ld [wc892], a
	ret

Func_4e56: ; 4e56 (1:4e56)
	ld hl, wBlocksOnScreen
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4e64
	push bc
	call Func_5651
	pop bc
	ret

.asm_4e64
	ld hl, wBlocksOnScreen + 1 * 8
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4e7a
	ld hl, w6_d0b8
	add hl, bc
	ld a, [hl]
	and $4
	jr nz, .asm_4e7a
	ld a, [hl]
	and $fb
	ld [hl], a
	ret

.asm_4e7a
	ld hl, w6_d0b0
	add hl, bc
	ld a, [hl]
	or $4
	ld [hl], a
	ld hl, w6_d100
	add hl, bc
	ld a, [wca1d]
	ld [hl], a
	ret

Func_4e8b: ; 4e8b (1:4e8b)
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_4ea8
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hFFAD]
	ld b, a
	ld a, [wcad9]
	sub b
	ld c, a
	ld a, [hFFAC]
	ld b, a
	ld a, e
	sub b
	ld b, a
	call Func_02f8
	ret

Pointers_4ea8: ; 4ea8
	dw Data_4eba
	dw Data_4ebb
	dw Data_4ecc
	dw Data_4edd
	dw Data_4eee
	dw Data_4eff
	dw Data_4f10
	dw Data_4f21
	dw Data_4f32

Data_4eba: ; 4eba
	db  0

Data_4ebb: ; heart
	db  4
	db  0,  0, $60, $03
	db  8,  0, $70, $03
	db  0,  8, $61, $03
	db  8,  8, $71, $03

Data_4ecc: ; circle
	db  4
	db  0,  0, $62, $05
	db  8,  0, $72, $05
	db  0,  8, $63, $05
	db  8,  8, $73, $05

Data_4edd: ; triangle
	db  4
	db  0,  0, $64, $04
	db  8,  0, $74, $04
	db  0,  8, $65, $04
	db  8,  8, $75, $04

Data_4eee: ; star
	db  4
	db  0,  0, $66, $05
	db  8,  0, $76, $05
	db  0,  8, $67, $05
	db  8,  8, $77, $05

Data_4eff: ; diamond
	db  4
	db  0,  0, $68, $03
	db  8,  0, $78, $03
	db  0,  8, $69, $03
	db  8,  8, $79, $03

Data_4f10: ; upside down triangle
	db  4
	db  0,  0, $6a, $04
	db  8,  0, $7a, $04
	db  0,  8, $6b, $04
	db  8,  8, $7b, $04

Data_4f21: ; shock
	db  4
	db  0,  0, $6c, $00
	db  8,  0, $7c, $00
	db  0,  8, $6d, $00
	db  8,  8, $7d, $00

Data_4f32: ; shock2
	db  4
	db  0,  0, $6c, $06
	db  8,  0, $7c, $06
	db  0,  8, $6d, $06
	db  8,  8, $7d, $06

Func_4f43: ; 4f43 (1:4f43)
	xor a
	ld [wc889], a
	ld [wc88b], a
	ld [wc8d6], a
	ld a, [wc892]
	and a
	ret z
	xor a
	ld [wc892], a
	ld [hFF8A], a
	callba_bank1 Func_70034
	callba_bank1 Func_74d05
	callba_bank1 Func_75a5d
	ld a, c
	and a
	ret z
	ld a, [hFF8A]
	ld [hFF8D], a
	ld a, b
	and $7
	swap a
	add $8
	ld [hFF8E], a
	ld a, b
	and $f8
	add a
	add $12
	ld [hFF8F], a
	ld a, [wc889]
	sub $3
	jr c, .asm_4f99
	ld a, [wc88a]
	ld c, a
	call Func_683b
	call Func_68f6
.asm_4f99
	ld a, [wc889]
	sub $4
	jp c, Func_5030
	cp $33
	jr c, .asm_4fa7
	ld a, $33
.asm_4fa7
	ld [wcae8], a
	call Func_5123
	ld a, [wcae8]
	add a
	ld e, a
	ld d, $0
	ld hl, $0
	add hl, de
	ld e, l
	ld d, h
	call Func_5118
	callba_bank1 Func_8ce2
	ld a, $1
	ld [wc8d6], a
	ld a, [wcebd]
	and a
	jr nz, .asm_5011
	ld a, [wc883]
	and a
	jr z, .asm_5011
	ld de, $a6
	ld a, b
	add $10
	ld b, a
	xor a
	ld [wcae8], a
	callba_bank1 Func_8ce2
	call Func_1d25
	jr z, .asm_5011
	call Func_1d31
	jr z, .asm_5011
	ld a, [wceb8]
	and a
	jr nz, .asm_5006
	ld a, [wc7ce]
	and a
	jr nz, .asm_5004
	ld a, $26
	ld [wc7cd], a
.asm_5004
	jr .asm_5011

.asm_5006
	ld a, [wc7ce]
	and a
	jr nz, .asm_5011
	ld a, $3d
	ld [wc7cb], a
.asm_5011
	ld a, [wc889]
	ld c, a
	call Func_693c
	call Func_67b8
	call Func_68f6
	ld a, [wcebd]
	and a
	jr nz, Func_5030
	ld a, [wcea1]
	cp $3
	jr z, Func_5030
	call Func_688c
	jr c, Func_5030
Func_5030: ; 5030 (1:5030)
	ld a, [hFF8D]
	and a
	jp z, Func_50e0
	ld a, [wceb3]
	and a
	jr nz, .asm_5050
	ld a, [wceb7]
	and a
	jr nz, .asm_5046
	ld e, $a
	jr .asm_5048

.asm_5046
	ld e, $10
.asm_5048
	ld a, [wc88a]
	cp e
	jr nc, .asm_5059
	jr .asm_505e

.asm_5050
	ld a, [wc88a]
	cp $1e
	jr nc, .asm_5059
	jr .asm_505e

.asm_5059
	ld de, $a2
	jr .asm_5068

.asm_505e
	add a
	ld e, a
	ld d, $0
	ld hl, $68
	add hl, de
	ld e, l
	ld d, h
.asm_5068
	ld a, [wc88a]
	cp $1e
	jr c, .asm_5071
	ld a, $1d
.asm_5071
	or $80
	ld [wcae8], a
	call Func_5123
	call Func_5118
	callba_bank1 Func_8ce2
	ld a, $1
	ld [wc8d6], a
	ld a, [wcebd]
	and a
	jr nz, .asm_50d0
	ld a, [wc883]
	and a
	jr z, .asm_50d0
	ld de, $a6
	ld a, b
	add $10
	ld b, a
	xor a
	ld [wcae8], a
	callba_bank1 Func_8ce2
	call Func_1d25
	jr z, .asm_50d0
	call Func_1d31
	jr z, .asm_50d0
	ld a, [wceb8]
	and a
	jr nz, .asm_50c5
	ld a, [wc7ce]
	and a
	jr nz, .asm_50c3
	ld a, $26
	ld [wc7cd], a
.asm_50c3
	jr .asm_50d0

.asm_50c5
	ld a, [wc7ce]
	and a
	jr nz, .asm_50d0
	ld a, $3d
	ld [wc7cb], a
.asm_50d0
	ld a, [wcebd]
	and a
	jr nz, Func_50e0
	ld a, [wcea1]
	cp $3
	jr z, Func_50e0
	call Func_68c1
Func_50e0: ; 50e0 (1:50e0)
	ld a, [wc88b]
	and a
	jr z, .asm_5109
	or $40
	ld [wcae8], a
	call Func_5123
	call Func_5118
	ld de, $a4
	callba_bank1 Func_8ce2
	callba_bank1 Func_42417
	ld a, $1
	ld [wc8d6], a
.asm_5109
	ld a, [wc8d6]
	and a
	jr z, .asm_5117
	callba_bank1 Func_42417
.asm_5117
	ret

Func_5118: ; 5118 (1:5118)
	ld a, [hFF8E]
	ld b, a
	ld a, [hFF8F]
	ld c, a
	add $f0
	ld [hFF8F], a
	ret

Func_5123: ; 5123 (1:5123)
	ld [hFF8A], a
	call Func_1d25
	ret nz
	ld a, [hFF8A]
	and $c0
	jr nz, .asm_5135
	ld a, [hFF8A]
	add $4
	ld [hFF8A], a
.asm_5135
	ld a, [wc894]
	add a
	add a
	add a
	ld [hFF8B], a
	callba_bank1 Func_1f12
	ret

Func_5146: ; 5146 (1:5146)
	ld bc, $0
.asm_5149
	push bc
	ld hl, wccfb
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, w6_d200
	add hl, de
	ld e, l
	ld d, h
	call Func_5162
	pop bc
	inc c
	ld a, c
	cp $c
	jr c, .asm_5149
	ret

Func_5162: ; 5162 (1:5162)
	ld hl, wccb3
	add hl, bc
	ld a, [hl]
	and a
	jp z, Func_522f
	dec a
	jp z, Func_517e
	dec a
	jp z, Func_518a
	dec a
	jp z, Func_51a7
	dec a
	jp z, Func_51be
	jp Func_5201

Func_517e: ; 517e (1:517e)
	ld l, e
	ld h, d
	call Func_5230
	ld hl, wccb3
	add hl, bc
	ld a, $2
	ld [hl], a
Func_518a: ; 518a (1:518a)
	ld hl, wcce3
	add hl, bc
	inc [hl]
	ld a, [wca1a]
	cp [hl]
	jp nc, Func_522f
	xor a
	ld [hl], a
	ld hl, wccb3
	add hl, bc
	ld a, $3
	ld [hl], a
	ld l, e
	ld h, d
	call Func_5250
	jp Func_522f

Func_51a7: ; 51a7 (1:51a7)
	ld hl, wcce3
	add hl, bc
	inc [hl]
	ld a, [wca1b]
	cp [hl]
	jp nc, Func_522f
	xor a
	ld [hl], a
	ld hl, wccb3
	add hl, bc
	ld [hl], $4
	jp Func_522f

Func_51be: ; 51be (1:51be)
	ld hl, wcce3
	add hl, bc
	inc [hl]
	ld a, [wca1c]
	cp [hl]
	jp nc, Func_522f
	xor a
	ld [hl], a
	call Func_526a
	ld hl, wccd7
	add hl, bc
	ld a, [hl]
	call Func_53da
	ld hl, wccbf
	add hl, bc
	ld a, [hl]
	ld hl, wccd7
	add hl, bc
	inc [hl]
	cp [hl]
	jp nz, Func_522f
	ld a, [hl]
	ld hl, wcccb
	add hl, bc
	cp [hl]
	jr nz, .asm_51f5
	push bc
	call Func_5304
	pop bc
	jp Func_5228

.asm_51f5
	ld hl, wccb3
	add hl, bc
	ld [hl], $5
	call Func_5304
	jp Func_522f

Func_5201: ; 5201 (1:5201)
	ld hl, wcce3
	add hl, bc
	inc [hl]
	ld a, [wca1c]
	cp [hl]
	jp nc, Func_522f
	xor a
	ld [hl], a
	call Func_5293
	call Func_53da
	ld hl, wcccb
	add hl, bc
	ld a, [hl]
	ld hl, wccd7
	add hl, bc
	inc [hl]
	cp [hl]
	jp nz, Func_522f
	push bc
	call Func_5336
	pop bc
Func_5228: ; 5228 (1:5228)
	ld hl, wccb3
	add hl, bc
	ld [hl], $0
	ret

Func_522f: ; 522f (1:522f)
	ret

Func_5230: ; 5230 (1:5230)
	push bc
.asm_5231
	ld a, [hl]
	cp $ff
	jr z, .asm_524e
	inc l
	push hl
	ld c, a
	ld b, $0
	ld hl, w6_d058
	add hl, bc
	ld a, [hl]
	and $3
	or $10
	ld [hl], a
	ld hl, w6_d150
	add hl, bc
	xor a
	ld [hl], a
	pop hl
	jr .asm_5231

.asm_524e
	pop bc
	ret

Func_5250: ; 5250 (1:5250)
	push bc
.asm_5251
	ld a, [hl]
	cp $ff
	jr z, .asm_5268
	inc l
	push hl
	ld c, a
	ld b, $0
	ld hl, w6_d058
	add hl, bc
	ld a, [hl]
	and $ef
	or $4
	ld [hl], a
	pop hl
	jr .asm_5251

.asm_5268
	pop bc
	ret

Func_526a: ; 526a (1:526a)
	push bc
	push de
	ld hl, wccd7
	add hl, bc
	ld a, [hl]
	add e
	ld e, a
	ld a, [de]
	ld e, a
	ld d, $0
	ld hl, w6_d0b0
	add hl, de
	ld a, [hl]
	or $10
	ld [hl], a
	ld hl, w6_d058
	add hl, de
	ld a, [hl]
	and $fb
	ld [hl], a
	ld bc, $a
	call Func_68f6
	call Func_6995
	pop de
	pop bc
	ret

Func_5293: ; 5293 (1:5293)
	push bc
	push de
	ld hl, wccd7
	add hl, bc
	ld a, [hl]
	add e
	ld e, a
	ld a, [de]
	ld e, a
	ld d, $0
	call Func_5387
	ld hl, w6_d0b0
	add hl, de
	ld a, [hl]
	or $10
	ld [hl], a
	ld hl, w6_d058
	add hl, de
	ld a, [hl]
	and $fb
	ld [hl], a
	ld hl, w6_d1a0
	add hl, de
	ld a, [hl]
	and $f
	dec a
	jr z, .asm_52e0
	ld a, [hl]
	sub $11
	ld [hl], a
	and $f0
	swap a
	add a
	ld b, a
	ld a, [hl]
	and $f
	dec a
	add a
	ld c, a
	add a
	add c
	ld c, a
	farcall Func_b6a7
	ld hl, wBlocksOnScreen
	add hl, de
	ld a, [hFF8A]
	ld [hl], a
	jp Func_5301

.asm_52e0
	xor a
	ld [hl], a
	ld hl, w6_d058
	add hl, de
	ld a, [hl]
	or $80
	ld [hl], a
	ld hl, wc8a7
	inc [hl]
	ld a, [hl]
	ld hl, wca20
	cp [hl]
	jr nz, .asm_52f9
	xor a
	ld [wc8a7], a
.asm_52f9
	call Func_558c
	ld hl, wBlocksOnScreen
	add hl, de
	ld [hl], a
Func_5301: ; 5301 (1:5301)
	pop de
	pop bc
	ret

Func_5304: ; 5304 (1:5304)
	ld hl, wccfb
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, w6_d200
	add hl, de
.asm_530f
	ld a, [hl]
	cp $ff
	jr z, .asm_5335
	inc l
	push hl
	ld e, a
	ld d, $0
	ld hl, w6_d058
	add hl, de
	ld a, [hl]
	and $3
	jr nz, .asm_5332
	xor a
	ld hl, wBlocksOnScreen
	add hl, de
	ld [hl], a
	ld hl, w6_d0b0
	add hl, de
	ld [hl], a
	ld c, e
	ld b, d
	call Func_567a
.asm_5332
	pop hl
	jr .asm_530f

.asm_5335
	ret

Func_5336: ; 5336 (1:5336)
	ld hl, wccfb
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, w6_d200
	add hl, de
.asm_5341
	ld a, [hl]
	cp $ff
	jr z, .asm_5386
	inc l
	push hl
	ld e, a
	ld d, $0
	ld hl, w6_d058
	add hl, de
	ld a, [hl]
	and $3
	jr z, .asm_5383
	ld a, [hl]
	and $80
	jr nz, .asm_5363
	ld hl, w6_d0b0
	add hl, de
	ld a, [hl]
	and $e7
	ld [hl], a
	jr .asm_5383

.asm_5363
	ld hl, w6_d0b0
	add hl, de
	ld a, [hl]
	and $e7
	or $64
	ld [hl], a
	ld hl, w6_d058
	add hl, de
	xor a
	or $40
	ld [hl], a
	ld hl, w6_d150
	add hl, de
	ld [hl], $0
	ld hl, w6_d100
	add hl, de
	ld a, [wca1f]
	ld [hl], a
.asm_5383
	pop hl
	jr .asm_5341

.asm_5386
	ret

Func_5387: ; 5387 (1:5387)
	push bc
	push de
	ld a, e
	and a
	jp nz, Func_53d7
	ld hl, w6_d1a0
	add hl, de
	ld a, [hl]
	ld [hFF8A], a
	ld a, [hl]
	and $f
	ld b, a
	ld a, [hl]
	and $f0
	swap a
	cp b
	jp z, Func_53d7
	ld a, [wc8fa]
	ld e, a
	ld d, $0
.asm_53a8
	ld hl, w6_d400
	add hl, de
	inc e
	ld a, [hl]
	sub $11
	ld [hl], a
	ld a, [hl]
	and $f
	ld b, a
	ld a, [hl]
	and $f0
	swap a
	cp b
	jr nz, .asm_53a8
	ld hl, hFF8A
	ld a, [hl]
	and $f0
	swap a
	dec a
	add a
	ld c, a
	ld a, [hl]
	and $f
	dec a
	add a
	ld b, a
	add a
	add b
	ld b, a
	farcall Func_b6c5
Func_53d7: ; 53d7 (1:53d7)
	pop de
	pop bc
	ret

Func_53da: ; 53da (1:53da)
	ld a, [wc89f]
	and a
	jr z, .asm_53e5
	xor a
	ld [wc89f], a
	ret

.asm_53e5
	push de
	ld hl, wccef
	add hl, bc
	ld a, [hl]
	cp $4
	jr c, .asm_53f1
	ld a, $3
.asm_53f1
	add a
	add a
	add a
	ld e, a
	ld d, $0
	ld hl, wccd7
	add hl, bc
	ld a, [hl]
	cp $8
	jr c, .asm_5402
	ld a, $7
.asm_5402
	add e
	ld e, a
	ld hl, Data_5426
	add hl, de
	ld d, [hl]
	ld a, [wc7ce]
	and a
	jr z, .asm_5411
	pop de
	ret

.asm_5411
	ld hl, wccef
	add hl, bc
	ld a, [hl]
	cp $2
	jr nc, .asm_5420
	ld a, d
	ld [wc7cb], a
	pop de
	ret

.asm_5420
	ld a, d
	ld [wc7cd], a
	pop de
	ret

Data_5426: ; 5426
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1a, $1b, $1c, $1d, $1f, $1e
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20

Func_5446: ; 5446 (1:5446)
	ld c, a
	ld b, $0
	ld hl, wBlocksOnScreen
	add hl, bc
	call Func_546e
	ld hl, w6_d058
	add hl, bc
	ld a, [hl]
	and $bf
	ld [hli], a
	ld a, [hl]
	and $bf
	ld [hld], a
	call Func_546e
	ld hl, w6_d0b0
	add hl, bc
	call Func_546e
	ld hl, w6_d150
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ret

Func_546e: ; 546e (1:546e)
	ld a, [hli]
	ld d, a
	ld a, [hld]
	ld [hli], a
	ld a, d
	ld [hld], a
	ret

Func_5475: ; 5475 (1:5475)
	ld hl, w6_d048
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wc8a9
	ld a, [hl]
	and a
	jr z, .asm_54d2
	ld hl, wc8a8
	ld a, [wca22]
	dec a
	cp [hl]
	jr c, .asm_54d2
	call Random_1in6
	call Func_555b
	jr c, .asm_54d2
	ld hl, wc8a9
	dec [hl]
	ld hl, wc8a8
	inc [hl]
	ld hl, w6_d048
	add hl, bc
	ld [hl], $7
	ld hl, wc8a9
	ld a, [hl]
	and a
	jr z, .asm_54d2
	ld hl, wc8a8
	ld a, [wca22]
	dec a
	cp [hl]
	jr c, .asm_54d2
	ld a, [hl]
	cp $5
	jr nc, .asm_54d2
	call Random_1in6
	call Func_555b
	jr c, .asm_54d2
	ld hl, wc8a9
	dec [hl]
	ld hl, wc8a8
	inc [hl]
	ld hl, w6_d048
	add hl, bc
	ld [hl], $7
.asm_54d2
	ld bc, $0
	ld de, hFFF8
	call Random_1in5
	inc a
	ld [hFF8A], a
Func_54de: ; 54de (1:54de)
	ld hl, w6_d048
	add hl, bc
	ld a, [hl]
	cp $7
	jp z, Func_5545
	ld a, [wca18]
	cp $6
	jr z, .asm_54f4
	call Random_1in5
	jr .asm_54f7

.asm_54f4
	call Random_1in6
.asm_54f7
	inc a
	ld [hFF8B], a
	ld a, [hFF8A]
	cp c
	jr nz, .asm_5525
	ld a, [wca19]
	dec a
	jr z, .asm_551c
	dec a
	jr z, .asm_5525
.asm_5508
	ld hl, w6_d048
	add hl, bc
	dec hl
	ld a, [hl]
	cp $7
	jr z, .asm_5525
	ld hl, w6_d048
	add hl, de
	cp [hl]
	jr z, .asm_5525
	jp Func_5545

.asm_551c
	ld hl, wc87f
	ld a, [hl]
	inc [hl]
	and $1
	jr nz, .asm_5508
.asm_5525
	ld a, [hFF8B]
.asm_5527
	ld hl, w6_d048
	add hl, bc
	dec hl
	cp [hl]
	jr z, .asm_5538
	ld hl, w6_d048
	add hl, de
	cp [hl]
	jr z, .asm_5538
	jr Func_5545

.asm_5538
	inc a
	ld hl, wca18
	cp [hl]
	jr c, .asm_5527
	jr z, .asm_5527
	ld a, $1
	jr .asm_5527

Func_5545: ; 5545 (1:5545)
	ld hl, w6_d048
	add hl, bc
	ld [hl], a
	inc e
	inc c
	ld a, c
	cp $6
	jp nz, Func_54de
	callba_bank1 Func_6ee9a
	ret

Func_555b: ; 555b (1:555b)
	ld c, a
	ld b, $0
	ld d, $0
.asm_5560
	ld a, $7
	ld hl, wBlocksOnScreen + 8 * 8
	add hl, bc
	cp [hl]
	jr z, .asm_557a
	ld hl, wBlocksOnScreen + 8 * 8 + 7
	add hl, bc
	cp [hl]
	jr z, .asm_557a
	inc l
	cp [hl]
	jr z, .asm_557a
	inc l
	cp [hl]
	jr z, .asm_557a
	and a
	ret

.asm_557a
	inc d
	ld a, d
	cp $6
	jr z, .asm_558a
	inc c
	ld a, c
	cp $6
	jr c, .asm_5560
	ld c, $0
	jr .asm_5560

.asm_558a
	scf
	ret

Func_558c: ; 558c (1:558c)
	push bc
	push de
	ld a, [wca18]
	cp $6
	jr z, .asm_559a
	call Random_1in5
	jr .asm_559d

.asm_559a
	call Random_1in6
.asm_559d
	inc a
	ld [hFF8A], a
	ld hl, wBlocksOnScreen
	add hl, de
	ld c, e
	ld b, d
	inc hl
	ld d, [hl]
	ld a, [hFF8A]
	cp d
	jr nz, .asm_55b5
	ld hl, wca18
	cp [hl]
	jr c, .asm_55b4
	xor a
.asm_55b4
	inc a
.asm_55b5
	ld [hFF8B], a
.asm_55b7
	ld a, c
	add $8
	ld c, a
	cp $48
	jr c, .asm_55c3
	ld a, [hFF8B]
	jr .asm_55e0

.asm_55c3
	ld hl, w6_d058
	add hl, bc
	ld a, [hl]
	and $1f
	jr nz, .asm_55b7
	ld hl, wBlocksOnScreen
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55b7
	cp $7
	jr z, .asm_55b7
	ld e, a
	ld a, [wc8a7]
	and a
	jr nz, .asm_55e3
	ld a, e
.asm_55e0
	pop de
	pop bc
	ret

.asm_55e3
	ld a, [hFF8A]
.asm_55e5
	cp d
	jr z, .asm_55ee
	inc hl
	cp e
	jr z, .asm_55ee
	jr .asm_55e0

.asm_55ee
	inc a
	ld hl, wca18
	cp [hl]
	jr c, .asm_55e5
	jr z, .asm_55e5
	ld a, $1
	jr .asm_55e5

Func_55fb: ; 55fb (1:55fb)
	push bc
	push de
	ld c, a
	ld b, $0
	sub $8
	ld e, a
	ld d, $0
	ld hl, w6_d0b0
	add hl, de
	ld a, [hli]
	and $20
	jr nz, .asm_5617
	ld hl, w6_d100
	add hl, de
	ld a, [hli]
	or [hl]
	jp nz, .nope
.asm_5617
	ld hl, wBlocksOnScreen
	add hl, bc
	ld a, [hli]
	or [hl]
	jp z, .nope
	ld hl, w6_d100
	add hl, bc
	ld a, [hli]
	or [hl]
	jp nz, .nope
	ld hl, w6_d0b0
	add hl, bc
	ld a, [hli]
	and $88
	jp nz, .nope
	ld a, [hl]
	and $88
	jp nz, .nope
	ld hl, w6_d058
	add hl, bc
	ld a, [hli]
	and $3
	jp nz, .nope
	ld a, [hl]
	and $3
	jp nz, .nope
	pop de
	pop bc
	and a
	ret

.nope
	pop de
	pop bc
	scf
	ret

macro_5651: MACRO
x = \1
y = \2
	bcboardcoord x, y, w6_d0b0
	hlboardcoord x, y, w6_d100
	a_boardcoord x, y, w6_d058
	and $3
	jp nz, .done
	ld a, [bc]
	and $8
	jp nz, .done
	a_boardcoord x, y
	and a
	jr z, .next_\@
	ld a, [bc]
	bit 0, a
	jr nz, .next_\@
	and $4
	jr nz, .next_\@
	ld a, [bc]
	or $4
	ld [bc], a
	ld a, [wca1d]
	cp [hl]
	jr c, .next_\@
	ld [hl], a
.next_\@
	ENDM

macro2_5651: MACRO
	dw .row1
	dw .row2
	dw .row3
	dw .row4
	dw .row5
	dw .row6
	dw .row7
	dw .row8
	dw .row9

.row9
	macro_5651 \1, 7
.row8
	macro_5651 \1, 6
.row7
	macro_5651 \1, 5
.row6
	macro_5651 \1, 4
.row5
	macro_5651 \1, 3
.row4
	macro_5651 \1, 2
.row3
	macro_5651 \1, 1
.row2
	macro_5651 \1, 0
.row1
.done
	ret
	ENDM

Func_5651: ; 5651 (1:5651)
	ld a, c
	and $f8
	sra a
	sra a
	ld e, a
	ld d, $0
	ld a, c
	and $7
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_566e
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_566e: ; 566e
	dw Pointers_56a3
	dw Pointers_5826
	dw Pointers_59a9
	dw Pointers_5b2c
	dw Pointers_5caf
	dw Pointers_5e32

macro_567a: MACRO
x = \1
y = \2
	bcboardcoord x, y, w6_d0b0
	hlboardcoord x, y, w6_d100
	a_boardcoord x, y, w6_d058
	and $3
	jp nz, .done
	ld a, [bc]
	and $8
	jp nz, .done
	a_boardcoord x, y
	and a
	jr z, .next_\@
	ld a, [bc]
	and $5
	jr nz, .next_\@
	ld a, [bc]
	or $44
	ld [bc], a
	ld a, [wca1d]
	ld [hl], a
.next_\@
	ENDM

macro2_567a: MACRO
	dw .row1
	dw .row2
	dw .row3
	dw .row4
	dw .row5
	dw .row6
	dw .row7
	dw .row8
	dw .row9

.row9
	macro_567a \1, 7
.row8
	macro_567a \1, 6
.row7
	macro_567a \1, 5
.row6
	macro_567a \1, 4
.row5
	macro_567a \1, 3
.row4
	macro_567a \1, 2
.row3
	macro_567a \1, 1
.row2
	macro_567a \1, 0
.row1
.done
	ret
	ENDM

Func_567a: ; 567a (1:567a)
	ld a, c
	and $f8
	sra a
	sra a
	ld e, a
	ld d, $0
	ld a, c
	and $7
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_5697
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_5697: ; 5697
	dw Pointers_5fb5
	dw Pointers_6100
	dw Pointers_624b
	dw Pointers_6396
	dw Pointers_64e1
	dw Pointers_662c

Pointers_56a3: macro2_5651 0
Pointers_5826: macro2_5651 1
Pointers_59a9: macro2_5651 2
Pointers_5b2c: macro2_5651 3
Pointers_5caf: macro2_5651 4
Pointers_5e32: macro2_5651 5

Pointers_5fb5: macro2_567a 0
Pointers_6100: macro2_567a 1
Pointers_624b: macro2_567a 2
Pointers_6396: macro2_567a 3
Pointers_64e1: macro2_567a 4
Pointers_662c: macro2_567a 5

Func_6777: ; 6777 (1:6777)
	ld a, [wcea6]
	ld l, a
	cp $32
	jr c, .asm_6787
	ld a, [wcebc]
	and a
	jr nz, .asm_6787
	ld l, $32
.asm_6787
	ld a, l
	add a
	ld hl, w6_d9a0
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_6796: ; 6796
	ld a, [wcea6]
	add a
	ld hl, w6_da68
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_67a7: ; 67a7
	ld a, [wc87a]
	add a
	ld hl, w6_da68
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_67b8: ; 67b8 (1:67b8)
	ld a, c
	cp $36
	jr c, .asm_67bf
	ld a, $35
.asm_67bf
	add a
	ld hl, Data_67cd
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
.asm_67c9
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

Data_67cd: ; 67cd
	dw     0
	dw     0
	dw     0
	dw     0
	dw    30
	dw    60
	dw   150
	dw   190
	dw   230
	dw   270
	dw   310
	dw   400
	dw   450
	dw   500
	dw   550
	dw   700
	dw   760
	dw   850
	dw   970
	dw  1120
	dw  1300
	dw  1510
	dw  1750
	dw  2020
	dw  2320
	dw  2650
	dw 15000
	dw 15570
	dw 16170
	dw 16800
	dw 17460
	dw 18150
	dw 18870
	dw 19620
	dw 20400
	dw 21200
	dw 22000
	dw 22800
	dw 23600
	dw 24400
	dw 25200
	dw 26000
	dw 26800
	dw 27600
	dw 28400
	dw 29200
	dw 30000
	dw 30800
	dw 31600
	dw 32400
	dw 33200
	dw 34000
	dw 34800
	dw 35600
	dw 36400

Func_683b: ; 683b (1:683b)
	ld a, c
	cp $1e
	jr c, .asm_6842
	ld a, $1d
.asm_6842
	add a
	ld hl, Data_6850
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

Data_6850: ; 6850
	dw     0
	dw    50
	dw    80
	dw   150
	dw   300
	dw   400
	dw   500
	dw   700
	dw   900
	dw  1100
	dw  1300
	dw  1500
	dw  1800
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100
	dw  2100

Func_688c: ; 688c (1:688c)
	push hl
	push bc
	ld a, [wc889]
	cp $36
	jr c, .asm_6897
	ld a, $36
.asm_6897
	add a
	ld c, a
	ld b, $0
	ld a, [wc883]
	and a
	jr nz, .asm_68a6
	ld hl, w6_db30
	jr .asm_68a9

.asm_68a6
	ld hl, w6_db9c
.asm_68a9
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wc87c
	ld a, [hli]
	sub c
	ld a, [hld]
	sbc b
	jr c, .asm_68ba
	pop bc
	pop hl
	scf
	ret

.asm_68ba
	ld a, c
	ld [hli], a
	ld [hl], b
	pop bc
	pop hl
	and a
	ret

Func_68c1: ; 68c1 (1:68c1)
	push hl
	push bc
	ld a, [wc88a]
	cp $14
	jr c, .asm_68cc
	ld a, $13
.asm_68cc
	add a
	ld c, a
	ld b, $0
	ld a, [wc883]
	and a
	jr nz, .asm_68db
	ld hl, w6_dc08
	jr .asm_68de

.asm_68db
	ld hl, w6_dc30
.asm_68de
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wc87c
	ld a, [hli]
	sub c
	ld a, [hld]
	sbc b
	jr c, .asm_68ef
	pop bc
	pop hl
	scf
	ret

.asm_68ef
	ld a, c
	ld [hli], a
	ld [hl], b
	pop bc
	pop hl
	and a
	ret

Func_68f6: ; 68f6 (1:68f6)
	ld a, [wcea5]
	cp $5
	jr z, .asm_6917
	ld a, [wceb9]
	and a
	jr z, .asm_690d
	ld de, 999999 % $10000
	push de
	ld de, 999999 / $10000
	push de
	jr .asm_691f

.asm_690d
	ld de, 99999 % $10000
	push de
	ld de, 99999 / $10000
	push de
	jr .asm_691f

.asm_6917
	ld de, 9999 % $10000
	push de
	ld de, 9999 / $10000
	push de
.asm_691f
	ld hl, wScore
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hld], a
	dec hl
	pop bc
	pop de
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d
	ld a, [hl]
	sbc c
	ret c
	ld a, c
	ld [hld], a
	ld a, d
	ld [hld], a
	ld [hl], e
	ret

Func_693c: ; 693c (1:693c)
	push hl
	push bc
	ld a, [wc889]
	ld hl, wcac9
	cp [hl]
	jr c, .asm_6948
	ld [hl], a
.asm_6948
	cp $36
	jr c, .asm_694e
	ld a, $36
.asm_694e
	sub $4
	add a
	ld c, a
	ld b, $0
	ld hl, wca29
	add hl, bc
	ld a, [hl]
	add $1
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	jr nc, .asm_6966
	ld a, $ff
	ld [hld], a
	ld [hl], a
.asm_6966
	pop bc
	pop hl
	ret

Func_6969: ; 6969 (1:6969)
	push hl
	push bc
	ld a, [wc88a]
	ld hl, wcaca
	cp [hl]
	jr c, .asm_6975
	ld [hl], a
.asm_6975
	dec a
	cp $1d
	jr c, .asm_697c
	ld a, $1c
.asm_697c
	add a
	ld c, a
	ld b, $0
	ld hl, wca8f
	add hl, bc
	ld a, [hl]
	add $1
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hld], a
	jr nc, .asm_6992
	ld a, $ff
	ld [hli], a
	ld [hld], a
.asm_6992
	pop bc
	pop hl
	ret

Func_6995: ; 6995 (1:6995)
	push hl
	ld hl, wcacb
	ld a, [hl]
	add $1
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	jr nc, .asm_69b1
	ld a, $ff
	ld [hld], a
	ld [hld], a
	ld [hld], a
	ld [hl], a
.asm_69b1
	pop hl
	ret

Func_69b3: ; 69b3 (1:69b3)
	ld a, [wc8fa]
	ld c, a
	ld a, [wc8fb]
	cp c
	ret z
	ld b, $0
	ld hl, w6_d400
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	jr z, .asm_69cc
	dec a
	jr nz, .asm_69db
.asm_69cc
	call Func_7313
	and a
	ret nz
	ld a, [wc87b]
	and a
	ret nz
	ld a, [wc87e]
	and a
	ret nz
.asm_69db
	hlboardcoord 0, 0
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	and a
	ret nz
	ld hl, wc8fa
	inc [hl]
	ld hl, w6_d400
	add hl, bc
	ld a, [hl]
	and $f0
	jr nz, .asm_6a12
	ld a, [hl]
	dec a
	jp z, Func_6ab6
	dec a
	jp z, Func_6b04
	dec a
	jp z, Func_6b4a
	dec a
	jp z, Func_6b81
	dec a
	jp Func_6a7c

.asm_6a12
	ld a, [hl]
	ld hl, w6_d1a0
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wc8fc
	ld a, [hl]
	ld e, a
	add $6
	ld [hl], a
	ld d, $0
	bcboardcoord 0, 0
	ld hl, w6_d300
	add hl, de
	ld a, [hl]
	or $c0
	ld [bc], a
	inc c
	inc e
	ld hl, w6_d300
	add hl, de
	ld a, [hl]
	or $c0
	ld [bc], a
	inc c
	inc e
	ld hl, w6_d300
	add hl, de
	ld a, [hl]
	or $c0
	ld [bc], a
	inc c
	inc e
	ld hl, w6_d300
	add hl, de
	ld a, [hl]
	or $c0
	ld [bc], a
	inc c
	inc e
	ld hl, w6_d300
	add hl, de
	ld a, [hl]
	or $c0
	ld [bc], a
	inc c
	inc e
	ld hl, w6_d300
	add hl, de
	ld a, [hl]
	or $c0
	ld [bc], a
	inc c
	inc e
	ld hl, w6_d058
	ld a, $9
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d0b0
	ld a, $4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

Func_6a7c: ; 6a7c (1:6a7c)
	ld hl, wc901
	ld a, [hl]
	inc [hl]
	and $1
	jr nz, .asm_6a8a
	ld de, $0
	jr .asm_6a8d

.asm_6a8a
	ld de, $3
.asm_6a8d
	hlboardcoord 0, 0
	add hl, de
	ld a, $e
	ld [hli], a
	ld a, $f
	ld [hli], a
	ld a, $10
	ld [hl], a
	ld hl, w6_d058
	add hl, de
	ld a, $9
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d0b0
	add hl, de
	ld a, $4
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d1a0
	add hl, de
	ld a, $11
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

Func_6ab6: ; 6ab6 (1:6ab6)
	ld hl, wc902
	ld a, [hl]
	dec a
	jr z, .asm_6ac5
	dec a
	jr z, .asm_6aca
	ld de, $0
	jr .asm_6acd

.asm_6ac5
	ld de, $1
	jr .asm_6acd

.asm_6aca
	ld de, $2
.asm_6acd
	ld a, [hl]
	inc a
	cp $3
	jr c, .asm_6ad4
	xor a
.asm_6ad4
	ld [hl], a
	hlboardcoord 0, 0
	add hl, de
	ld a, $4e
	ld [hli], a
	ld a, $57
	ld [hli], a
	ld a, $58
	ld [hli], a
	ld a, $50
	ld [hl], a
	ld hl, w6_d058
	add hl, de
	ld a, $9
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d0b0
	add hl, de
	ld a, $4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d1a0
	add hl, de
	ld a, $11
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

Func_6b04: ; 6b04 (1:6b04)
	ld hl, wc903
	ld a, [hl]
	inc [hl]
	and $1
	jr nz, .asm_6b12
	ld de, $0
	jr .asm_6b15

.asm_6b12
	ld de, $1
.asm_6b15
	hlboardcoord 0, 0
	add hl, de
	ld a, $8e
	ld [hli], a
	ld a, $9d
	ld [hli], a
	ld a, $8f
	ld [hli], a
	ld a, $9d
	ld [hli], a
	ld a, $90
	ld [hl], a
	ld hl, w6_d058
	add hl, de
	ld a, $9
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d0b0
	add hl, de
	ld a, $4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d1a0
	add hl, de
	ld a, $11
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

Func_6b4a: ; 6b4a (1:6b4a)
	hlboardcoord 0, 0
	ld a, $ce
	ld [hli], a
	ld a, $dd
	ld [hli], a
	ld a, $d7
	ld [hli], a
	ld a, $d8
	ld [hli], a
	ld a, $dd
	ld [hli], a
	ld a, $d0
	ld [hl], a
	ld hl, w6_d058
	ld a, $9
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d0b0
	ld a, $4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d1a0
	ld a, $11
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

Func_6b81: ; 6b81 (1:6b81)
	hlboardcoord 0, 0
	ld a, $f8
	ld [hli], a
	ld a, $f9
	ld [hli], a
	ld a, $f9
	ld [hli], a
	ld a, $f9
	ld [hli], a
	ld a, $f9
	ld [hli], a
	ld a, $fa
	ld [hl], a
	ld hl, w6_d058
	ld a, $a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d0b0
	ld a, $4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, w6_d1a0
	ld a, $11
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

Func_6bb8: ; 6bb8 (1:6bb8)
	push bc
	push de
	ld a, [wc8fa]
	ld e, a
	ld d, $0
	ld a, [wc8fb]
	ld c, a
	ld b, $0
	ld a, c
	cp e
	jr c, .asm_6bcc
	ld d, $1
.asm_6bcc
	ld a, [hFF8A]
	bit 7, a
	jr z, .asm_6bd6
	and $7f
	jr .asm_6bd8

.asm_6bd6
	ld a, $1
.asm_6bd8
	add c
	ld c, a
	ld a, b
	adc $0
	ld b, $0
	ld a, e
	sub c
	ld a, d
	sbc b
	jr nc, .asm_6be8
	pop de
	pop bc
	ret

.asm_6be8
	ld a, [wc8fc]
	ld e, a
	ld d, $0
	ld a, [wc8fd]
	ld c, a
	ld b, $0
	ld a, c
	cp e
	jr c, .asm_6bfa
	ld d, $1
.asm_6bfa
	ld a, [hFF8A]
	bit 7, a
	jr z, .asm_6c14
	and $7f
	add a
	ld l, a
	add a
	add l
	ld l, a
	ld a, c
	add l
	ld c, a
	ld a, b
	adc $0
	ld b, a
	ld a, e
	sub c
	ld a, d
	sbc b
	jr c, .asm_6c1c
.asm_6c14
	callba_bank1 Func_b650
.asm_6c1c
	pop de
	pop bc
	ret

Func_6c1f: ; 6c1f (1:6c1f)
	ld a, [wc8fe]
	ld e, a
	ld a, [wc8ff]
	ld d, a
	cp e
	ret z
	ld b, $0
	ld c, e
.asm_6c2c
	ld hl, wc900
	ld a, c
	cp [hl]
	jr z, .asm_6c3d
	ld hl, w6_d580
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_6c3d
	dec a
	ld [hl], a
.asm_6c3d
	ld a, c
	add $1
	and $7f
	ld c, a
	cp d
	jr nz, .asm_6c2c
	ld b, $0
	ld c, e
.asm_6c49
	ld hl, w6_d580
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_6c8b
	ld hl, wc8fe
	ld a, [hl]
	add $1
	and $7f
	ld [hl], a
	ld hl, w6_d500
	add hl, bc
	ld a, [hl]
	and $c0
	cp $80
	jr nz, .asm_6c7c
	ld a, [wceb7]
	and a
	jr nz, .asm_6c6f
	ld e, $9
	jr .asm_6c71

.asm_6c6f
	ld e, $f
.asm_6c71
	ld a, [hl]
	and $3f
	cp e
	jr c, .asm_6c7c
	ld a, e
	or $80
	jr .asm_6c7d

.asm_6c7c
	ld a, [hl]
.asm_6c7d
	ld [hFF8A], a
	call Func_6bb8
	ld a, c
	add $1
	and $7f
	ld c, a
	cp d
	jr nz, .asm_6c49
.asm_6c8b
	ret

Func_6c8c: ; 6c8c
	ld a, [hFF8A]
	and $c0
	sub $40
	jr z, .asm_6c9a
	sub $40
	jr z, .asm_6cac
	jr .asm_6cb8

.asm_6c9a
	ld a, [hFF8A]
	and $3f
	sub $2
	ld b, a
.asm_6ca1
	ld a, $4
	ld [hFF8B], a
	call Func_6db8
	dec b
	jr nz, .asm_6ca1
	ret

.asm_6cac
	ld a, [hFF8A]
	and $3f
	or $80
	ld [hFF8B], a
	call Func_6db8
	ret

.asm_6cb8
	ld a, [hFF8A]
	add a
	add a
	ld c, a
	ld b, $0
	ld hl, Data_6cdc
	add hl, bc
	ld b, $0
.asm_6cc5
	ld c, $0
.asm_6cc7
	ld a, c
	cp [hl]
	jr nc, .asm_6cd4
	inc c
	ld a, b
	ld [hFF8B], a
	call Func_6db8
	jr .asm_6cc7

.asm_6cd4
	inc hl
	inc b
	ld a, b
	cp $4
	jr nz, .asm_6cc5
	ret

Data_6cdc: ; 6cdc
	db 0, 0, 0, 0
	db 0, 0, 0, 0
	db 0, 0, 0, 0
	db 0, 0, 0, 0
	db 1, 0, 0, 0
	db 0, 1, 0, 0
	db 0, 0, 1, 0
	db 0, 0, 0, 1
	db 1, 1, 0, 0
	db 0, 2, 0, 0
	db 0, 0, 2, 0
	db 0, 0, 1, 1
	db 0, 0, 0, 2
	db 0, 0, 0, 3
	db 0, 0, 0, 3
	db 0, 0, 0, 3
	db 0, 0, 0, 3
	db 0, 0, 0, 3
	db 0, 0, 0, 3
	db 0, 0, 0, 3
	db 0, 0, 0, 3
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 4
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 5
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 6
	db 0, 0, 0, 7
	db 0, 0, 0, 7
	db 0, 0, 0, 7
	db 0, 0, 0, 7

Func_6db8: ; 6db8 (1:6db8)
	push bc
	push hl
	ld a, [hFF8B]
	bit 7, a
	jr z, .asm_6dd0
	ld hl, wc900
	ld a, [hl]
	inc a
	jr z, .asm_6dcc
	ld c, [hl]
	ld b, $0
	jr .asm_6ddf

.asm_6dcc
	ld a, [wc8ff]
	ld [hl], a
.asm_6dd0
	ld hl, wc8ff
	ld c, [hl]
	ld b, $0
	ld hl, wc8ff
	ld a, [hl]
	add $1
	and $7f
	ld [hl], a
.asm_6ddf
	ld a, [hFF8B]
	ld hl, w6_d500
	add hl, bc
	ld [hl], a
	ld hl, w6_d580
	add hl, bc
	ld a, $3c
	ld [hl], a
	pop hl
	pop bc
	ret

Func_6df0: ; 6df0 (1:6df0)
	push bc
	push de
	pushsramstateandenable 1
	call Func_6e88
	ld e, l
	ld d, h
	hlboardcoord 0, 0
	ld bc, $50
	call CopyBytes
	call Func_6ea1
	ld e, l
	ld d, h
	ld hl, w6_d0b0
	ld bc, $50
	call CopyBytes
	call Func_6eba
	ld e, l
	ld d, h
	ld hl, w6_d058
	ld bc, $50
	call CopyBytes
	popsramstate
	pop de
	pop bc
	ret

Func_6e3f: ; 6e3f
	push bc
	push de
	pushsramstateandenable 1
	call Func_6e88
	deboardcoord 0, 0
	ld bc, $50
	call CopyBytes
	call Func_6ea1
	ld de, w6_d0b0
	ld bc, $50
	call CopyBytes
	call Func_6eba
	ld de, w6_d058
	ld bc, $50
	call CopyBytes
	popsramstate
	pop de
	pop bc
	ret

Func_6e88: ; 6e88 (1:6e88)
	ld a, [wc8da]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_6e97
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pointers_6e97: ; 6e97
	dw s1_a686
	dw s1_a6d6
	dw s1_a726
	dw s1_a776
	dw s1_a7c6

Func_6ea1: ; 6ea1 (1:6ea1)
	ld a, [wc8da]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_6eb0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pointers_6eb0: ; 6eb0
	dw s1_a816
	dw s1_a866
	dw s1_a8b6
	dw s1_a906
	dw s1_a956

Func_6eba: ; 6eba (1:6eba)
	ld a, [wc8da]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_6ec9
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pointers_6ec9: ; 6ec9
	dw s1_a9a6
	dw s1_a9f6
	dw s1_aa46
	dw s1_aa96
	dw s1_aae6

Func_6ed3: ; 6ed3 (1:6ed3)
	ld hl, wc8a4
	ld a, [hl]
	and a
	jr z, .asm_6edc
	dec [hl]
	ret

.asm_6edc
	ld hl, wc8a3
	ld a, [wc8a2]
	cp [hl]
	jr z, .asm_6eec
	ld b, a
	farcall Func_c0307
.asm_6eec
	ld a, [wc8a2]
	ld [wc8a3], a
	ret

Func_6ef3: ; 6ef3 (1:6ef3)
	ld a, [wcea1]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_6f02
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_6f02: ; 6f02
	dw Func_6f22
	dw Func_6f3a
	dw Func_6f58
	dw Func_6f70
	dw Func_6f77
	dw Func_6f8f
	dw Func_6faa
	dw Func_6fc2
	dw Func_6fe0
	dw 0
	dw 0
	dw 0
	dw 0
	dw Func_6f8f
	dw Func_6ff8
	dw Func_6ffc

Func_6f22: ; 6f22 (1:6f22)
	call Func_7014
	call Func_7568
	callba_bank1 Func_741c5
	call Func_702b
	call Func_70b9
	call Func_70f8
	ret

Func_6f3a: ; 6f3a (1:6f3a)
	call Func_7014
	call Func_7568
	callba_bank1 Func_741c5
	call Func_763f
	call nc, Func_702b
	call Func_70b9
	call Func_7546
	call Func_7133
	ret

Func_6f58: ; 6f58 (1:6f58)
	call Func_7014
	call Func_75a3
	callba_bank1 Func_741c5
	call Func_702b
	call Func_70b9
	call Func_7161
	ret

Func_6f70: ; 6f70 (1:6f70)
	call Func_7014
	call Func_7194
	ret

Func_6f77: ; 6f77 (1:6f77)
	call Func_7014
	call Func_75d6
	callba_bank1 Func_741c5
	call Func_702b
	call Func_70b9
	call Func_70f8
	ret

Func_6f8f: ; 6f8f (1:6f8f)
	call Func_7014
	call Func_75a3
	call Func_7623
	callba_bank1 Func_741c5
	call Func_702b
	call Func_70b9
	call Func_71bc
	ret

Func_6faa: ; 6faa (1:6faa)
	call Func_7014
	call Func_75a3
	call Func_7623
	callba_bank1 Func_741c5
	call Func_702b
	call Func_70b9
	ret

Func_6fc2: ; 6fc2 (1:6fc2)
	call Func_7014
	call Func_7568
	callba_bank1 Func_741c5
	call Func_763f
	call nc, Func_702b
	call Func_70b9
	call Func_7546
	call Func_71e8
	ret

Func_6fe0: ; 6fe0 (1:6fe0)
	call Func_7014
	call Func_75a3
	callba_bank1 Func_741c5
	call Func_702b
	call Func_70b9
	call Func_7200
	ret

Func_6ff8: ; 6ff8 (1:6ff8)
	call Func_7014
	ret

Func_6ffc: ; 6ffc (1:6ffc)
	call Func_7014
	call Func_75a3
	callba_bank1 Func_741c5
	call Func_7085
	call Func_70b9
	call Func_721d
	ret

Func_7014: ; 7014 (1:7014)
	ld hl, wc88f
	ld a, [wc889]
	add [hl]
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	ret nc
	ld a, $ff
	ld [hld], a
	ld [hld], a
	ld [hl], a
	ret

Func_702b: ; 702b (1:702b)
	ld b, $4
	ld hl, wd0b0
	call Func_73cc
	ret nz
	call Func_7482
	ld a, c
	ld [wc894], a
	cp $3
	jr c, .asm_7046
	ld a, [wc8a0]
	ld [wc8a2], a
	ret

.asm_7046
	ld a, [wc8a1]
	ld [wc8a2], a
	ret

Func_704d: ; 704d
	ld b, $4
	ld hl, wd0b0
	call Func_73cc
	jr nz, .asm_7070
	call Func_7482
	ld a, c
	ld [wc894], a
	cp $3
	jr c, .asm_706a
	ld a, [wc8a0]
	ld [wc8a2], a
	jr .asm_7070

.asm_706a
	ld a, [wc8a1]
	ld [wc8a2], a
.asm_7070
	ld hl, wcd13
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wcd0b
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d
	ret nc
	ld a, [wc8a1]
	ld [wc8a2], a
	ret

Func_7085: ; 7085 (1:7085)
	ld b, $4
	ld hl, wd0b0
	call Func_73cc
	jr nz, .asm_70a8
	call Func_7482
	ld a, c
	ld [wc894], a
	cp $3
	jr c, .asm_70a2
	ld a, [wc8a0]
	ld [wc8a2], a
	jr .asm_70a8

.asm_70a2
	ld a, [wc8a1]
	ld [wc8a2], a
.asm_70a8
	ld hl, wcd38
	ld a, [hli]
	sub $7d
	ld a, [hli]
	sbc $0
	ret nc
	ld a, [wc8a1]
	ld [wc8a2], a
	ret

Func_70b9: ; 70b9 (1:70b9)
	hlboardcoord 0, 0
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr nz, .asm_70cd
	xor a
	ld [wc8a6], a
	ret

.asm_70cd
	ld hl, wc87c
	ld a, [hli]
	or [hl]
	ret nz
	ld a, [wcadf]
	and a
	ret nz
	call Func_7313
	and a
	ret nz
	ld a, [hJoyPressed]
	and $2
	jr nz, .asm_70f2
	ld hl, wc8a6
	ld a, [hl]
	ld hl, wca24
	cp [hl]
	jr z, .asm_70f2
	ld hl, wc8a6
	inc [hl]
	ret

.asm_70f2
	ld a, $1
	ld [wcd6e], a
	ret

Func_70f8: ; 70f8 (1:70f8)
	ld a, [wc876]
	and a
	jr nz, .asm_7123
	ld hl, wScore
	ld a, [hli]
	sub $9f
	ld a, [hli]
	sbc $86
	ld a, [hl]
	sbc $1
	jr c, .asm_7123
	ld hl, wc876
	inc [hl]
	ld hl, wc86a
	ld a, [hli]
	ld [wc872], a
	ld a, [hli]
	ld [wc873], a
	ld a, [hli]
	ld [wc874], a
	ld a, [hl]
	ld [wc875], a
.asm_7123
	ld a, [wcd6e]
	and a
	ret z
	ld a, $2
	ld [wc887], a
	ld a, $0
	ld [wc886], a
	ret

Func_7133: ; 7133 (1:7133)
	ld a, [wcd6e]
	and a
	jr nz, .asm_7140
	ld a, [wc879]
	and a
	jr nz, .asm_714b
	ret

.asm_7140
	ld a, $2
	ld [wc887], a
	ld a, $0
	ld [wc886], a
	ret

.asm_714b
	ld a, [wc7ce]
	and a
	jr nz, .asm_7156
	ld a, $21
	ld [wc7cb], a
.asm_7156
	ld a, $2
	ld [wc887], a
	ld a, $1
	ld [wc886], a
	ret

Func_7161: ; 7161 (1:7161)
	ld a, [wcd6e]
	and a
	jr nz, .asm_717e
	call Func_7313
	and a
	ret nz
	ld a, [wc8e6]
	and a
	ret z
	dec a
	and $f0
	swap a
	ld d, a
	ld a, [wc894]
	cp d
	jr nc, .asm_7189
	ret

.asm_717e
	ld a, $2
	ld [wc887], a
	ld a, $0
	ld [wc886], a
	ret

.asm_7189
	ld a, $2
	ld [wc887], a
	ld a, $2
	ld [wc886], a
	ret

Func_7194: ; 7194 (1:7194)
	call Func_7313
	and a
	ret nz
	xor a
	call Func_725a
	jr z, .asm_71b1
	ld a, [wc8da]
	and a
	jr z, .asm_71a6
	ret

.asm_71a6
	ld a, $2
	ld [wc887], a
	ld a, $0
	ld [wc886], a
	ret

.asm_71b1
	ld a, $2
	ld [wc887], a
	ld a, $2
	ld [wc886], a
	ret

Func_71bc: ; 71bc (1:71bc)
	ld a, [wcd6e]
	and a
	jr nz, .asm_71d8
	ld hl, wcd0b
	ld a, [hli]
	or [hl]
	ret nz
	ld a, $2
	ld [wc887], a
	ld a, $3
	ld [wc886], a
	ld a, $0
	ld [wc888], a
	ret

.asm_71d8
	ld a, $2
	ld [wc887], a
	ld a, $3
	ld [wc886], a
	ld a, $1
	ld [wc888], a
	ret

Func_71e8: ; 71e8 (1:71e8)
	ld a, [wc879]
	and a
	jr nz, .asm_71ef
	ret

.asm_71ef
	ld a, [wc7ce]
	and a
	jr nz, .asm_71fa
	ld a, $21
	ld [wc7cb], a
.asm_71fa
	ld a, $3
	ld [wcd70], a
	ret

Func_7200: ; 7200 (1:7200)
	call Func_7313
	and a
	ret nz
	ld a, [wc8e6]
	and a
	ret z
	dec a
	and $f0
	swap a
	ld d, a
	ld a, [wc894]
	cp d
	jr nc, .asm_7217
	ret

.asm_7217
	ld a, $1
	ld [wcdac], a
	ret

Func_721d: ; 721d (1:721d)
	ld a, [wcd6e]
	and a
	jr nz, .asm_7239
	ld hl, wcd38
	ld a, [hli]
	or [hl]
	ret nz
	ld a, $0
	ld [wc888], a
	ld a, $2
	ld [wc887], a
	ld a, $4
	ld [wc886], a
	ret

.asm_7239
	ld a, [wceac]
	and a
	jr z, .asm_724f
	ld a, $1
	ld [wc888], a
	ld a, $2
	ld [wc887], a
	ld a, $4
	ld [wc886], a
	ret

.asm_724f
	ld a, $2
	ld [wc887], a
	ld a, $0
	ld [wc886], a
	ret

Func_725a: ; 725a (1:725a)
	hlboardcoord 0, 0
REPT 9
REPT 6
	ld a, [hli]
	and a
	ret nz
ENDR
	inc l
	inc l
ENDR
	and a
	ret

Func_7313: ; 7313 (1:7313)
	ld hl, w6_d0b0
REPT 9
REPT 6
	ld a, [hli]
	and a
	ret nz
ENDR
	inc l
	inc l
ENDR
	and a
	ret

Func_73cc: ; 73cc (1:73cc)
REPT 9
REPT 6
	ld a, [hli]
	and b
	ret nz
ENDR
	inc l
	inc l
ENDR
	and a
	ret

Func_7482: ; 7482 (1:7482)
	hlboardcoord 0, 0
	xor a
	ld b, a
	ld c, a
REPT 9
REPT 6
	ld a, [hli]
	and a
	ret nz
ENDR
	inc l
	inc l
	inc c
ENDR
	ret

Func_7546: ; 7546 (1:7546)
	ld hl, wc86c
	ld a, [hld]
	and a
	ret nz
	ld a, [hld]
	cp $10
	ret nc
	and a
	ret z
	ld a, [hl]
	cp $3b
	ret nz
	ld a, [wc7ce]
	and a
	jr nz, .asm_7561
	ld a, $20
	ld [wc7cb], a
.asm_7561
	ld a, [wc8a1]
	ld [wc8a2], a
	ret

Func_7568: ; 7568 (1:7568)
	ld a, [wc889]
	and a
	jr z, .asm_75a2
	ld c, a
	ld b, $0
	ld hl, wc88c
	ld a, [hl]
	add c
	ld [hli], a
	ld e, a
	ld a, [hl]
	adc b
	ld [hl], a
	ld d, a
.asm_757c
	ld hl, wcea6
	ld a, [hl]
	cp $63
	jr nc, .asm_75a2
	call Func_6796
	ld a, e
	sub l
	ld c, a
	ld a, d
	sbc h
	ld b, a
	jr c, .asm_75a2
	ld a, $b4
	ld [wc9b0], a
	ld hl, wcea6
	inc [hl]
	ld hl, wc88c
	ld a, c
	ld [hli], a
	ld [hl], b
	ld e, c
	ld d, b
	jr .asm_757c

.asm_75a2
	ret

Func_75a3: ; 75a3 (1:75a3)
	ld hl, wc877
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wcea6]
	cp $63
	ret nc
	ld a, [wc87a]
	cp $63
	ret nc
.asm_75b5
	call Func_67a7
	ld a, e
	sub l
	ld c, a
	ld a, d
	sbc h
	ld b, a
	ret c
	ld a, $b4
	ld [wc9b0], a
	ld hl, wcea6
	inc [hl]
	ld hl, wc87a
	inc [hl]
	ld hl, wc877
	ld a, c
	ld [hli], a
	ld [hl], b
	ld e, c
	ld d, b
	jr .asm_75b5

Func_75d6: ; 75d6 (1:75d6)
	callba_bank1 Func_13671
	ld a, e
	and a
	jr z, .asm_7602
	ld d, $0
	ld hl, Data_7612
	add hl, de
	ld a, [hl]
	ld [hFF8A], a
	ld a, [wceb7]
	and a
	jr nz, .asm_75fa
	ld a, [hl]
	cp $89
	jr c, .asm_75fa
	ld a, $89
	ld [hFF8A], a
.asm_75fa
	callba_bank1 Func_6bb8
.asm_7602
	ld hl, wcea9
	ld c, [hl]
	ld a, [wcef8]
	ld [hl], a
	cp c
	ret z
	ld a, $b4
	ld [wc9b0], a
	ret

Data_7612: ; 7612
	db $00
	db $81
	db $82
	db $83
	db $84
	db $85
	db $86
	db $87
	db $88
	db $89
	db $8a
	db $8b
	db $8c
	db $00
	db $01
	db $02
	db $04

Func_7623: ; 7623 (1:7623)
	ld a, [wc889]
	ld hl, wc88e
	add [hl]
	ld [hl], a
	ld a, [wca21]
	sub [hl]
	jr z, .asm_7633
	jr nc, .asm_763e
.asm_7633
	cpl
	inc a
	ld [hl], a
	ld hl, wc8a9
	ld a, [hl]
	inc a
	jr z, .asm_763e
	ld [hl], a
.asm_763e
	ret

Func_763f: ; 763f (1:763f)
	ld hl, wc86d
	ld a, [hld]
	or [hl]
	jr nz, .asm_764c
	dec hl
	ld a, [hl]
	cp $10
	jr c, .asm_764e
.asm_764c
	and a
	ret

.asm_764e
	scf
	ret

SECTION "Bank 02", ROMX, BANK [$02]
Func_8000: ; 8000
	ld de, $0
	ld hl, wcbf3
.asm_8006
	ld a, [hli]
	and a
	jr z, .asm_8013
	inc hl
	inc e
	inc e
	ld a, e
	cp $18
	jr c, .asm_8006
	ret

.asm_8013
	xor a
	ld [hld], a
	inc a
	ld [hl], a
	ld hl, wcbec
	ld a, [hli]
	ld c, [hl]
	ld b, a
	ld hl, wcc0b
	add hl, de
	xor a
	ld [hli], a
	ld [hl], b
	ld hl, wcc23
	add hl, de
	xor a
	ld [hli], a
	ld [hl], c
	ld a, [wcbee]
	ld l, a
	ld a, [wcbef]
	ld h, a
	ld bc, Data_925e
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcc3b
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wcc53
	add hl, de
	xor a
	ld [hl], a
	ld hl, wcc6b
	add hl, de
	ld a, [wcbf0]
	ld [hli], a
	ld [hl], $0
	inc a
	jr nz, .asm_8057
	ld [hl], $1
	ret

.asm_8057
	ld hl, wcbe9
	ld a, [hl]
	cp $2
	jr c, .asm_8075
	ld hl, wcbea
	ld c, [hl]
	ld b, $0
	ld hl, wcc54
	add hl, bc
	ld [hl], $1
	ld a, [wcbeb]
	ld [wcbea], a
	ld a, $1
	jr .asm_8076

.asm_8075
	inc [hl]
.asm_8076
	ld hl, wcbea
	ld c, a
	ld b, $0
	add hl, bc
	ld [hl], e
	ld hl, wcc54
	add hl, de
	xor a
	ld [hl], a
	farcall Func_9048
	ret

Func_808b: ; 808b (2:408b)
	ld de, $0
Func_808e: ; 808e (2:408e)
	ld hl, wcbf3
	add hl, de
	ld a, [hli]
	and a
	jp z, Func_843a
	dec a
	jp z, Func_80a6
	dec a
	jp z, Func_8135
	dec a
	jp z, Func_828c
	jp Func_83b3

Func_80a6: ; 80a6 (2:40a6)
	ld c, [hl]
	ld b, $0
	inc [hl]
	ld hl, Data_810c
	add hl, bc
	ld a, [hl]
	cp $80
	jr nz, asm_80e7
	ld hl, wcbf3
	add hl, de
	inc [hl]
	inc hl
	xor a
	ld [hl], a
	ld hl, wcc53
	add hl, de
	xor a
	ld [hli], a
	ld a, [hl]
	and a
	jp nz, Func_80d0
	ld hl, wcbe9
	dec [hl]
	ld a, [wcbeb]
	ld [wcbea], a
Func_80d0: ; 80d0 (2:40d0)
	ld hl, wcc0c
	add hl, de
	ld a, [hl]
	add $10
	ld b, a
	ld hl, wcc24
	add hl, de
	ld a, [hl]
	ld c, a
	ld hl, wcc9b
	add hl, de
	ld [hl], $8
	jp Func_843a

asm_80e7
	ld c, a
	ld hl, wcc24
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	ld hl, wcc54
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_80fa
	call Func_8327
.asm_80fa
	ld a, [wceb2]
	and a
	jp z, Func_8109
	ld a, [wc877]
	and $1
	jp nz, Func_843a
Func_8109: ; 8109 (2:4109)
	jp Func_841c

Data_810c: ; 810c
	db $ff
	db $ff
	db $ff
	db $ff
	db $00
	db $ff
	db $00
	db $ff
	db $00
	db $00
	db $ff
	db $00
	db $ff
	db $00
	db $00
	db $ff
	db $00
	db $00
	db $00
	db $00
	db $ff
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $ff
	db $00
	db $00
	db $00
	db $00
	db $00
	db $80

Func_8135: ; 8135 (2:4135)
	ld hl, wcbf4
	add hl, de
	ld a, [hl]
	ld c, a
	inc a
	ld [hl], a
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, Pointers_8198
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	cp $ff
	jr z, .asm_8184
	ld a, [hl]
	ld hl, wcc9b
	add hl, de
	add [hl]
	and $3f
	ld [hl], a
	add a
	ld l, a
	ld h, $0
	add hl, bc
	push hl
	ld bc, $20
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wcc0b
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	pop hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wcc23
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	call Func_8327
	jp Func_841c

.asm_8184
	ld hl, wcbf3
	add hl, de
	inc [hl]
	ld hl, wcbf4
	add hl, de
	xor a
	ld [hl], a
	ld hl, wcc53
	add hl, de
	xor a
	ld [hl], a
	jp Func_843a

Pointers_8198: ; 8198
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8ba2, -1
	aligned_dwb Data_8ba2,  0
	aligned_dwb Data_8ba2, -1
	aligned_dwb Data_8ba2,  0
	aligned_dwb Data_8ba2, -1
	aligned_dwb Data_8ba2,  0
	aligned_dwb Data_8ba2, -1
	aligned_dwb Data_8ba2,  0
	aligned_dwb Data_8ba2, -1
	aligned_dwb Data_8ba2,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_89c2, -1
	aligned_dwb Data_89c2,  0
	aligned_dwb Data_89c2, -1
	aligned_dwb Data_89c2,  0
	aligned_dwb Data_89c2, -1
	aligned_dwb Data_89c2,  0
	aligned_dwb Data_89c2, -1
	aligned_dwb Data_89c2,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_8a62, -1
	aligned_dwb Data_8a62,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb Data_8b02, -1
	aligned_dwb Data_8b02,  0
	aligned_dwb -1,        -1

Func_828c: ; 828c (2:428c)
	ld hl, wcc0c
	add hl, de
	ld a, [hl]
	ld [hFF8A], a
	ld hl, wcc24
	add hl, de
	ld a, [hl]
	ld [hFF8B], a
	ld a, $6d
	ld [hFF8C], a
	call Func_8371
	add $10
	ld [hFF8D], a
	push de
	call Func_8443
	pop de
	add a
	ld c, a
	ld b, $0
	ld hl, Data_8c62 + 1
	add hl, bc
	ld a, [hl]
	ld hl, Data_8c42 + 1
	add hl, bc
	ld c, [hl]
	ld b, a
	ld hl, wcc0b
	add hl, de
	ld a, [hl]
	add $0
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld b, a
	ld hl, wcc23
	add hl, de
	ld a, [hl]
	add $0
	ld [hli], a
	ld a, [hl]
	adc c
	ld [hl], a
	ld c, a
	ld h, b
	ld l, c
	call Func_8371
	add $10
	ld c, a
	ld b, $6d
	call Func_8395
	jr c, .asm_82e6
	call Func_8327
	jp Func_841c

.asm_82e6
	ld hl, wcbf3
	add hl, de
	inc [hl]
	ld hl, wcbf4
	add hl, de
	xor a
	ld [hl], a
	ld hl, wcc53
	add hl, de
	xor a
	ld [hl], a
	ld hl, wcc6b
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .asm_8311
	ld [wc900], a
	ld hl, wcbf2
	ld b, [hl]
	ld [hl], $0
	farcall Func_4cb3
	jr .asm_8324

.asm_8311
	and $c0
	cp $80
	ld a, [hl]
	and $3f
	ld [wcbf2], a
	ld a, [hl]
	ld [hFF8A], a
	farcall Func_6c8c
.asm_8324
	jp Func_843a

Func_8327: ; 8327 (2:4327)
	ld hl, wcc53
	add hl, de
	ld a, [hl]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_8353
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_833f
	ld hl, wcc53
	add hl, de
	ld [hl], a
	jr Func_8327

.asm_833f
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcc3b
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wcc53
	add hl, de
	inc [hl]
	ret

Pointers_8353: ; 8353
	dw Pointers_8369
	dw Pointers_8369
	dw Pointers_8369
	dw Pointers_836b
	dw Pointers_836b
	dw Pointers_836d
	dw Pointers_836d
	dw Pointers_836d
	dw Pointers_836f
	dw Pointers_836f
	dw 0

Pointers_8369: dw Data_9991
Pointers_836b: dw Data_9996
Pointers_836d: dw Data_999b
Pointers_836f: dw Data_99a0

Func_8371: ; 8371 (2:4371)
	ld a, [wc900]
	cp $ff
	jr nz, .asm_837b
	ld a, [wc8ff]
.asm_837b
	ld b, a
	ld a, [wc8fe]
	ld c, a
	cp b
	jr c, .asm_8389
	jr z, .asm_8389
	ld a, b
	or $80
	ld b, a
.asm_8389
	ld a, b
	sub c
	cp $7
	jr c, .asm_8391
	ld a, $6
.asm_8391
	add a
	add a
	add a
	ret

Func_8395: ; 8395 (2:4395)
	ld a, h
	sub b
	jr nc, .asm_839c
	xor $ff
	inc a
.asm_839c
	ld b, a
	ld a, l
	sub c
	jr nc, .asm_83a4
	xor $ff
	inc a
.asm_83a4
	ld c, a
	ld a, b
	cp $8
	jr nc, .asm_83b1
	ld a, c
	cp $8
	jr nc, .asm_83b1
	scf
	ret

.asm_83b1
	and a
	ret

Func_83b3: ; 83b3 (2:43b3)
	inc [hl]
	ld hl, wcc53
	add hl, de
	ld a, [hl]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_83e4
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_83db
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcc3b
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wcc53
	add hl, de
	inc [hl]
	jp Func_841c

.asm_83db
	ld hl, wcbf3
	add hl, de
	xor a
	ld [hl], a
	jp Func_843a

Pointers_83e4: ; 83e4
	dw Pointers_840e
	dw Pointers_840e
	dw Pointers_840e
	dw Pointers_8410
	dw Pointers_8410
	dw Pointers_8412
	dw Pointers_8412
	dw Pointers_8414
	dw Pointers_8414
	dw Pointers_8416
	dw Pointers_8416
	dw Pointers_8416
	dw Pointers_8418
	dw Pointers_8418
	dw Pointers_8418
	dw Pointers_841a
	dw Pointers_841a
	dw Pointers_841a
	dw Pointers_841a
	dw Pointers_841a
	dw 0

Pointers_840e: dw Data_99a6
Pointers_8410: dw Data_99b7
Pointers_8412: dw Data_99c8
Pointers_8414: dw Data_99d9
Pointers_8416: dw Data_99ea
Pointers_8418: dw Data_99fb
Pointers_841a: dw Data_9a0c

Func_841c: ; 841c (2:441c)
	ld hl, wcc6b
	add hl, de
	ld a, [hl]
	inc a
	jr z, Func_843a
	ld hl, wcc0c
	add hl, de
	ld b, [hl]
	ld hl, wcc24
	add hl, de
	ld c, [hl]
	ld hl, wcc3b
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push de
	call Func_02f8
	pop de
Func_843a: ; 843a (2:443a)
	inc e
	inc e
	ld a, e
	cp $18
	jp c, Func_808e
.asm_8442
	ret

Func_8443: ; 8443 (2:4443)
	ld a, [hFF8A]
.asm_8444
	ld b, a
.asm_8446
	ld a, [hFF8C]
	sub b
	jr nc, .asm_8453
	cp $80
	jr nc, .asm_8459
	ld a, $81
	jr .asm_8459

.asm_8453
	cp $80
	jr c, .asm_8459
	ld a, $7f
.asm_8459
	ld [hFF94], a
	ld a, [hFF8B]
	ld b, a
	ld a, [hFF8D]
	sub b
	jr nc, .asm_846b
	cp $80
	jr nc, .asm_8471
	ld a, $81
	jr .asm_8471

.asm_846b
	cp $80
	jr c, .asm_8471
	ld a, $7f
.asm_8471
	ld [hFF95], a
	ld bc, $0
	ld a, [hFF94]
	and $80
	jr z, .asm_847d
	inc c
.asm_847d
	ld a, [hFF95]
	and $80
	jr z, .asm_8485
	inc c
	inc c
.asm_8485
	ld a, c
	add a
	ld c, a
	ld hl, Pointers_8490
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_8490: ; 8490
	dw Func_8498
	dw Func_849d
	dw Func_84ae
	dw Func_84c1

Func_8498: ; 8498
	call Func_84d8
	ld e, a
	ret

Func_849d: ; 849d
	ld hl, hFF94
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	call Func_84d8
	xor $ff
	add $21
	ld e, a
	ret

Func_84ae: ; 84ae
	ld hl, hFF95
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	call Func_84d8
	xor $ff
	add $41
	and $3f
	ld e, a
	ret

Func_84c1: ; 84c1
	ld hl, hFF94
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ld hl, hFF95
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	call Func_84d8
	add $20
	ld e, a
	ret

Func_84d8: ; 84d8 (2:44d8)
	ld a, [hFF94]
	ld b, a
	ld c, $0
	ld a, [hFF95]
	ld h, a
	ld l, $0
	ld a, b
	cp h
	jr c, .asm_84f8
.asm_84e6
	ld a, c
	sub $20
	ld a, b
	sbc $0
	jr c, .asm_850a
	sra b
	rr c
	sra h
	rr l
	jr .asm_84e6

.asm_84f8
	ld a, l
	sub $20
	ld a, h
	sbc $0
	jr c, .asm_850a
	sra b
	rr c
	sra h
	rr l
	jr .asm_84f8

.asm_850a
	ld a, l
	ld l, h
	ld h, a
	sra h
	rr l
	sra h
	rr l
	sra h
	rr l
	add hl, bc
	ld b, h
	ld c, l
	ld hl, Data_8522
	add hl, bc
	ld a, [hl]
	ret

Data_8522: ; 8522
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $10, $08, $05, $03, $03, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $10, $0b, $08, $06, $05, $04, $03, $03, $03, $02, $02, $02, $02, $02, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $10, $0d, $0a, $08, $07, $06, $05, $04, $04, $03, $03, $03, $03, $02, $02, $02
	db $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $10, $0d, $0b, $09, $08, $07, $06, $05, $05, $04, $04, $04, $03, $03, $03, $03
	db $03, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $01, $01, $01, $01
	db $10, $0e, $0c, $0a, $09, $08, $07, $06, $06, $05, $05, $04, $04, $04, $04, $03
	db $03, $03, $03, $03, $03, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $10, $0e, $0d, $0b, $0a, $09, $08, $07, $07, $06, $06, $05, $05, $04, $04, $04
	db $04, $03, $03, $03, $03, $03, $03, $03, $03, $02, $02, $02, $02, $02, $02, $02
	db $10, $0f, $0d, $0c, $0b, $0a, $09, $08, $07, $07, $06, $06, $05, $05, $05, $04
	db $04, $04, $04, $04, $03, $03, $03, $03, $03, $03, $03, $03, $03, $02, $02, $02
	db $10, $0f, $0d, $0c, $0b, $0a, $09, $09, $08, $07, $07, $06, $06, $06, $05, $05
	db $05, $04, $04, $04, $04, $04, $04, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $10, $0f, $0e, $0d, $0c, $0b, $0a, $09, $09, $08, $07, $07, $07, $06, $06, $06
	db $05, $05, $05, $05, $04, $04, $04, $04, $04, $04, $03, $03, $03, $03, $03, $03
	db $10, $0f, $0e, $0d, $0c, $0b, $0a, $0a, $09, $09, $08, $08, $07, $07, $06, $06
	db $06, $05, $05, $05, $05, $05, $04, $04, $04, $04, $04, $04, $04, $03, $03, $03
	db $10, $0f, $0e, $0d, $0c, $0c, $0b, $0a, $0a, $09, $08, $08, $08, $07, $07, $06
	db $06, $06, $06, $05, $05, $05, $05, $05, $04, $04, $04, $04, $04, $04, $04, $03
	db $10, $0f, $0e, $0d, $0d, $0c, $0b, $0b, $0a, $09, $09, $08, $08, $08, $07, $07
	db $07, $06, $06, $06, $06, $05, $05, $05, $05, $05, $04, $04, $04, $04, $04, $04
	db $10, $0f, $0e, $0e, $0d, $0c, $0c, $0b, $0a, $0a, $09, $09, $08, $08, $08, $07
	db $07, $07, $06, $06, $06, $06, $05, $05, $05, $05, $05, $05, $04, $04, $04, $04
	db $10, $0f, $0f, $0e, $0d, $0c, $0c, $0b, $0b, $0a, $0a, $09, $09, $08, $08, $08
	db $07, $07, $07, $06, $06, $06, $06, $06, $05, $05, $05, $05, $05, $05, $04, $04
	db $10, $0f, $0f, $0e, $0d, $0d, $0c, $0c, $0b, $0a, $0a, $0a, $09, $09, $08, $08
	db $08, $07, $07, $07, $07, $06, $06, $06, $06, $06, $05, $05, $05, $05, $05, $05
	db $10, $0f, $0f, $0e, $0d, $0d, $0c, $0c, $0b, $0b, $0a, $0a, $09, $09, $09, $08
	db $08, $08, $07, $07, $07, $07, $06, $06, $06, $06, $06, $05, $05, $05, $05, $05
	db $10, $0f, $0f, $0e, $0e, $0d, $0d, $0c, $0c, $0b, $0b, $0a, $0a, $09, $09, $09
	db $08, $08, $08, $07, $07, $07, $07, $06, $06, $06, $06, $06, $06, $05, $05, $05
	db $10, $0f, $0f, $0e, $0e, $0d, $0d, $0c, $0c, $0b, $0b, $0a, $0a, $0a, $09, $09
	db $09, $08, $08, $08, $07, $07, $07, $07, $07, $06, $06, $06, $06, $06, $06, $05
	db $10, $0f, $0f, $0e, $0e, $0d, $0d, $0c, $0c, $0b, $0b, $0b, $0a, $0a, $0a, $09
	db $09, $09, $08, $08, $08, $08, $07, $07, $07, $07, $06, $06, $06, $06, $06, $06
	db $10, $0f, $0f, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0b, $0b, $0a, $0a, $0a, $09
	db $09, $09, $09, $08, $08, $08, $08, $07, $07, $07, $07, $07, $06, $06, $06, $06
	db $10, $10, $0f, $0f, $0e, $0e, $0d, $0d, $0c, $0c, $0b, $0b, $0b, $0a, $0a, $0a
	db $09, $09, $09, $08, $08, $08, $08, $08, $07, $07, $07, $07, $07, $06, $06, $06
	db $10, $10, $0f, $0f, $0e, $0e, $0d, $0d, $0c, $0c, $0c, $0b, $0b, $0b, $0a, $0a
	db $0a, $09, $09, $09, $08, $08, $08, $08, $08, $07, $07, $07, $07, $07, $06, $06
	db $10, $10, $0f, $0f, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0b, $0b, $0b, $0a, $0a
	db $0a, $0a, $09, $09, $09, $08, $08, $08, $08, $08, $07, $07, $07, $07, $07, $07
	db $10, $10, $0f, $0f, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0c, $0b, $0b, $0b, $0a
	db $0a, $0a, $09, $09, $09, $09, $08, $08, $08, $08, $08, $07, $07, $07, $07, $07
	db $10, $10, $0f, $0f, $0e, $0e, $0e, $0d, $0d, $0c, $0c, $0c, $0b, $0b, $0b, $0a
	db $0a, $0a, $0a, $09, $09, $09, $09, $08, $08, $08, $08, $08, $07, $07, $07, $07
	db $10, $10, $0f, $0f, $0e, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0c, $0b, $0b, $0b
	db $0a, $0a, $0a, $0a, $09, $09, $09, $09, $08, $08, $08, $08, $08, $07, $07, $07
	db $10, $10, $0f, $0f, $0e, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0c, $0b, $0b, $0b
	db $0b, $0a, $0a, $0a, $09, $09, $09, $09, $09, $08, $08, $08, $08, $08, $07, $07
	db $10, $10, $0f, $0f, $0f, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0c, $0c, $0b, $0b
	db $0b, $0a, $0a, $0a, $0a, $09, $09, $09, $09, $09, $08, $08, $08, $08, $08, $07
	db $10, $10, $0f, $0f, $0f, $0e, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0c, $0b, $0b
	db $0b, $0b, $0a, $0a, $0a, $0a, $09, $09, $09, $09, $09, $08, $08, $08, $08, $08
	db $10, $10, $0f, $0f, $0f, $0e, $0e, $0e, $0d, $0d, $0d, $0c, $0c, $0c, $0c, $0b
	db $0b, $0b, $0a, $0a, $0a, $0a, $0a, $09, $09, $09, $09, $09, $08, $08, $08, $08
	db $10, $10, $0f, $0f, $0f, $0e, $0e, $0e, $0d, $0d, $0d, $0d, $0c, $0c, $0c, $0b
	db $0b, $0b, $0b, $0a, $0a, $0a, $0a, $09, $09, $09, $09, $09, $09, $08, $08, $08

Data_8922: ; 8922
	dw  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00
	dw  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00
	dw  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00
	dw  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00
	dw  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00,  $00

Data_89c2: ; 89c2
; to do: replace with the appropriate sine wave
	dw  $00,  $00,  $10,  $20,  $30,  $30,  $40,  $50,  $50,  $60,  $60,  $70,  $70,  $70,  $70,  $70
	dw  $80,  $70,  $70,  $70,  $70,  $70,  $60,  $60,  $50,  $50,  $40,  $30,  $30,  $20,  $10,  $00
	dw  $00, -$10, -$20, -$30, -$40, -$40, -$50, -$60, -$60, -$70, -$70, -$80, -$80, -$80, -$80, -$80
	dw -$80, -$80, -$80, -$80, -$80, -$80, -$70, -$70, -$60, -$60, -$50, -$40, -$40, -$30, -$20, -$10
	dw  $00,  $00,  $10,  $20,  $30,  $30,  $40,  $50,  $50,  $60,  $60,  $70,  $70,  $70,  $70,  $70

Data_8a62: ; 8a62
	dw  $000,  $010,  $030,  $040,  $060,  $070,  $080,  $0a0
	dw  $0b0,  $0c0,  $0d0,  $0e0,  $0e0,  $0f0,  $0f0,  $0f0
	dw  $100,  $0f0,  $0f0,  $0f0,  $0e0,  $0e0,  $0d0,  $0c0
	dw  $0b0,  $0a0,  $080,  $070,  $060,  $040,  $030,  $010
	dw  $000, -$020, -$040, -$050, -$070, -$080, -$090, -$0b0
	dw -$0c0, -$0d0, -$0e0, -$0f0, -$0f0, -$100, -$100, -$100
	dw -$100, -$100, -$100, -$100, -$0f0, -$0f0, -$0e0, -$0d0
	dw -$0c0, -$0b0, -$090, -$080, -$070, -$050, -$040, -$020
	dw  $000,  $010,  $030,  $040,  $060,  $070,  $080,  $0a0
	dw  $0b0,  $0c0,  $0d0,  $0e0,  $0e0,  $0f0,  $0f0,  $0f0

Data_8b02: ; 8b02
	dw  $000,  $030,  $060,  $090,  $0c0,  $0f0,  $120,  $140
	dw  $160,  $190,  $1b0,  $1c0,  $1e0,  $1f0,  $1f0,  $200
	dw  $200,  $200,  $1f0,  $1f0,  $1e0,  $1c0,  $1b0,  $190
	dw  $160,  $140,  $120,  $0f0,  $0c0,  $090,  $060,  $030
	dw  $000, -$030, -$060, -$090, -$0c0, -$0f0, -$120, -$140
	dw -$160, -$190, -$1b0, -$1c0, -$1e0, -$1f0, -$1f0, -$200
	dw -$200, -$200, -$1f0, -$1f0, -$1e0, -$1c0, -$1b0, -$190
	dw -$160, -$140, -$120, -$0f0, -$0c0, -$090, -$060, -$030
	dw  $000,  $030,  $060,  $090,  $0c0,  $0f0,  $120,  $140
	dw  $160,  $190,  $1b0,  $1c0,  $1e0,  $1f0,  $1f0,  $200

Data_8ba2: ; 8ba2
	dw  $000,  $060,  $0c0,  $120,  $180,  $1e0,  $230,  $280
	dw  $2d0,  $310,  $350,  $380,  $3b0,  $3d0,  $3f0,  $400
	dw  $400,  $400,  $3f0,  $3d0,  $3b0,  $380,  $350,  $310
	dw  $2d0,  $280,  $230,  $1e0,  $180,  $120,  $0c0,  $060
	dw  $000, -$060, -$0c0, -$120, -$180, -$1e0, -$230, -$280
	dw -$2d0, -$310, -$350, -$380, -$3b0, -$3d0, -$3f0, -$400
	dw -$400, -$400, -$3f0, -$3d0, -$3b0, -$380, -$350, -$310
	dw -$2d0, -$280, -$230, -$1e0, -$180, -$120, -$0c0, -$060
	dw  $000,  $060,  $0c0,  $120,  $180,  $1e0,  $230,  $280
	dw  $2d0,  $310,  $350,  $380,  $3b0,  $3d0,  $3f0,  $400

Data_8c42: ; 8c42
	db $00, $00, $c0, $00, $90, $01, $50, $02
	db $10, $03, $c0, $03, $70, $04, $10, $05
	db $a0, $05, $30, $06, $a0, $06, $10, $07
	db $60, $07, $a0, $07, $e0, $07, $f0, $07

Data_8c62: ; 8c62
	db $00, $08, $f0, $07, $e0, $07, $a0, $07
	db $60, $07, $10, $07, $a0, $06, $30, $06
	db $a0, $05, $10, $05, $70, $04, $c0, $03
	db $10, $03, $50, $02, $90, $01, $c0, $00
	db $00, $00, $40, $ff, $70, $fe, $b0, $fd
	db $f0, $fc, $40, $fc, $90, $fb, $f0, $fa
	db $60, $fa, $d0, $f9, $60, $f9, $f0, $f8
	db $a0, $f8, $60, $f8, $20, $f8, $10, $f8
	db $00, $f8, $10, $f8, $20, $f8, $60, $f8
	db $a0, $f8, $f0, $f8, $60, $f9, $d0, $f9
	db $60, $fa, $f0, $fa, $90, $fb, $40, $fc
	db $f0, $fc, $b0, $fd, $70, $fe, $40, $ff
	db $00, $00, $c0, $00, $90, $01, $50, $02
	db $10, $03, $c0, $03, $70, $04, $10, $05
	db $a0, $05, $30, $06, $a0, $06, $10, $07
	db $60, $07, $a0, $07, $e0, $07, $f0, $07

Func_8ce2: ; 8ce2 (2:4ce2)
	push bc
	push de
	ld de, $0
	ld hl, wcae9
.asm_8cea
	ld a, [hli]
	and a
	jr z, .asm_8cf9
	inc hl
	inc e
	inc e
	ld a, e
	cp $20
	jr c, .asm_8cea
	pop de
	pop bc
	ret

.asm_8cf9
	xor a
	ld [hld], a
	inc a
	ld [hl], a
	ld hl, wcb09
	add hl, de
	xor a
	ld [hli], a
	ld a, [hFFAC]
	ld [hl], a
	ld a, b
	sub [hl]
	ld [hl], a
	ld hl, wcb29
	add hl, de
	xor a
	ld [hli], a
	ld a, [hFFAD]
	ld [hl], a
	ld a, c
	sub [hl]
	ld [hl], a
	pop bc
	ld hl, wcba9
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wcbc9
	add hl, de
	ld a, [wcae8]
	ld [hli], a
	ld [hl], $0
	inc a
	jr z, .asm_8d2f
	call Func_8ff4
	jr .asm_8d49

.asm_8d2f
	ld hl, wcae9
	add hl, de
	inc [hl]
	ld hl, wcb69
	add hl, de
	ld [hl], $18
	ld hl, wcb89
	add hl, de
	ld [hl], $0
	ld hl, wcba9
	add hl, de
	ld a, $8b
	ld [hli], a
	ld [hl], $70
.asm_8d49
	ld hl, Data_925e
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcb49
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	pop bc
	ret

Func_8d59: ; 8d59 (2:4d59)
	ld de, $0
Func_8d5c: ; 8d5c
	ld hl, wcae9
	add hl, de
	ld a, [hl]
	and a
	jp z, Func_91b4
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_8d71
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_8d71: ; 8d71 (2:4d71)
	dw Func_91b4
	dw Func_8d7b
	dw Func_8e04
	dw Func_8e5b
	dw Func_8f1d

Func_8d7b: ; 8d7b (2:4d7b)
	ld hl, wcaea
	add hl, de
	ld c, [hl]
	ld b, $0
	inc [hl]
	ld hl, Data_91bd
	add hl, bc
	ld a, [hl]
	cp $80
	jp z, Func_8d96
	ld hl, wcb2a
	add hl, de
	add [hl]
	ld [hl], a
	jp Func_9189

Func_8d96: ; 8d96 (2:4d96)
	ld hl, wcba9
	add hl, de
	ld a, [hl]
	cp $a6
	jr z, .asm_8dac
	call Func_1d31
	jr z, .asm_8db5
	cp $6
	jr z, .asm_8db5
	cp $f
	jr z, .asm_8db5
.asm_8dac
	ld hl, wcae9
	add hl, de
	xor a
	ld [hl], a
	jp Func_9189

.asm_8db5
	ld hl, wcae9
	add hl, de
	inc [hl]
	inc hl
	ld [hl], $0
	ld hl, wcb69
	add hl, de
	ld [hl], $20
	ld hl, wcb89
	add hl, de
	ld [hl], $0
	ld hl, wcba9
	add hl, de
	ld a, [wcea1]
	cp $6
	jr z, .asm_8df0
	cp $d
	jr nz, .asm_8deb
.soft_lock
	jr .soft_lock

.asm_8dda
	ld a, [wceac]
	cp $2
	jr z, .asm_8de6
	lb bc, $8b, $5c
	jr .asm_8df3

.asm_8de6
	lb bc, $84, $20
	jr .asm_8df3

.asm_8deb
	lb bc, $8b, $6c
	jr .asm_8df3

.asm_8df0
	lb bc, $93, $6c
.asm_8df3
	call Random
	and $7
	add b
	ld [hli], a
	call Random
	and $7
	add c
	ld [hl], a
	jp Func_9189

Func_8e04: ; 8e04 (2:4e04)
	ld hl, wcaea
	add hl, de
	ld a, [hl]
	ld c, a
	inc a
	ld [hl], a
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, Data_91e2
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	cp $ff
	jr z, .asm_8e53
	ld a, [hl]
	ld hl, wcb69
	add hl, de
	add [hl]
	and $3f
	ld [hl], a
	add a
	ld l, a
	ld h, $0
	add hl, bc
	push hl
	ld bc, $20
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wcb09
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	pop hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wcb29
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	call Func_90c6
	jp Func_9196

.asm_8e53
	ld hl, wcae9
	add hl, de
	inc [hl]
	jp Func_9196

Func_8e5b: ; 8e5b (2:4e5b)
	ld hl, wcb0a
	add hl, de
	ld a, [hl]
	add $50
	ld [hFF8A], a
	ld hl, wcb2a
	add hl, de
	ld a, [hl]
	add $40
	ld [hFF8B], a
	ld hl, wcba9
	add hl, de
	ld a, [hli]
	add $50
	ld [hFF8C], a
	ld a, [hl]
	add $40
	ld [hFF8D], a
	push de
	call Func_8443
	pop de
	add a
	ld c, a
	ld b, $0
	ld hl, Data_8c62 + 1
	add hl, bc
	ld a, [hl]
	ld hl, Data_8c42 + 1
	add hl, bc
	ld c, [hl]
	ld b, a
	ld hl, wcb09
	add hl, de
	ld a, [hl]
	add $0
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld b, a
	ld hl, wcb29
	add hl, de
	ld a, [hl]
	add $0
	ld [hli], a
	ld a, [hl]
	adc c
	ld [hl], a
	ld c, a
	push bc
	ld hl, wcba9
	add hl, de
	ld a, [hli]
	ld c, [hl]
	ld b, a
	pop hl
	call Func_8395
	jr c, .asm_8ebb
	call Func_90c6
	jp Func_9196

.asm_8ebb
	ld hl, wcae9
	add hl, de
	inc [hl]
	ld hl, wcb89
	add hl, de
	ld [hl], $0
	ld hl, wcba9
	add hl, de
	ld a, [hli]
	ld c, [hl]
	ld b, a
	ld hl, wcb09
	add hl, de
	xor a
	ld [hli], a
	ld [hl], b
	ld hl, wcb29
	add hl, de
	xor a
	ld [hli], a
	ld [hl], c
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	inc a
	jr z, .asm_8f1a
	ld a, [wcea1]
	cp $5
	jr z, .asm_8f12
	cp $d
.asm_8eec
	jr z, .asm_8eec
	cp $f
	jr z, .asm_8f17
	jr .asm_8f1a

.asm_8ef4
	ld a, $1
	ld [wcd3e], a
	ld [wcd40], a
	ld hl, wcb0a
	add hl, de
	ld b, [hl]
	ld hl, wcb2a
	add hl, de
	ld c, [hl]
	push de
	ld d, $0
	ld e, $2
	farcall Func_429eb
	pop de
.asm_8f12
	call Func_9097
	jr .asm_8f1a

.asm_8f17
	call Func_8f47
.asm_8f1a
	jp Func_9196

Func_8f1d: ; 8f1d (2:4f1d)
	call Func_9129
	jp nc, Func_9196
	call Func_1d25
	jr z, .asm_8f3e
	cp $f
	jr z, .asm_8f3e
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	ld [hFF8A], a
	ld a, [wc894]
	add a
	add a
	add a
	ld [hFF8B], a
	call Func_1f12
.asm_8f3e
	ld hl, wcae9
	add hl, de
	xor a
	ld [hl], a
	jp Func_9196

Func_8f47: ; 8f47 (2:4f47)
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	bit 7, a
	jr nz, .asm_8f72
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	add $4
	ld c, a
	farcall Func_67b8
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	add $4
	cp $9
	jr c, .asm_8f91
	cp $d
	jr c, .asm_8fa9
	jr .asm_8fc1

.asm_8f72
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	and $3f
	ld c, a
	farcall Func_683b
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	and $3f
	cp $1
	jr c, .asm_8f91
	cp $2
	jr c, .asm_8fa9
	jr .asm_8fc1

.asm_8f91
	ld a, $0
	ld [wcd36], a
	farcall Func_424b0
	ld a, [wc7ce]
	and a
	jr nz, .asm_8fa7
	ld a, $18
	ld [wc7cd], a
.asm_8fa7
	jr .asm_8fd7

.asm_8fa9
	ld a, $1
	ld [wcd36], a
	farcall Func_424b0
	ld a, [wc7ce]
	and a
	jr nz, .asm_8fbf
	ld a, $18
	ld [wc7cd], a
.asm_8fbf
	jr .asm_8fd7

.asm_8fc1
	ld a, $2
	ld [wcd36], a
	farcall Func_424b0
	ld a, [wc7ce]
	and a
	jr nz, .asm_8fd7
	ld a, $18
	ld [wc7cd], a
.asm_8fd7
	ld a, $1
	ld [wcd3e], a
	ld hl, wcd3c
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	ret

Func_8fe6: ; 8fe6
; unsigned short hl = (unsigned char)a * 48
	ld l, a
	ld h, $0
	push bc
	ld c, l
	ld b, h
	add hl, hl ; 2
	add hl, bc ; 3
	add hl, hl ; 6
	add hl, hl ; 12
	add hl, hl ; 24
	add hl, hl ; 48
	pop bc
	ret

Func_8ff4: ; 8ff4 (2:4ff4)
	push hl
	push bc
	ld a, [wc7ce]
	and a
	jr nz, .asm_9045
	ld a, $1
	ld [wc89f], a
	ld a, [wceb8]
	and a
	jr nz, .asm_9027
	ld a, [wcea3]
	call Func_8fe6
	ld bc, Data_101351
	add hl, bc
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld c, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld b, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld [bc], a
	jr .asm_9045

.asm_9027
	ld a, [wcea3]
	call Func_8fe6
	ld bc, Data_101351 + 3
	add hl, bc
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld c, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld b, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld [bc], a
.asm_9045
	pop bc
	pop hl
	ret

Func_9048: ; 9048 (2:5048)
	push hl
	push bc
	ld a, [wc7ce]
	and a
	jr nz, .asm_9094
	ld a, [wceb8]
	and a
	jr nz, .asm_9076
	ld a, [wcea4]
	call Func_8fe6
	ld bc, Data_101351
	add hl, bc
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld c, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld b, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld [bc], a
	jr .asm_9094

.asm_9076
	ld a, [wcea4]
	call Func_8fe6
	ld bc, Data_101351 + 3
	add hl, bc
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld c, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld b, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld [bc], a
.asm_9094
	pop bc
	pop hl
	ret

Func_9097: ; 9097 (2:5097)
	push hl
	push bc
	farcall Func_424b0
	ld a, [wc7ce]
	and a
	jr nz, .asm_90c3
	ld a, [wcea3]
	call Func_8fe6
	ld bc, Data_101351 + 6
	add hl, bc
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld c, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld b, a
	inc hl
	ld a, BANK(Data_101351)
	call GetFarByteHL
	ld [bc], a
.asm_90c3
	pop bc
	pop hl
	ret

Func_90c6: ; 90c6 (2:50c6)
	ld hl, wcb89
	add hl, de
	ld a, [hl]
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_90ef
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_90de
	ld hl, wcb89
	add hl, de
	ld [hl], a
	jr Func_90c6

.asm_90de
	dec hl
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcb49
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wcb89
	add hl, de
	inc [hl]
	ret

Pointers_90ef: ; 90ef
	dw Data_9a3f
	dw Data_9a3f
	dw Data_9a50
	dw Data_9a50
	dw Data_9a61
	dw Data_9a61
	dw Data_9a72
	dw Data_9a72
	dw Data_9a83
	dw Data_9a83
	dw Data_9a94
	dw Data_9a94
	dw Data_9aa5
	dw Data_9aa5
	dw Data_9ab6
	dw Data_9ab6
	dw Data_9ac7
	dw Data_9ac7
	dw Data_9ad8
	dw Data_9ad8
	dw Data_9ae9
	dw Data_9ae9
	dw Data_9afa
	dw Data_9afa
	dw Data_9b0b
	dw Data_9b0b
	dw Data_9b1c
	dw Data_9b1c
	dw 0

Func_9129: ; 9129 (2:5129)
	ld hl, wcb89
	add hl, de
	ld a, [hl]
	add a
	ld c, a
	ld b, $0
	ld hl, $5151
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_913c
	scf
	ret

.asm_913c
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcb49
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wcb89
	add hl, de
	inc [hl]
	and a
	ret

Pointers_9151: ; 9151
	dw Pointers_917b
	dw Pointers_917b
	dw Pointers_917b
	dw Pointers_917d
	dw Pointers_917d
	dw Pointers_917f
	dw Pointers_917f
	dw Pointers_9181
	dw Pointers_9181
	dw Pointers_9183
	dw Pointers_9183
	dw Pointers_9183
	dw Pointers_9185
	dw Pointers_9185
	dw Pointers_9185
	dw Pointers_9187
	dw Pointers_9187
	dw Pointers_9187
	dw Pointers_9187
	dw Pointers_9187
	dw 0

Pointers_917b: ; 917b
	dw Data_99a6
Pointers_917d: ; 917d
	dw Data_99b7
Pointers_917f: ; 917f
	dw Data_99c8
Pointers_9181: ; 9181
	dw Data_99d9
Pointers_9183: ; 9183
	dw Data_99ea
Pointers_9185: ; 9185
	dw Data_99fb
Pointers_9187: ; 9187
	dw Data_9a0c

Func_9189: ; 9189 (2:5189)
	ld a, [wceb2]
	and a
	jr z, Func_9196
	ld a, [wc877]
	and $1
	jr nz, Func_91b4
Func_9196: ; 9196 (2:5196)
	ld hl, wcbc9
	add hl, de
	ld a, [hl]
	inc a
	jr z, Func_91b4
	ld hl, wcb0a
	add hl, de
	ld b, [hl]
	ld hl, wcb2a
	add hl, de
	ld c, [hl]
	ld hl, wcb49
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push de
	call Func_02f8
	pop de
Func_91b4: ; 91b4 (2:51b4)
	inc e
	inc e
	ld a, e
	cp $20
	jp c, Func_8d5c
	ret

Data_91bd: ; 91bd
	db -1, -1, -1, -1
	db  0, -1,  0, -1
	db  0,  0, -1,  0
	db -1,  0,  0, -1
	db  0,  0,  0,  0
	db -1,  0,  0,  0
	db  0,  0,  0,  0
	db  0,  0,  0,  0
	db  0,  0, -1,  0
	db $80

Data_91e2: ; 91e2
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8922,  0
	aligned_dwb Data_8ba2,  1
	aligned_dwb Data_8ba2,  1
	aligned_dwb Data_8ba2,  1
	aligned_dwb Data_8ba2,  1
	aligned_dwb Data_8ba2,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_89c2,  1
	aligned_dwb Data_89c2,  1
	aligned_dwb Data_89c2,  1
	aligned_dwb Data_89c2,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_8a62,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb Data_8b02,  1
	aligned_dwb -1,        -1

Data_925e: ; 925e
	dw Data_93ec
	dw Data_93fd
	dw Data_940e
	dw Data_941f
	dw Data_9430
	dw Data_9441
	dw Data_9452
	dw Data_9463
	dw Data_9474
	dw Data_9485
	dw Data_9496
	dw Data_94a7
	dw Data_94b8
	dw Data_94c9
	dw Data_94da
	dw Data_94eb
	dw Data_94fc
	dw Data_950d
	dw Data_951e
	dw Data_952f
	dw Data_9540
	dw Data_9551
	dw Data_9562
	dw Data_9573
	dw Data_9584
	dw Data_9595
	dw Data_95a6
	dw Data_95b7
	dw Data_95c8
	dw Data_95d9
	dw Data_95ea
	dw Data_95fb
	dw Data_960c
	dw Data_961d
	dw Data_962e
	dw Data_963f
	dw Data_9650
	dw Data_9661
	dw Data_9672
	dw Data_9683
	dw Data_9694
	dw Data_96a5
	dw Data_96b6
	dw Data_96c7
	dw Data_96d8
	dw Data_96e9
	dw Data_96fa
	dw Data_970b
	dw Data_971c
	dw Data_972d
	dw Data_973e
	dw Data_974f
	dw Data_9761
	dw Data_9772
	dw Data_9783
	dw Data_9794
	dw Data_97a5
	dw Data_97b6
	dw Data_97c7
	dw Data_97d8
	dw Data_97e9
	dw Data_97fa
	dw Data_980b
	dw Data_981c
	dw Data_982d
	dw Data_983e
	dw Data_984f
	dw Data_9860
	dw Data_9871
	dw Data_9882
	dw Data_9893
	dw Data_98a4
	dw Data_98b5
	dw Data_98c6
	dw Data_98d7
	dw Data_98e8
	dw Data_98f9
	dw Data_990a
	dw Data_991b
	dw Data_992c
	dw Data_993d
	dw Data_994e
	dw Data_995f
	dw Data_9970

Func_9306:: ; 9306
	ld a, [wcea1]
	cp $2
	jr z, .asm_9312
	cp $8
	jr z, .asm_9312
	ret

.asm_9312
	ld hl, wc8eb
	ld c, [hl]
	ld b, $0
	inc [hl]
	ld hl, .Data_9328
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_934d
	xor a
	ld [wc8eb], a
	jr .asm_9312

.Data_9328: ; 9328
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $01, $01, $01
	db $ff

.asm_934d
	ld [wc8ea], a
	and a
	jr nz, .asm_937c
	ld a, [wcea1]
	cp $8
	jr nz, .asm_937c
	ld b, $6c
	ld a, [wcdab]
	cp $b0
	jr nc, .asm_937c
	sub $10
	and a
	rr a
	add $4a
	ld c, a
	ld hl, .Data_9373
	call Func_02f8
	jr .asm_937c

.Data_9373:
	db $02, $00, $00
	db $46, $08, $00
	db $08, $47, $08

.asm_937c
	ld hl, wc8e2
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wc8e4
	ld a, [hli]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	cp $a
	jr c, .asm_9395
	ld a, $ff
	ld [wc8e6], a
	ret

.asm_9395
	ld h, b
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, h
	ld [wc8e6], a
.asm_939f
	ld a, [wc8e9]
	ld c, a
	ld b, $0
	ld hl, Data_93e5
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_93b4
	xor a
	ld [wc8e9], a
	jr .asm_939f

.asm_93b4
	ld e, a
	ld hl, wc8e8
	ld a, [hl]
	inc a
	cp e
	jr nz, .asm_93c5
	ld a, [wc8e9]
	inc a
	ld [wc8e9], a
	xor a
.asm_93c5
	ld [hl], a
	ld a, [wcea1]
	cp $8
	ret z
	ld a, [wc8e9]
	and $1
	jr nz, .asm_93d8
	ld hl, Data_9a1d
	jr .asm_93db

.asm_93d8
	ld hl, Data_9a2e
.asm_93db
	ld a, [wc8e6]
	ld c, a
	ld b, $68
	call Func_02f8
	ret

Data_93e5: ; 93e5
	db $80, $04, $06
	db $03, $05, $02
	db $ff

Data_93ec: ; 93ec
	db 4
	db  $00,  $00, $08, $02
	db  $00,  $08, $09, $02
	db  $08,  $00, $0a, $02
	db  $08,  $08, $0b, $02

Data_93fd: ; 93fd
	db 4
	db  $00,  $00, $0c, $02
	db  $00,  $08, $0d, $02
	db  $08,  $00, $0e, $02
	db  $08,  $08, $0f, $02

Data_940e: ; 940e
	db 4
	db  $00,  $00, $30, $02
	db  $00,  $08, $31, $02
	db  $08,  $00, $37, $02
	db  $08,  $08, $0f, $02

Data_941f: ; 941f
	db 4
	db  $00,  $00, $32, $02
	db  $00,  $08, $33, $02
	db  $08,  $00, $38, $02
	db  $08,  $08, $39, $02

Data_9430: ; 9430
	db 4
	db  $00,  $00, $34, $22
	db  $00,  $08, $34, $02
	db  $08,  $00, $3a, $22
	db  $08,  $08, $3a, $02

Data_9441: ; 9441
	db 4
	db  $00,  $00, $35, $02
	db  $00,  $08, $36, $02
	db  $08,  $00, $3b, $02
	db  $08,  $08, $3c, $02

Data_9452: ; 9452
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $1a, $02
	db  $08,  $08, $2a, $02

Data_9463: ; 9463
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $11, $02
	db  $08,  $08, $21, $02

Data_9474: ; 9474
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $12, $02
	db  $08,  $08, $22, $02

Data_9485: ; 9485
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $13, $02
	db  $08,  $08, $23, $02

Data_9496: ; 9496
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $14, $02
	db  $08,  $08, $24, $02

Data_94a7: ; 94a7
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $15, $02
	db  $08,  $08, $25, $02

Data_94b8: ; 94b8
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $16, $02
	db  $08,  $08, $26, $02

Data_94c9: ; 94c9
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $17, $02
	db  $08,  $08, $27, $02

Data_94da: ; 94da
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $18, $02
	db  $08,  $08, $28, $02

Data_94eb: ; 94eb
	db 4
	db  $00,  $00, $1e, $02
	db  $08,  $00, $2e, $02
	db  $00,  $08, $19, $02
	db  $08,  $08, $29, $02

Data_94fc: ; 94fc
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $1a, $02
	db  $08,  $08, $2a, $02

Data_950d: ; 950d
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $11, $02
	db  $08,  $08, $21, $02

Data_951e: ; 951e
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $12, $02
	db  $08,  $08, $22, $02

Data_952f: ; 952f
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $13, $02
	db  $08,  $08, $23, $02

Data_9540: ; 9540
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $14, $02
	db  $08,  $08, $24, $02

Data_9551: ; 9551
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $15, $02
	db  $08,  $08, $25, $02

Data_9562: ; 9562
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $16, $02
	db  $08,  $08, $26, $02

Data_9573: ; 9573
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $17, $02
	db  $08,  $08, $27, $02

Data_9584: ; 9584
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $18, $02
	db  $08,  $08, $28, $02

Data_9595: ; 9595
	db 4
	db  $00,  $00, $1f, $02
	db  $08,  $00, $2f, $02
	db  $00,  $08, $19, $02
	db  $08,  $08, $29, $02

Data_95a6: ; 95a6
	db 4
	db  $08,  $00, $03, $02
	db  $00,  $00, $02, $02
	db  $00,  $08, $1a, $02
	db  $08,  $08, $2a, $02

Data_95b7: ; 95b7
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $11, $02
	db  $08,  $08, $21, $02

Data_95c8: ; 95c8
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $12, $02
	db  $08,  $08, $22, $02

Data_95d9: ; 95d9
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $13, $02
	db  $08,  $08, $23, $02

Data_95ea: ; 95ea
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $14, $02
	db  $08,  $08, $24, $02

Data_95fb: ; 95fb
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $15, $02
	db  $08,  $08, $25, $02

Data_960c: ; 960c
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $16, $02
	db  $08,  $08, $26, $02

Data_961d: ; 961d
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $17, $02
	db  $08,  $08, $27, $02

Data_962e: ; 962e
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $18, $02
	db  $08,  $08, $28, $02

Data_963f: ; 963f
	db 4
	db  $00,  $00, $02, $02
	db  $08,  $00, $03, $02
	db  $00,  $08, $19, $02
	db  $08,  $08, $29, $02

Data_9650: ; 9650
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $1a, $02
	db  $08,  $08, $2a, $02

Data_9661: ; 9661
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $11, $02
	db  $08,  $08, $21, $02

Data_9672: ; 9672
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $12, $02
	db  $08,  $08, $22, $02

Data_9683: ; 9683
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $13, $02
	db  $08,  $08, $23, $02

Data_9694: ; 9694
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $14, $02
	db  $08,  $08, $24, $02

Data_96a5: ; 96a5
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $15, $02
	db  $08,  $08, $25, $02

Data_96b6: ; 96b6
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $16, $02
	db  $08,  $08, $26, $02

Data_96c7: ; 96c7
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $17, $02
	db  $08,  $08, $27, $02

Data_96d8: ; 96d8
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $18, $02
	db  $08,  $08, $28, $02

Data_96e9: ; 96e9
	db 4
	db  $00,  $00, $04, $02
	db  $08,  $00, $05, $02
	db  $00,  $08, $19, $02
	db  $08,  $08, $29, $02

Data_96fa: ; 96fa
	db 4
	db  $00,  $00, $06, $02
	db  $08,  $00, $07, $02
	db  $00,  $08, $1a, $02
	db  $08,  $08, $2a, $02

Data_970b: ; 970b
	db 4
	db  $00,  $00, $06, $02
	db  $08,  $00, $07, $02
	db  $00,  $08, $11, $02
	db  $08,  $08, $21, $02

Data_971c: ; 971c
	db 4
	db  $00,  $00, $06, $02
	db  $08,  $00, $07, $02
	db  $00,  $08, $12, $02
	db  $08,  $08, $22, $02

Data_972d: ; 972d
	db 4
	db  $00,  $00, $06, $02
	db  $08,  $00, $07, $02
	db  $00,  $08, $13, $02
	db  $08,  $08, $23, $02

Data_973e: ; 973e
	db 4
	db  $00,  $00, $06, $02
	db  $08,  $00, $07, $02
	db  $00,  $08, $14, $02
	db  $08,  $08, $24, $02

Data_974f: ; 974f
	db 4
	db  $00,  $00, $3d, $02
	db  $00,  $08, $3e, $02
	db  $08,  $00, $3f, $22
	db  $08,  $08, $3f, $02

Data_9760: ; 9760
	db 0

Data_9761: ; 9761
	db 4
	db  $00,  $00, $10, $01
	db  $00,  $08, $11, $01
	db  $08,  $00, $20, $01
	db  $08,  $08, $21, $01

Data_9772: ; 9772
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $12, $01
	db  $08,  $08, $22, $01

Data_9783: ; 9783
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $13, $01
	db  $08,  $08, $23, $01

Data_9794: ; 9794
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $14, $01
	db  $08,  $08, $24, $01

Data_97a5: ; 97a5
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $15, $01
	db  $08,  $08, $25, $01

Data_97b6: ; 97b6
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $16, $01
	db  $08,  $08, $26, $01

Data_97c7: ; 97c7
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $17, $01
	db  $08,  $08, $27, $01

Data_97d8: ; 97d8
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $18, $01
	db  $08,  $08, $28, $01

Data_97e9: ; 97e9
	db 4
	db  $00,  $00, $10, $01
	db  $08,  $00, $20, $01
	db  $00,  $08, $19, $01
	db  $08,  $08, $29, $01

Data_97fa: ; 97fa
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $1a, $01
	db  $08,  $08, $2a, $01

Data_980b: ; 980b
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $11, $01
	db  $08,  $08, $21, $01

Data_981c: ; 981c
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $12, $01
	db  $08,  $08, $22, $01

Data_982d: ; 982d
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $13, $01
	db  $08,  $08, $23, $01

Data_983e: ; 983e
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $14, $01
	db  $08,  $08, $24, $01

Data_984f: ; 984f
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $15, $01
	db  $08,  $08, $25, $01

Data_9860: ; 9860
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $16, $01
	db  $08,  $08, $26, $01

Data_9871: ; 9871
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $17, $01
	db  $08,  $08, $27, $01

Data_9882: ; 9882
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $18, $01
	db  $08,  $08, $28, $01

Data_9893: ; 9893
	db 4
	db  $00,  $00, $1b, $01
	db  $08,  $00, $2b, $01
	db  $00,  $08, $19, $01
	db  $08,  $08, $29, $01

Data_98a4: ; 98a4
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $1a, $01
	db  $08,  $08, $2a, $01

Data_98b5: ; 98b5
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $11, $01
	db  $08,  $08, $21, $01

Data_98c6: ; 98c6
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $12, $01
	db  $08,  $08, $22, $01

Data_98d7: ; 98d7
	db 4
	db  $00,  $08, $13, $01
	db  $08,  $08, $23, $01
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01

Data_98e8: ; 98e8
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $14, $01
	db  $08,  $08, $24, $01

Data_98f9: ; 98f9
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $15, $01
	db  $08,  $08, $25, $01

Data_990a: ; 990a
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $16, $01
	db  $08,  $08, $26, $01

Data_991b: ; 991b
	db 4
	db  $00,  $08, $17, $01
	db  $08,  $08, $27, $01
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01

Data_992c: ; 992c
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $18, $01
	db  $08,  $08, $28, $01

Data_993d: ; 993d
	db 4
	db  $08,  $00, $6e, $01
	db  $00,  $00, $47, $01
	db  $00,  $08, $19, $01
	db  $08,  $08, $29, $01

Data_994e: ; 994e
	db 4
	db  $00,  $00, $1c, $01
	db  $00,  $08, $1d, $01
	db  $08,  $08, $2d, $01
	db  $08,  $00, $20, $01

Data_995f: ; 995f
	db 4
	db  $00,  $00, $6f, $00
	db  $08,  $00, $7e, $00
	db  $00,  $08, $6f, $20
	db  $08,  $08, $7e, $20

Data_9970: ; 9970
	db 8
	db  $00,  $00, $48, $02
	db  $00,  $08, $49, $02
	db  $00,  $10, $4a, $02
	db  $00,  $18, $4b, $02
	db  $08,  $00, $4c, $02
	db  $08,  $08, $4d, $02
	db  $08,  $10, $4e, $02
	db  $08,  $18, $4f, $02

Data_9991: ; 9991
	db 1
	db  $04,  $05, $5a, $01

Data_9996: ; 9996
	db 1
	db  $04,  $05, $5b, $00

Data_999b: ; 999b
	db 1
	db  $05,  $05, $5a, $41

Data_99a0: ; 99a0
	db 1
	db  $05,  $04, $5b, $60

Data_99a5: ; 99a5
	db 0

Data_99a6: ; 99a6
	db 4
	db -$08, -$08, $56, $60
	db -$08,  $00, $56, $40
	db  $00, -$08, $56, $20
	db  $00,  $00, $56, $00

Data_99b7: ; 99b7
	db 4
	db  $02,  $02, $56, $00
	db -$0a,  $02, $56, $40
	db -$0a, -$0a, $56, $60
	db  $02, -$0a, $56, $20

Data_99c8: ; 99c8
	db 4
	db  $03,  $03, $57, $00
	db -$0b,  $03, $57, $40
	db -$0b, -$0b, $57, $60
	db  $03, -$0b, $57, $20

Data_99d9: ; 99d9
	db 4
	db  $04,  $04, $57, $00
	db -$0c,  $04, $57, $40
	db -$0c, -$0c, $57, $60
	db  $04, -$0c, $57, $20

Data_99ea: ; 99ea
	db 4
	db  $05,  $05, $58, $00
	db -$0d,  $05, $58, $40
	db  $05, -$0d, $58, $20
	db -$0d, -$0d, $58, $60

Data_99fb: ; 99fb
	db 4
	db  $06,  $06, $58, $00
	db -$0e,  $06, $58, $40
	db  $06, -$0e, $58, $20
	db -$0e, -$0e, $58, $60

Data_9a0c: ; 9a0c
	db 4
	db  $07,  $07, $59, $00
	db -$0f,  $07, $59, $40
	db  $07, -$0f, $59, $20
	db -$0f, -$0f, $59, $60

Data_9a1d: ; 9a1d
	db 4
	db -$07,  $00, $5c, $00
	db -$07,  $08, $5d, $00
	db -$07,  $10, $5e, $00
	db -$07,  $18, $5f, $00

Data_9a2e: ; 9a2e
	db 4
	db -$07,  $00, $5c, $02
	db -$07,  $08, $5d, $02
	db -$07,  $10, $5e, $02
	db -$07,  $18, $5f, $02

Data_9a3f: ; 9a3f
	db 4
	db  $00,  $00, $20, $0f
	db  $00,  $08, $21, $0f
	db  $08,  $00, $30, $0f
	db  $08,  $08, $31, $0f

Data_9a50: ; 9a50
	db 4
	db  $00,  $00, $22, $08
	db  $00,  $08, $23, $08
	db  $08,  $00, $32, $08
	db  $08,  $08, $33, $08

Data_9a61: ; 9a61
	db 4
	db  $00,  $00, $24, $0f
	db  $00,  $08, $25, $0f
	db  $08,  $00, $34, $0f
	db  $08,  $08, $35, $0f

Data_9a72: ; 9a72
	db 4
	db  $00,  $00, $26, $08
	db  $00,  $08, $27, $08
	db  $08,  $00, $36, $08
	db  $08,  $08, $37, $08

Data_9a83: ; 9a83
	db 4
	db  $00,  $00, $28, $0f
	db  $00,  $08, $29, $0f
	db  $08,  $00, $38, $0f
	db  $08,  $08, $39, $0f

Data_9a94: ; 9a94
	db 4
	db  $00,  $08, $24, $28
	db  $00,  $00, $25, $28
	db  $08,  $08, $34, $28
	db  $08,  $00, $35, $28

Data_9aa5: ; 9aa5
	db 4
	db  $00,  $08, $22, $2f
	db  $00,  $00, $23, $2f
	db  $08,  $08, $32, $2f
	db  $08,  $00, $33, $2f

Data_9ab6: ; 9ab6
	db 4
	db  $00,  $00, $20, $08
	db  $00,  $08, $21, $08
	db  $08,  $00, $30, $08
	db  $08,  $08, $31, $08

Data_9ac7: ; 9ac7
	db 4
	db  $00,  $00, $22, $0f
	db  $00,  $08, $23, $0f
	db  $08,  $00, $32, $0f
	db  $08,  $08, $33, $0f

Data_9ad8: ; 9ad8
	db 4
	db  $00,  $00, $24, $08
	db  $00,  $08, $25, $08
	db  $08,  $00, $34, $08
	db  $08,  $08, $35, $08

Data_9ae9: ; 9ae9
	db 4
	db  $00,  $00, $26, $0f
	db  $00,  $08, $27, $0f
	db  $08,  $00, $36, $0f
	db  $08,  $08, $37, $0f

Data_9afa: ; 9afa
	db 4
	db  $00,  $00, $28, $08
	db  $00,  $08, $29, $08
	db  $08,  $00, $38, $08
	db  $08,  $08, $39, $08

Data_9b0b: ; 9b0b
	db 4
	db  $00,  $08, $24, $2f
	db  $00,  $00, $25, $2f
	db  $08,  $08, $34, $2f
	db  $08,  $00, $35, $2f

Data_9b1c: ; 9b1c
	db 4
	db  $00,  $08, $22, $28
	db  $00,  $00, $23, $28
	db  $08,  $08, $32, $28
	db  $08,  $00, $33, $28

Func_9b2d: ; 9b2d
	ld a, [wceab]
	call Func_0180
	dab Func_10130e
	ld [wcd08], a
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_a028
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, l
	ld [wcd09], a
	ld a, h
	ld [wcd0a], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcea5]
	; * 18
	ld c, a
	add a
	add a
	add a
	add c
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [wcd0b], a
	ld [wcd0d], a
	ld [wcd0f], a
	ld a, [hli]
	ld [wcd0c], a
	ld [wcd0e], a
	ld [wcd10], a
	ld a, [hli]
	ld [wcd13], a
	ld a, [hli]
	ld [wcd14], a
	ld a, [hli]
	ld [wcd11], a
	ld a, [hli]
	ld [wcd12], a
	ld a, [hli]
	ld [wcd15], a
	ld a, [hli]
	ld [wcd16], a
	ld a, [hli]
	ld [wcd17], a
	ld a, [hli]
	ld [wcd18], a
	ld a, [hli]
	ld [wcd19], a
	ld [wcd1b], a
	ld a, [hli]
	ld [wcd1a], a
	ld [wcd1c], a
	ld a, [hli]
	ld [wcd1d], a
	ld a, [hli]
	ld [wcd1e], a
	ld a, [hli]
	ld [wcd1f], a
	ld a, [hli]
	ld [wcd20], a
	ld a, [hli]
	ld [wcd28], a
	ld [wcd2a], a
	ld a, [hli]
	ld [wcd29], a
	ld [wcd2b], a
	xor a
	ld [wcd21], a
	ld [wcd22], a
	ld [wcd23], a
	ld [wcd24], a
	ld [wcd25], a
	xor a
	ld [wcd26], a
	ld [wcd27], a
	ld [wcd2c], a
	ld [wcd2d], a
	ld [wcd2e], a
	xor a
	ld [wcd2f], a
	ld [wcd30], a
	ld [wcd31], a
	ld [wcd32], a
	ld [wcd34], a
	ld hl, wcd0d
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld bc, $0
.asm_9bf5
	ld a, e
	sub $9
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_9c02
	inc bc
	jr .asm_9bf5

.asm_9c02
	ld hl, wcd44
	ld a, c
	ld [hli], a
	ld [hl], b
	ld de, $0
.asm_9c0b
	ld a, c
	sub $8
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	jr c, .asm_9c18
	inc de
	jr .asm_9c0b

.asm_9c18
	ld hl, wcd42
	ld a, e
	ld [hli], a
	ld [hl], d
	call Func_9fd7
	ret

Func_9c22: ; 9c22 (2:5c22)
	call Func_1d31
	ret nz
	call Func_9c30
	call Func_9e57
	call Func_9f22
	ret

Func_9c30: ; 9c30 (2:5c30)
	xor a
	ld [wcd2f], a
	call Func_9fd7
Func_9c37: ; 9c37 (2:5c37)
	ld hl, wcd2c
	ld a, [hli]
	or [hl]
	jp z, Func_9d13
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld c, l
	ld b, h
	inc bc
	ld a, [hl]
	dec a
	jp z, Func_9c65
	dec a
	jp z, Func_9c9f
	dec a
	jp z, Func_9ccc
	dec a
	jp z, Func_9ce0
	dec a
	jp z, Func_9cf0
	dec a
	jp z, Func_9ce7
	ld a, [bc]
	ld [wcd2f], a
	jp Func_9d08

Func_9c65: ; 9c65 (2:5c65)
	ld a, [wcd30]
	and a
	jp nz, Func_9d08
	ld a, [bc]
	and $7f
	ld [wcd30], a
	xor a
	ld [wcd31], a
	ld [wcd34], a
	call Func_9ef5
	ld hl, wcd09
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $c
	add hl, de
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcea5]
	add a
	add a
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld c, l
	ld b, h
	ld hl, wcd32
	ld a, c
	ld [hli], a
	ld [hl], b
	jp Func_9d08

Func_9c9f: ; 9c9f (2:5c9f)
	ld hl, wcd11
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wcd0b
	ld a, [hli]
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a
	ld a, [wcd0d]
	sub e
	ld a, [wcd0e]
	sbc d
	jr nc, .asm_9cc0
	ld a, [wcd0d]
	ld e, a
	ld a, [wcd0e]
	ld d, a
.asm_9cc0
	ld a, e
	ld [hli], a
	ld [hl], d
	ld hl, wcd0f
	ld a, e
	ld [hli], a
	ld [hl], d
	jp Func_9cfa

Func_9ccc: ; 9ccc (2:5ccc)
	ld hl, wcd2e
	ld a, [hl]
	and a
	jr nz, .asm_9cd9
	ld a, [bc]
	and a
	jr nz, .asm_9cd8
	inc a
.asm_9cd8
	ld [hl], a
.asm_9cd9
	dec [hl]
	jp nz, Func_9d13
	jp Func_9cfa

Func_9ce0: ; 9ce0 (2:5ce0)
	ld a, [wcd30]
	and a
	jp nz, Func_9d13
Func_9ce7: ; 9ce7 (2:5ce7)
	ld hl, wcd2c
	xor a
	ld [hli], a
	ld [hl], a
	jp Func_9d13

Func_9cf0: ; 9cf0 (2:5cf0)
	ld a, [wcd30]
	and a
	jp z, Func_9cfa
	jp Func_9d13

Func_9cfa: ; 9cfa (2:5cfa)
	ld hl, wcd2c
	ld a, [hl]
	add $2
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	jp Func_9c37

Func_9d08: ; 9d08 (2:5d08)
	ld hl, wcd2c
	ld a, [hl]
	add $2
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
Func_9d13: ; 9d13 (2:5d13)
	ld a, [wcd27]
	and a
	jr z, .asm_9d37
	ld hl, wcd2a
	ld a, [hl]
	sub $1
	ld [hli], a
	ld a, [hl]
	sbc $0
	ld [hld], a
	jr nc, .asm_9d37
	ld a, [wcd28]
	ld [hli], a
	ld a, [wcd29]
	ld [hli], a
	ld hl, wcd27
	ld a, [hl]
	sub $1
	jr c, .asm_9d37
	ld [hl], a
.asm_9d37
	ld hl, wcd21
	ld a, [hli]
	ld b, [hl]
	ld c, a
	call Func_9eae
	ld hl, wcd21
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wcd42
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcd23
	ld a, [hli]
	sub c
	ld a, [hld]
	sbc b
	jr c, .asm_9d5d
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hl], a
	jr .asm_9d63

.asm_9d5d
	ld a, [hli]
	ld b, [hl]
	ld c, a
	xor a
	ld [hld], a
	ld [hl], a
.asm_9d63
	call Func_9ebc
	ld hl, wcd1b
	ld a, [hl]
	sub $1
	ld [hli], a
	ld a, [hl]
	sbc $0
	ld [hl], a
	jr nc, .asm_9d8a
	ld a, [wcd1a]
	ld [hld], a
	ld a, [wcd19]
	ld [hl], a
	ld hl, wcd1d
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcd1f
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call Func_9eca
.asm_9d8a
	ld hl, wcd2c
	ld a, [hli]
	or [hl]
	jp nz, Func_9deb
	ld hl, wcd15
	ld a, [hl]
	add $1
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hld], a
	ld a, [wcd17]
	ld c, a
	ld a, [wcd18]
	ld b, a
	ld a, [hli]
	sub c
	ld a, [hld]
	sbc b
	jp c, Func_9deb
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wcd26
	ld a, [hl]
	inc a
	jr z, .asm_9db7
	ld [hl], a
.asm_9db7
	call Func_9ef5
	ld hl, wcd09
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $2
	add hl, de
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcea5]
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	and $3f
	ld b, a
.asm_9dd9
	ld a, b
	cp [hl]
	jr c, .asm_9de2
	inc hl
	inc hl
	inc hl
	jr .asm_9dd9

.asm_9de2
	inc hl
	ld a, [hli]
	ld [wcd2c], a
	ld a, [hl]
	ld [wcd2d], a
Func_9deb: ; 9deb (2:5deb)
	ld a, [wcd30]
	and a
	jr z, .asm_9dff
	ld hl, wcd31
	cp [hl]
	jr z, .asm_9e21
	ld hl, wcd34
	ld a, [hl]
	and a
	jr z, .asm_9e04
	dec [hl]
.asm_9dff
	xor a
	ld [wcd35], a
	ret

.asm_9e04
	ld hl, wcd32
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	and $7
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wcd34], a
	ld a, $1
	ld [wcd35], a
	ld hl, wcd31
	inc [hl]
	ret

.asm_9e21
	xor a
	ld [wcd30], a
	ld [wcd32], a
	ld [wcd34], a
	ld a, $2
	ld [wcd35], a
	ret

Func_9e31: ; 9e31
	ld hl, wcd42
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, wcd23
	ld a, [hli]
	sub c
	ld a, [hld]
	sbc b
	jr c, .asm_9e48
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hl], a
	jr .asm_9e4e

.asm_9e48
	ld a, [hli]
	ld b, [hl]
	ld c, a
	xor a
	ld [hld], a
	ld [hl], a
.asm_9e4e
	call Func_9ebc
	ret

Func_9e52: ; 9e52
	ld a, b
	call Func_9f5f
	ret

Func_9e57: ; 9e57 (2:5e57)
	ld a, [wcd2f]
	and a
	call nz, Func_9e6d
	ld a, [wcd35]
	dec a
	jr z, .asm_9e68
	dec a
	jr z, asm_9e92
	ret

.asm_9e68
	ld a, [wcd31]
	or $80
Func_9e6d: ; 9e6d (2:5e6d)
	ld [wcbf0], a
	ld b, a
	call Func_9f92
	ld hl, wcbee
	ld a, e
	ld [hli], a
	ld [hl], d
	ld hl, wcbec
	ld a, $6c
	ld [hli], a
	ld a, [wcd46]
	cpl
	inc a
	add $90
	ld [hl], a
	call Func_8000
	farcall Func_4244a
	ret

asm_9e92
	ld a, $ff
	ld [wcbf0], a
	ld hl, wcbee
	ld [hli], a
	ld [hl], a
	ld hl, wcbec
	ld a, $6c
	ld [hli], a
	ld a, [wcd46]
	cpl
	inc a
	add $90
	ld [hl], a
	call Func_8000
	ret

Func_9eae: ; 9eae (2:5eae)
	ld hl, wcd0b
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hld], a
	ret nc
	xor a
	ld [hli], a
	ld [hl], a
	ret

Func_9ebc: ; 9ebc (2:5ebc)
	ld hl, wcd0f
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hld], a
	ret nc
	xor a
	ld [hli], a
	ld [hl], a
	ret

Func_9eca: ; 9eca (2:5eca)
	push bc
	push de
	ld hl, wcd0b
	ld a, [hli]
	sub c
	ld c, a
	ld a, [hld]
	sbc b
	ld b, a
	jr c, .asm_9ee0
	ld a, c
	sub e
	ld a, b
	sbc d
	jr c, .asm_9ee0
	ld a, c
	ld [hli], a
	ld [hl], b
.asm_9ee0
	pop de
	pop bc
	ld hl, wcd0f
	ld a, [hli]
	sub c
	ld c, a
	ld a, [hld]
	sbc b
	ld b, a
	ret c
	ld a, c
	sub e
	ld a, b
	sbc d
	ret c
	ld a, c
	ld [hli], a
	ld [hl], b
	ret

Func_9ef5: ; 9ef5 (2:5ef5)
	ld c, $0
	ld a, [wcd26]
	dec a
	jr nz, .asm_9f04
	ld a, c
	add $8
	ld c, a
	ld b, $0
	ret

.asm_9f04
	ld a, [wcd27]
	and a
	jr z, .asm_9f0c
	inc c
	inc c
.asm_9f0c
	ld hl, wcd13
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wcd0b
	ld a, [hli]
	sub e
	ld a, [hl]
	sbc d
	jr nc, .asm_9f1f
	inc c
	inc c
	inc c
	inc c
.asm_9f1f
	ld b, $0
	ret

Func_9f22: ; 9f22 (2:5f22)
	ld hl, wc8d2
	ld c, [hl]
	ld b, $0
.asm_9f28
	ld hl, wc8d3
	ld a, c
	cp [hl]
	jr z, .asm_9f59
	ld hl, wc8be
	add hl, bc
	ld a, [hl]
	and $c0
	jr z, .asm_9f4b
	cp $40
	jr z, .asm_9f4b
	cp $80
	jr z, .asm_9f45
	ld a, [wcd25]
	jr .asm_9f4c

.asm_9f45
	ld a, [hl]
	ld [wcd25], a
	jr .asm_9f4f

.asm_9f4b
	ld a, [hl]
.asm_9f4c
	call Func_9f5f
.asm_9f4f
	ld a, c
	inc a
	cp $a
	jr nz, .asm_9f56
	xor a
.asm_9f56
	ld c, a
	jr .asm_9f28

.asm_9f59
	ld hl, wc8d3
	ld a, [hld]
	ld [hl], a
	ret

Func_9f5f: ; 9f5f (2:5f5f)
	push bc
	ld c, a
	ld b, $0
	ld l, c
	ld h, b
	add hl, hl
	ld e, l
	ld d, h
	ld hl, Data_b590
	add hl, bc
	ld c, [hl]
	ld hl, wcd27
	ld a, [hl]
	add c
	jr nc, .asm_9f76
	ld a, $ff
.asm_9f76
	ld [hl], a
	ld hl, Data_b410
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wcd21
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hl], a
	ld hl, wcd23
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hl], a
	pop bc
	ret

Func_9f92: ; 9f92 (2:5f92)
	ld a, b
	and $c0
	sub $40
	jr z, .asm_9fa5
	sub $40
	jr z, .asm_9faa
	ld hl, $0
	ld a, b
	sub $4
	jr .asm_9fcd

.asm_9fa5
	ld hl, $a4
	jr .asm_9fd4

.asm_9faa
	ld a, [wceb3]
	and a
	jr nz, .asm_9fc2
	ld a, [wceb7]
	and a
	jr nz, .asm_9fba
	ld e, $a
	jr .asm_9fbc

.asm_9fba
	ld e, $10
.asm_9fbc
	ld a, b
	and $3f
	cp e
	jr nc, .asm_9fc8
.asm_9fc2
	ld hl, $68
	ld a, b
	jr .asm_9fcd

.asm_9fc8
	ld hl, $a2
	jr .asm_9fd4

.asm_9fcd
	and $3f
	add a
	ld e, a
	ld d, $0
	add hl, de
.asm_9fd4
	ld e, l
	ld d, h
	ret

Func_9fd7: ; 9fd7 (2:5fd7)
	ld bc, $0
	ld hl, wcd0f
	ld a, [hli]
	ld [hFF8A], a
	or [hl]
	jr z, .asm_a024
	ld a, [hl]
	ld [hFF8B], a
	ld hl, wcd44
	ld a, [hli]
	ld d, [hl]
	ld e, a
.asm_9fec
	ld a, [hFF8A]
	sub e
	ld [hFF8A], a
	ld a, [hFF8B]
	sbc d
	ld [hFF8B], a
	jr c, .asm_9ffb
	inc c
	jr .asm_9fec

.asm_9ffb
	ld a, [hFF8A]
	add e
	ld [hFF8A], a
	ld a, [hFF8B]
	adc d
	ld [hFF8B], a
	ld hl, wcd42
	ld a, [hli]
	ld d, [hl]
	ld e, a
.asm_a00b
	ld a, [hFF8A]
	sub e
	ld [hFF8A], a
	ld a, [hFF8B]
	sbc d
	ld [hFF8B], a
	jr c, .asm_a01a
	inc b
	jr .asm_a00b

.asm_a01a
	ld a, c
	add a
	add a
	add a
	add b
	and a
	jr nz, .asm_a024
	ld a, $1
.asm_a024
	ld [wcd46], a
	ret

Pointers_a028: ; a028
	dw Pointers_a044
	dw Pointers_a044
	dw Pointers_a05a
	dw Pointers_a070
	dw Pointers_a086
	dw Pointers_a09c
	dw Pointers_a0b2
	dw Pointers_a0c8
	dw Pointers_a0de
	dw Pointers_a0f4
	dw Pointers_a10a
	dw Pointers_a120
	dw Pointers_a136
	dw Pointers_a14c

Pointers_a044: ; a044
	dw Data_a162
	dw Data_a5fe
	dw Data_a608
	dw Data_a612
	dw Data_a61c
	dw Data_a5f4
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a05a: ; a05a
	dw Data_a1bc
	dw Data_a630
	dw Data_a63a
	dw Data_a644
	dw Data_a64e
	dw Data_a626
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a070: ; a070
	dw Data_a216
	dw Data_a662
	dw Data_a66c
	dw Data_a676
	dw Data_a680
	dw Data_a658
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a086: ; a086
	dw Data_a270
	dw Data_a694
	dw Data_a69e
	dw Data_a6a8
	dw Data_a6b2
	dw Data_a68a
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a09c: ; a09c
	dw Data_a2ca
	dw Data_a6c6
	dw Data_a6d0
	dw Data_a6da
	dw Data_a6e4
	dw Data_a6bc
	dw Data_b2d0
	dw Data_b3c0
	dw Data_b2d0
	dw Data_b3c0
	dw Data_b2d0

Pointers_a0b2: ; a0b2
	dw Data_a324
	dw Data_a6f8
	dw Data_a702
	dw Data_a70c
	dw Data_a716
	dw Data_a6ee
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a0c8: ; a0c8
	dw Data_a37e
	dw Data_a72a
	dw Data_a734
	dw Data_a73e
	dw Data_a748
	dw Data_a720
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a0de: ; a0de
	dw Data_a3d8
	dw Data_a75c
	dw Data_a766
	dw Data_a770
	dw Data_a77a
	dw Data_a752
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a0f4: ; a0f4
	dw Data_a432
	dw Data_a78e
	dw Data_a798
	dw Data_a7a2
	dw Data_a7ac
	dw Data_a784
	dw Data_b2d0
	dw Data_b398
	dw Data_b2d0
	dw Data_b398
	dw Data_b2d0

Pointers_a10a: ; a10a
	dw Data_a48c
	dw Data_a7c0
	dw Data_a7ca
	dw Data_a7d4
	dw Data_a7de
	dw Data_a7b6
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0
	dw Data_b370
	dw Data_b2d0

Pointers_a120: ; a120
	dw Data_a4e6
	dw Data_a7f2
	dw Data_a7fc
	dw Data_a806
	dw Data_a810
	dw Data_a7e8
	dw Data_b2f8
	dw Data_b370
	dw Data_b2f8
	dw Data_b370
	dw Data_b2f8

Pointers_a136: ; a136
	dw Data_a540
	dw Data_a824
	dw Data_a82e
	dw Data_a838
	dw Data_a842
	dw Data_a81a
	dw Data_b320
	dw Data_b3c0
	dw Data_b320
	dw Data_b3c0
	dw Data_b320

Pointers_a14c: ; a14c
	dw Data_a59a
	dw Data_a856
	dw Data_a860
	dw Data_a86a
	dw Data_a874
	dw Data_a84c
	dw Data_b348
	dw Data_b3e8
	dw Data_b348
	dw Data_b3e8
	dw Data_b348


Data_a162: ; a162
	db $00, $04, $00, $01, $00, $00, $f4, $01, $60, $09
	db $3b, $00, $05, $00, $00, $00, $2c, $01, $80, $05
	db $00, $03, $00, $01, $3a, $02, $dc, $05, $00, $00
	db $00, $00, $00, $00, $96, $00, $00, $08, $00, $04
	db $00, $02, $c2, $01, $7a, $03, $00, $00, $00, $00
	db $00, $00, $64, $00, $00, $0c, $00, $05, $00, $03
	db $c2, $01, $2a, $03, $00, $00, $00, $00, $00, $00
	db $3c, $00, $00, $14, $00, $08, $00, $05, $c2, $01
	db $2a, $03, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a1bc: ; a1bc
	db $00, $04, $00, $01, $00, $00, $f4, $01, $08, $07
	db $42, $00, $05, $00, $00, $00, $2c, $01, $80, $05
	db $00, $03, $00, $01, $94, $02, $b0, $04, $00, $00
	db $00, $00, $00, $00, $96, $00, $00, $08, $00, $04
	db $00, $02, $e0, $01, $66, $03, $00, $00, $00, $00
	db $00, $00, $64, $00, $00, $0c, $00, $05, $00, $03
	db $e0, $01, $0c, $03, $00, $00, $00, $00, $00, $00
	db $3c, $00, $00, $14, $00, $08, $00, $05, $e0, $01
	db $0c, $03, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a216: ; a216
	db $80, $04, $00, $01, $00, $00, $f4, $01, $78, $05
	db $48, $00, $05, $00, $00, $01, $2c, $01, $00, $06
	db $00, $03, $00, $01, $58, $02, $4c, $04, $00, $00
	db $00, $00, $00, $00, $96, $00, $c0, $08, $00, $04
	db $00, $02, $c2, $01, $48, $03, $00, $00, $00, $00
	db $00, $00, $64, $00, $80, $0c, $00, $05, $00, $03
	db $c2, $01, $ee, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $80, $14, $00, $08, $00, $05, $c2, $01
	db $ee, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a270: ; a270
	db $80, $04, $00, $01, $00, $00, $58, $02, $14, $05
	db $4e, $00, $05, $00, $80, $01, $2c, $01, $00, $06
	db $00, $03, $00, $01, $1c, $02, $e8, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $c0, $08, $00, $05
	db $00, $02, $1c, $02, $20, $03, $00, $00, $00, $00
	db $00, $00, $64, $00, $80, $0c, $00, $06, $00, $03
	db $1c, $02, $d5, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $80, $14, $00, $08, $00, $05, $1c, $02
	db $d5, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a2ca: ; a2ca
	db $80, $04, $00, $01, $00, $00, $58, $02, $4c, $04
	db $54, $00, $0a, $00, $c0, $01, $2c, $01, $00, $06
	db $00, $03, $00, $01, $3a, $02, $e8, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $d0, $08, $00, $04
	db $00, $02, $90, $01, $11, $03, $00, $00, $00, $00
	db $00, $00, $64, $00, $00, $0d, $00, $05, $00, $03
	db $90, $01, $bc, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $00, $15, $00, $08, $00, $05, $90, $01
	db $bc, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a324: ; a324
	db $80, $04, $00, $01, $00, $00, $0c, $03, $e8, $03
	db $5a, $00, $0a, $00, $80, $01, $2c, $01, $00, $06
	db $00, $02, $00, $01, $ee, $02, $a3, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $00, $09, $00, $03
	db $00, $02, $6c, $02, $e9, $02, $00, $00, $00, $00
	db $00, $00, $64, $00, $00, $0d, $00, $04, $00, $03
	db $6c, $02, $a8, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $00, $15, $00, $08, $00, $05, $6c, $02
	db $a8, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a37e: ; a37e
	db $00, $05, $00, $01, $00, $00, $f4, $01, $e8, $03
	db $60, $00, $0a, $00, $80, $02, $2c, $01, $80, $06
	db $00, $03, $00, $01, $a4, $01, $81, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $00, $09, $00, $04
	db $00, $02, $68, $01, $d0, $02, $00, $00, $00, $00
	db $00, $00, $64, $00, $80, $0d, $00, $05, $00, $03
	db $68, $01, $94, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $80, $15, $00, $08, $00, $05, $68, $01
	db $94, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a3d8: ; a3d8
	db $00, $05, $00, $01, $00, $00, $4e, $02, $c0, $03
	db $66, $00, $09, $00, $00, $03, $2c, $01, $80, $06
	db $00, $03, $00, $01, $1c, $02, $81, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $40, $09, $00, $04
	db $00, $02, $90, $01, $c6, $02, $00, $00, $00, $00
	db $00, $00, $64, $00, $00, $0e, $00, $05, $00, $03
	db $90, $01, $80, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $00, $16, $00, $08, $00, $05, $90, $01
	db $80, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a432: ; a432
	db $40, $05, $00, $01, $00, $00, $bc, $02, $70, $03
	db $00, $00, $00, $00, $80, $01, $2c, $01, $40, $07
	db $2c, $01, $40, $01, $7c, $01, $3e, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $00, $0a, $00, $04
	db $00, $02, $54, $01, $da, $02, $00, $00, $00, $00
	db $00, $00, $64, $00, $80, $0f, $00, $05, $00, $03
	db $54, $01, $58, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $80, $17, $00, $08, $00, $06, $54, $01
	db $58, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a48c: ; a48c
	db $80, $05, $00, $01, $00, $00, $90, $01, $a2, $03
	db $00, $00, $00, $00, $00, $02, $2c, $01, $80, $07
	db $c8, $00, $40, $01, $c8, $00, $52, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $80, $0a, $00, $04
	db $00, $02, $d2, $00, $ee, $02, $00, $00, $00, $00
	db $00, $00, $64, $00, $00, $10, $00, $05, $00, $03
	db $d2, $00, $bc, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $00, $18, $00, $08, $00, $06, $d2, $00
	db $58, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a4e6: ; a4e6
	db $80, $06, $00, $01, $00, $00, $c8, $00, $16, $03
	db $3c, $00, $00, $00, $00, $00, $2c, $01, $80, $08
	db $00, $03, $40, $01, $72, $01, $16, $03, $00, $00
	db $00, $00, $00, $00, $96, $00, $00, $0b, $00, $04
	db $00, $02, $fa, $00, $b2, $02, $00, $00, $00, $00
	db $00, $00, $64, $00, $80, $11, $00, $05, $00, $03
	db $fa, $00, $a3, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $80, $19, $00, $08, $00, $07, $fa, $00
	db $26, $02, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a540: ; a540
	db $80, $0a, $80, $05, $40, $02, $78, $00, $90, $01
	db $00, $00, $00, $00, $00, $00, $58, $02, $80, $0a
	db $80, $05, $40, $02, $78, $00, $90, $01, $00, $00
	db $00, $00, $00, $00, $96, $00, $80, $0a, $80, $05
	db $40, $02, $78, $00, $12, $02, $00, $00, $00, $00
	db $00, $00, $64, $00, $00, $10, $00, $07, $c0, $02
	db $78, $00, $12, $02, $00, $00, $00, $00, $00, $00
	db $3c, $00, $00, $18, $00, $08, $00, $07, $78, $00
	db $d6, $01, $00, $00, $00, $00, $00, $00, $3c, $00

Data_a59a: ; a59a
	db $80, $0a, $00, $05, $00, $02, $78, $00, $8a, $02
	db $00, $00, $00, $00, $00, $00, $f4, $01, $80, $0a
	db $00, $05, $00, $02, $78, $00, $8a, $02, $00, $00
	db $00, $00, $00, $00, $82, $00, $80, $0a, $00, $05
	db $00, $02, $78, $00, $8a, $02, $00, $00, $00, $00
	db $00, $00, $50, $00, $00, $12, $00, $07, $40, $02
	db $78, $00, $3a, $02, $00, $00, $00, $00, $00, $00
	db $32, $00, $00, $18, $00, $08, $00, $06, $78, $00
	db $08, $02, $00, $00, $00, $00, $00, $00, $32, $00

Data_a5f4: ; a5f4
	db $7e, $68, $06, $69, $28, $6a, $38, $6c, $24, $6e

Data_a5fe: ; a5fe
	db $7e, $68, $06, $69, $28, $6a, $38, $6c, $24, $6e

Data_a608: ; a608
	db $7e, $68, $06, $69, $28, $6a, $38, $6c, $24, $6e

Data_a612: ; a612
	db $7e, $68, $06, $69, $38, $6a, $45, $6c, $34, $6e

Data_a61c: ; a61c
	db $7e, $68, $06, $69, $38, $6a, $45, $6c, $34, $6e

Data_a626: ; a626
	db $85, $68, $16, $69, $48, $6a, $52, $6c, $24, $6e

Data_a630: ; a630
	db $85, $68, $16, $69, $48, $6a, $52, $6c, $24, $6e

Data_a63a: ; a63a
	db $85, $68, $16, $69, $48, $6a, $52, $6c, $24, $6e

Data_a644: ; a644
	db $85, $68, $16, $69, $5e, $6a, $5f, $6c, $34, $6e

Data_a64e: ; a64e
	db $85, $68, $16, $69, $5e, $6a, $5f, $6c, $34, $6e

Data_a658: ; a658
	db $92, $68, $29, $69, $6e, $6a, $6c, $6c, $24, $6e

Data_a662: ; a662
	db $92, $68, $36, $69, $7e, $6a, $76, $6c, $24, $6e

Data_a66c: ; a66c
	db $92, $68, $36, $69, $7e, $6a, $76, $6c, $24, $6e

Data_a676: ; a676
	db $92, $68, $36, $69, $94, $6a, $86, $6c, $34, $6e

Data_a680: ; a680
	db $92, $68, $36, $69, $94, $6a, $86, $6c, $34, $6e

Data_a68a: ; a68a
	db $9f, $68, $46, $69, $a7, $6a, $96, $6c, $24, $6e

Data_a694: ; a694
	db $9f, $68, $46, $69, $a7, $6a, $96, $6c, $24, $6e

Data_a69e: ; a69e
	db $9f, $68, $46, $69, $a7, $6a, $96, $6c, $24, $6e

Data_a6a8: ; a6a8
	db $9f, $68, $56, $69, $b7, $6a, $a6, $6c, $34, $6e

Data_a6b2: ; a6b2
	db $9f, $68, $56, $69, $b7, $6a, $a6, $6c, $34, $6e

Data_a6bc: ; a6bc
	db $a9, $68, $66, $69, $c7, $6a, $b3, $6c, $24, $6e

Data_a6c6: ; a6c6
	db $a9, $68, $66, $69, $c7, $6a, $b3, $6c, $24, $6e

Data_a6d0: ; a6d0
	db $a9, $68, $70, $69, $d4, $6a, $c0, $6c, $24, $6e

Data_a6da: ; a6da
	db $a9, $68, $66, $69, $e4, $6a, $d0, $6c, $34, $6e

Data_a6e4: ; a6e4
	db $a9, $68, $70, $69, $f4, $6a, $e0, $6c, $34, $6e

Data_a6ee: ; a6ee
	db $b6, $68, $7d, $69, $07, $6b, $f3, $6c, $24, $6e

Data_a6f8: ; a6f8
	db $b6, $68, $84, $69, $11, $6b, $fd, $6c, $24, $6e

Data_a702: ; a702
	db $b6, $68, $84, $69, $11, $6b, $fd, $6c, $24, $6e

Data_a70c: ; a70c
	db $b6, $68, $84, $69, $11, $6b, $fd, $6c, $34, $6e

Data_a716: ; a716
	db $b6, $68, $84, $69, $11, $6b, $fd, $6c, $34, $6e

Data_a720: ; a720
	db $c6, $68, $8e, $69, $1e, $6b, $0a, $6d, $24, $6e

Data_a72a: ; a72a
	db $c6, $68, $92, $69, $25, $6b, $11, $6d, $24, $6e

Data_a734: ; a734
	db $c6, $68, $92, $69, $25, $6b, $11, $6d, $24, $6e

Data_a73e: ; a73e
	db $c6, $68, $92, $69, $35, $6b, $21, $6d, $34, $6e

Data_a748: ; a748
	db $c6, $68, $92, $69, $35, $6b, $21, $6d, $34, $6e

Data_a752: ; a752
	db $d6, $68, $a2, $69, $45, $6b, $31, $6d, $24, $6e

Data_a75c: ; a75c
	db $d6, $68, $a2, $69, $45, $6b, $31, $6d, $24, $6e

Data_a766: ; a766
	db $d6, $68, $b2, $69, $55, $6b, $3b, $6d, $24, $6e

Data_a770: ; a770
	db $d6, $68, $a2, $69, $55, $6b, $4b, $6d, $34, $6e

Data_a77a: ; a77a
	db $d6, $68, $b2, $69, $55, $6b, $4b, $6d, $34, $6e

Data_a784: ; a784
	db $e6, $68, $bf, $69, $65, $6b, $5b, $6d, $24, $6e

Data_a78e: ; a78e
	db $e6, $68, $c9, $69, $6f, $6b, $65, $6d, $24, $6e

Data_a798: ; a798
	db $e6, $68, $c9, $69, $82, $6b, $65, $6d, $24, $6e

Data_a7a2: ; a7a2
	db $e6, $68, $d6, $69, $92, $6b, $75, $6d, $34, $6e

Data_a7ac: ; a7ac
	db $e6, $68, $d6, $69, $92, $6b, $75, $6d, $34, $6e

Data_a7b6: ; a7b6
	db $f6, $68, $e0, $69, $9f, $6b, $7f, $6d, $24, $6e

Data_a7c0: ; a7c0
	db $f6, $68, $ea, $69, $a6, $6b, $86, $6d, $24, $6e

Data_a7ca: ; a7ca
	db $f6, $68, $ea, $69, $a6, $6b, $86, $6d, $24, $6e

Data_a7d4: ; a7d4
	db $f6, $68, $f7, $69, $b3, $6b, $93, $6d, $34, $6e

Data_a7de: ; a7de
	db $f6, $68, $f7, $69, $b3, $6b, $93, $6d, $34, $6e

Data_a7e8: ; a7e8
	db $7e, $68, $07, $6a, $c3, $6b, $a6, $6d, $24, $6e

Data_a7f2: ; a7f2
	db $7e, $68, $0e, $6a, $ca, $6b, $b0, $6d, $24, $6e

Data_a7fc: ; a7fc
	db $7e, $68, $0e, $6a, $ca, $6b, $b0, $6d, $24, $6e

Data_a806: ; a806
	db $7e, $68, $1b, $6a, $d7, $6b, $bd, $6d, $34, $6e

Data_a810: ; a810
	db $7e, $68, $1b, $6a, $d7, $6b, $bd, $6d, $34, $6e

Data_a81a: ; a81a
	db $7e, $68, $06, $69, $e7, $6b, $cd, $6d, $24, $6e

Data_a824: ; a824
	db $7e, $68, $06, $69, $f1, $6b, $d7, $6d, $24, $6e

Data_a82e: ; a82e
	db $7e, $68, $06, $69, $f1, $6b, $d7, $6d, $24, $6e

Data_a838: ; a838
	db $7e, $68, $06, $69, $04, $6c, $ea, $6d, $34, $6e

Data_a842: ; a842
	db $7e, $68, $06, $69, $04, $6c, $ea, $6d, $34, $6e

Data_a84c: ; a84c
	db $7e, $68, $06, $69, $e7, $6b, $cd, $6d, $24, $6e

Data_a856: ; a856
	db $7e, $68, $06, $69, $f1, $6b, $d7, $6d, $24, $6e

Data_a860: ; a860
	db $7e, $68, $06, $69, $f1, $6b, $d7, $6d, $24, $6e

Data_a86a: ; a86a
	db $7e, $68, $06, $69, $04, $6c, $ea, $6d, $34, $6e

Data_a874: ; a874
	db $7e, $68, $06, $69, $04, $6c, $ea, $6d, $34, $6e

Pointers_a87e: ; a87e
	dr $a87e, $b2d0

Data_b2d0: ; b2d0
	db $5c, $5c, $5c, $5c, $5c, $5c, $5c, $5c, $54, $54
	db $54, $54, $54, $54, $54, $54, $4a, $4a, $4a, $4a
	db $4a, $4a, $4a, $4a, $46, $46, $46, $46, $46, $46
	db $46, $46, $46, $46, $46, $46, $46, $46, $46, $46

Data_b2f8: ; b2f8
	db $5c, $5c, $5c, $5c, $5c, $5c, $5c, $5c, $54, $54
	db $54, $54, $54, $54, $54, $54, $4a, $4a, $4a, $4a
	db $4a, $4a, $4a, $04, $46, $46, $46, $46, $46, $46
	db $23, $04, $46, $46, $46, $46, $46, $46, $04, $04

Data_b320: ; b320
	db $5c, $5c, $5c, $5c, $5c, $5c, $5c, $5c, $54, $54
	db $54, $54, $54, $54, $54, $54, $4a, $4a, $4a, $4a
	db $4a, $4a, $04, $04, $46, $46, $46, $46, $46, $23
	db $04, $04, $46, $46, $46, $46, $23, $04, $04, $04

Data_b348: ; b348
	db $5c, $5c, $5c, $5c, $5c, $5c, $5c, $5c, $54, $54
	db $54, $54, $54, $54, $54, $54, $4a, $4a, $4a, $4a
	db $4a, $4a, $04, $04, $46, $46, $46, $46, $46, $23
	db $04, $04, $46, $46, $46, $46, $23, $04, $04, $04

Data_b370: ; b370
	db $73, $73, $73, $73, $73, $73, $73, $73, $63, $63
	db $63, $63, $63, $63, $63, $63, $51, $51, $51, $51
	db $51, $51, $51, $51, $4b, $4b, $4b, $4b, $4b, $4b
	db $4b, $4b, $4b, $4b, $4b, $4b, $4b, $4b, $4b, $4b

Data_b398: ; b398
	db $73, $73, $73, $73, $73, $73, $73, $73, $63, $63
	db $63, $63, $63, $63, $63, $63, $51, $51, $74, $74
	db $74, $97, $97, $ba, $4b, $4b, $6e, $6e, $6e, $91
	db $91, $c3, $4b, $4b, $6e, $6e, $6e, $91, $91, $c3

Data_b3c0: ; b3c0
	db $73, $73, $73, $9b, $9b, $c3, $14, $04, $63, $63
	db $63, $86, $86, $a9, $14, $04, $51, $51, $51, $74
	db $74, $97, $14, $04, $4b, $4b, $4b, $6e, $6e, $87
	db $14, $04, $4b, $4b, $4b, $6e, $6e, $87, $14, $04

Data_b3e8: ; b3e8
	db $73, $73, $73, $9b, $9b, $c3, $14, $04, $63, $63
	db $63, $86, $86, $a9, $14, $04, $51, $51, $51, $74
	db $74, $97, $14, $04, $4b, $4b, $4b, $6e, $6e, $87
	db $14, $04, $4b, $4b, $4b, $6e, $6e, $87, $14, $04

Data_b410: ; b410
	dw   $80,   $aa,  $100,  $130,  $160,  $190,  $1c0,  $1f0 ; 00
	dw  $220,  $300,  $400,  $500,  $600,  $700,  $800,  $900
	dw  $a00,  $b00,  $c00,  $d00,  $e00,  $f00, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000

	dw    $0,    $0,    $0,  $140,  $280,  $3c0,  $500,  $640 ; 40
	dw  $780,  $8c0,  $a00,  $b40,  $c80,  $dc0,  $f00, $1000
	dw  $e00,  $f00, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000

	dw    $0,  $100,  $200,  $300,  $400,  $500,  $600,  $700 ; 80
	dw  $800,  $8c0,  $980,  $a40,  $b00,  $bc0,  $c80,  $d40
	dw  $e00,  $ec0,  $f80, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000
	dw $1000, $1000, $1000, $1000, $1000, $1000, $1000, $1000

Data_b590: ; b590
	db $00, $00, $00, $00, $03, $04, $05, $06 ; 00
	db $07, $08, $09, $0a, $0b, $0c, $0d, $0e
	db $0f, $10, $11, $12, $13, $14, $15, $16
	db $17, $18, $19, $1a, $1b, $1c, $1d, $1e
	db $1f, $20, $21, $22, $23, $24, $25, $26
	db $27, $28, $29, $2a, $2b, $2c, $2d, $2e
	db $2f, $30, $31, $32, $33, $34, $35, $36
	db $37, $38, $39, $40, $41, $42, $43, $44

	db $00, $00, $02, $06, $0c, $12, $18, $2e ; 40
	db $34, $3a, $40, $46, $4c, $52, $58, $5e
	db $64, $6a, $70, $76, $7c, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f

	db $00, $08, $10, $18, $20, $28, $30, $38 ; 80
	db $40, $48, $50, $58, $60, $68, $70, $78
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
	db $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f

Func_b650: ; b650 (2:7650)
	ld hl, wc8fb
	ld c, [hl]
	ld b, $0
	ld a, [hFF8A]
	bit 7, a
	jr nz, .asm_b663
	inc [hl]
	ld hl, wd400
	add hl, bc
	ld [hl], a
	ret

.asm_b663
	and $3f
	ld d, a
	ld e, $1
.asm_b668
	ld hl, wc8fb
	inc [hl]
	ld hl, wd400
	add hl, bc
	ld a, d
	swap a
	or e
	ld [hl], a
	inc c
	inc e
	ld a, e
	dec a
	cp d
	jr c, .asm_b668
	ld hl, Data_b6ee
	ld c, d
	sla c
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, Data_b6ee
	add hl, bc
	ld e, l
	ld d, h
	ld a, [wc8fd]
	ld c, a
	ld b, $0
.loop
	ld hl, wd300
	add hl, bc
	ld a, [de]
	cp $ff
	jr z, .quit
	ld [hl], a
	inc de
	inc c
	jr .loop

.quit
	ld a, c
	ld [wc8fd], a
	ret

Func_b6a7: ; b6a7 (2:76a7)
	push bc
	ld hl, Data_b6ee
	ld c, b
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld hl, Data_b6ee
	add hl, bc
	pop bc
	ld a, e
	and $7
	add c
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	or $c0
	ld [hFF8A], a
	ret

Func_b6c5: ; b6c5 (2:76c5)
	push bc
	ld hl, Data_b6ee
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, Data_b6ee
	add hl, de
	pop bc
	ld c, b
	ld b, $0
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wc8fc]
	ld e, a
	ld d, $0
.asm_b6e0
	ld hl, wd300
	add hl, de
	ld a, [bc]
	cp $ff
	ret z
	ld [hl], a
	inc bc
	inc e
	jr .asm_b6e0

.asm_b6ed
	ret

Data_b6ee: ; b6ee
	dw Data_b6ee - Data_b6ee
	dw Data_b70e - Data_b6ee
	dw Data_b715 - Data_b6ee
	dw Data_b722 - Data_b6ee
	dw Data_b735 - Data_b6ee
	dw Data_b74e - Data_b6ee
	dw Data_b76d - Data_b6ee
	dw Data_b792 - Data_b6ee
	dw Data_b7bd - Data_b6ee
	dw Data_b7ee - Data_b6ee
	dw Data_b825 - Data_b6ee
	dw Data_b862 - Data_b6ee
	dw Data_b8a5 - Data_b6ee
	dw Data_b8ee - Data_b6ee
	dw Data_b93d - Data_b6ee
	dw Data_b992 - Data_b6ee

Data_b70e: ; b70e
	db $0e, $1d, $17
	db $18, $1d, $10
	db $ff

Data_b715: ; b715
	db $29, $2a, $2b
	db $2c, $2a, $2d
	db $24, $25, $26
	db $27, $25, $28
	db $ff

Data_b722: ; b722
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $30
	db $31, $15, $16
	db $0a, $0b, $0c
	db $0b, $0c, $0d
	db $ff

Data_b735: ; b735
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $36
	db $37, $15, $16
	db $19, $15, $34
	db $35, $12, $1c
	db $24, $0c, $0b
	db $0c, $0b, $28
	db $ff

Data_b74e: ; b74e
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $1e
	db $1f, $15, $16
	db $19, $15, $1a
	db $1b, $12, $1c
	db $11, $12, $13
	db $14, $15, $16
	db $0a, $0b, $0c
	db $0b, $0c, $0d
	db $ff

Data_b76d: ; b76d
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $32
	db $33, $12, $1c
	db $11, $12, $2e
	db $2f, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $24, $0c, $0b
	db $0c, $0b, $28
	db $ff

Data_b792: ; b792
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $30
	db $31, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $0a, $0b, $0c
	db $0b, $0c, $0d
	db $ff

Data_b7bd: ; b7bd
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $36
	db $37, $15, $16
	db $19, $15, $34
	db $35, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $24, $0c, $0b
	db $0c, $0b, $28
	db $ff

Data_b7ee: ; b7ee
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $1a
	db $1b, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $0a, $0b, $0c
	db $0b, $0c, $0d
	db $ff

Data_b825: ; b825
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $32
	db $33, $12, $1c
	db $11, $12, $2e
	db $2f, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $24, $0c, $0b
	db $0c, $0b, $28
	db $ff

Data_b862: ; b862
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $30
	db $31, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $0a, $0b, $0c
	db $0b, $0c, $0d
	db $ff

Data_b8a5: ; b8a5
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $30
	db $31, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $24, $0c, $0b
	db $0c, $0b, $28
	db $ff

Data_b8ee: ; b8ee
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $30
	db $31, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $0a, $0b, $0c
	db $0b, $0c, $0d
	db $ff

Data_b93d: ; b93d
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $32
	db $33, $12, $1c
	db $11, $12, $2e
	db $2f, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $24, $0c, $0b
	db $0c, $0b, $28
	db $ff

Data_b992: ; b992
	db $20, $21, $22
	db $21, $22, $23
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $30
	db $31, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $19, $15, $12
	db $15, $12, $1c
	db $11, $12, $15
	db $12, $15, $16
	db $0a, $0b, $0c
	db $0b, $0c, $0d
	db $ff

SECTION "Bank 03", ROMX, BANK [$03]
Func_c000:: ; c000
	dr $c000, $c04e

Func_c04e:: ; c04e
	dr $c04e, $d08b

Func_d08b:: ; d08b
	dr $d08b, $f3a7

SECTION "Bank 04", ROMX, BANK [$04]
Func_10000:: ; 10000
	dr $10000, $10018

Func_10018:: ; 10018
	dr $10018, $1011c

LCDInterrupt:: ; 1011c (4:411c)
	push af
	push bc
	push hl
	di
	ld a, [rLY]
	cp $0
	jr nz, asm_1018a
	cp $0
	jr nz, .asm_1012f
	ld hl, $0
	jr .asm_10132

.asm_1012f
	ld hl, $0
.asm_10132
	ld c, $69
	ld a, $0
	ld [rBGPI], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	jr asm_1014c

asm_1013e
	ld a, [hli]
	ld [$ff00+c], a
	ld a, $0
	ld [rBGPI], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
asm_1014c
	jr asm_1018e

Func_1014e:: ; 1014e
	nop
	jr nz, .asm_10166
	ld a, [hli]
	ld [wc35b], a
	ld a, $18
	ld [wc362], a
	ld a, $0
	ld [wc363], a
	ld a, $2a
	ld [wc360], a
	jr .asm_1017e

.asm_10166
	cp $fe
	jr nz, asm_1017f
	ld a, $0
	ld [wc35b], a
	ld a, $2a
	ld [wc362], a
	ld a, $e2
	ld [wc363], a
	ld a, $2a
	ld [wc360], a
.asm_1017e
	ld a, [hli]
asm_1017f
	ld [wc349], a
	ld a, l
	ld [wc356], a
	ld a, h
	ld [wc357], a
asm_1018a
	pop hl
	pop bc
	pop af
	reti

asm_1018e
	ld a, [rLY]
	inc a
	cp $8f
	jr nz, asm_1017f
	ld a, $0
	jr asm_1017f

Func_10199:: ; 10199
	dr $10199, $1025e

Func_1025e:: ; 1025e
	dr $1025e, $1036d

Func_1036d:: ; 1036d
	dr $1036d, $10996

Func_10996:: ; 10996
	dr $10996, $109c0

Func_109c0:: ; 109c0
	dr $109c0, $10e63

Func_10e63:: ; 10e63
	dr $10e63, $13671

Func_13671: ; 13671
	dr $13671, $13cf1

SECTION "Bank 05", ROMX, BANK [$05]
Func_14000:: ; 14000
	dr $14000, $14257

Func_14257:: ; 14257
	dr $14257, $1442e

Func_1442e:: ; 1442e
	dr $1442e, $17464

SECTION "Bank 06", ROMX, BANK [$06]
	dr $18000, $1813f

Func_1813f:: ; 1813f
	dr $1813f, $1821d

Func_1821d:: ; 1821d
	dr $1821d, $182b0

Func_182b0:: ; 182b0
	dr $182b0, $1887e

Func_1887e:: ; 1887e
	dr $1887e, $188a3

Func_188a3:: ; 188a3
	dr $188a3, $188cf

Func_188cf:: ; 188cf
	dr $188cf, $18a9d

Func_18a9d:: ; 18a9d
	dr $18a9d, $1aa77

SECTION "Bank 07", ROMX, BANK [$07]
Func_1c000:: ; 1c000
	dr $1c000, $1c2f4

Func_1c2f4:: ; 1c2f4
	dr $1c2f4, $1c524

Func_1c524:: ; 1c524
	dr $1c524, $1c747

Func_1c747:: ; 1c747
	dr $1c747, $1cc63

Func_1cc63:: ; 1cc63
	dr $1cc63, $1cc76

Func_1cc76:: ; 1cc76
	dr $1cc76, $1f1e1

SECTION "Bank 08", ROMX, BANK [$08]
	dr $20000, $2015a

Func_2015a:: ; 2015a
	dr $2015a, $2027f

Func_2027f:: ; 2027f
	dr $2027f, $21fd3

SECTION "Bank 09", ROMX, BANK [$09]
	dr $24000, $2402f

Func_2402f:: ; 2402f
	dr $2402f, $241b4

Func_241b4:: ; 241b4
	dr $241b4, $2435b

Func_2435b:: ; 2435b
	dr $2435b, $244c1

Func_244c1:: ; 244c1
	dr $244c1, $26257

SECTION "Bank 0a", ROMX, BANK [$0a]
GFX_28000:: ; 28000
	dr $28000, $29c35

SECTION "Bank 0b", ROMX, BANK [$0b]
	dr $2c000, $2fc63

SECTION "Bank 0c", ROMX, BANK [$0c]
	dr $30000, $30255

Func_30255:: ; 30255
	dr $30255, $3067d

Func_3067d:: ; 3067d
	dr $3067d, $33ff1

SECTION "Bank 0d", ROMX, BANK [$0d]
	dr $34000, $37d5d

SECTION "Bank 0e", ROMX, BANK [$0e]
	dr $38000, $3b535

SECTION "Bank 0f", ROMX, BANK [$0f]
	dr $3c000, $3d5ab

Func_3d5ab:: ; 3d5ab
	dr $3d5ab, $3d6f4

Func_3d6f4:: ; 3d6f4
	dr $3d6f4, $3d706

Func_3d706:: ; 3d706
	dr $3d706, $3db9c

SECTION "Bank 10", ROMX, BANK [$10]
	dr $40000, $40004

Func_40004:: ; 40004
	dr $40004, $42417

Func_42417: ; 42417
	dr $42417, $4244a

Func_4244a: ; 4244a
	dr $4244a, $424b0

Func_424b0: ; 424b0
	dr $424b0, $429eb

Func_429eb: ; 429eb
	dr $429eb, $4334d

SECTION "Bank 11", ROMX, BANK [$11]
Func_44000:: ; 44000
	dr $44000, $46b39

Func_46b39:: ; 46b39
	dr $46b39, $46e47

Func_46e47:: ; 46e47
	dr $46e47, $46f43

SECTION "Bank 12", ROMX, BANK [$12]
	dr $48000, $48825

Func_48825:: ; 48825
	dr $48825, $49420

GFX_49420:: ; 49420
	dr $49420, $496a0

GFX_496a0:: ; 496a0
	dr $496a0, $4a7c4

SECTION "Bank 13", ROMX, BANK [$13]
	dr $4c000, $4c219

Func_4c219:: ; 4c219
	dr $4c219, $4fb70

SECTION "Bank 14", ROMX, BANK [$14]
Func_50000:: ; 50000
    dr $50000, $5001f

Func_5001f:: ; 5001f
	dr $5001f, $5170a

Func_5170a:: ; 5170a
	dr $5170a, $528f3

Func_528f3:: ; 528f3
	dr $528f3, $5343d

Func_5343d:: ; 5343d
	dr $5343d, $53e9e

SECTION "Bank 15", ROMX, BANK [$15]
	dr $54000, $5485a

Func_5485a:: ; 5485a
	dr $5485a, $55282

Func_55282:: ; 55282
	dr $55282, $55ded

Func_55ded:: ; 55ded
	dr $55ded, $56aa2

Func_56aa2:: ; 56aa2
	dr $56aa2, $57fc8

SECTION "Bank 16", ROMX, BANK [$16]
	dr $58000, $58d49

Func_58d49:: ; 58d49
	dr $58d49, $58d64

Func_58d64:: ; 58d64
	dr $58d64, $5bd87

SECTION "Bank 17", ROMX, BANK [$17]
	dr $5c000, $5d40c

Func_5d40c:: ; 5d40c
	dr $5d40c, $5ea8e

SECTION "Bank 18", ROMX, BANK [$18]
Func_60000:: ; 60000
	dr $60000, $608c0

Func_608c0:: ; 608c0
	dr $608c0, $617fb

Func_617fb:: ; 617fb
	dr $617fb, $626c0

SECTION "Bank 19", ROMX, BANK [$19]
Func_64000:: ; 64000
	dr $64000, $649c1

Func_649c1:: ; 649c1
	dr $649c1, $649ce

Func_649ce:: ; 649ce
	dr $649ce, $64c67

Func_64c67:: ; 64c67
	dr $64c67, $64db5

Func_64db5:: ; 64db5
	dr $64db5, $65fc4

Func_65fc4:: ; 65fc4
	dr $65fc4, $661c3

Func_661c3:: ; 661c3
	dr $661c3, $661d0

Func_661d0:: ; 661d0
	dr $661d0, $662c3

Func_662c3:: ; 662c3
	dr $662c3, $662dd

Func_662dd:: ; 662dd
	dr $662dd, $673ab

SECTION "Bank 1a", ROMX, BANK [$1a]
	dr $68000, $68a0f

Func_68a0f: ; 68a0f
	dr $68a0f, $68b3d

Func_68b3d: ; 68b3d
	dr $68b3d, $68c73

Func_68c73:: ; 68c73
	dr $68c73, $68d42

Func_68d42:: ; 68d42
	dr $68d42, $68ebb

Func_68ebb:: ; 68ebb
	dr $68ebb, $68ef9

PseudoRNGTable:: INCBIN "data/pseudorng.bin"

Func_696f9: ; 696f9
	dr $696f9, $69b08

Func_69b08:: ; 69b08
	dr $69b08, $6a2f4

Func_6a2f4: ; 6a2f4
	dr $6a2f4, $6a7b4

Func_6a7b4:: ; 6a7b4
	dr $6a7b4, $6af04

Func_6af04:: ; 6af04
	dr $6af04, $6be85

SECTION "Bank 1b", ROMX, BANK [$1b]
	dr $6c000, $6c085

Func_6c085:: ; 6c085
	dr $6c085, $6e509

Func_6e509: ; 6e509
	dr $6e509, $6ee9a

Func_6ee9a: ; 6ee9a
	dr $6ee9a, $6f3bc

SECTION "Bank 1c", ROMX, BANK [$1c]
	dr $70000, $70034

Func_70034: ; 70034
	dr $70034, $73cfe

SECTION "Bank 1d", ROMX, BANK [$1d]
Func_74000:: ; 74000
	dr $74000, $74140

Func_74140:: ; 74140
	dr $74140, $741c5

Func_741c5: ; 741c5
	dr $741c5, $74d05

Func_74d05: ; 74d05
	dr $74d05, $75a5d

Func_75a5d: ; 75a5d
	dr $75a5d, $76ff5

Func_76ff5:: ; 76ff5
	dr $76ff5, $779a1

Func_779a1:: ; 779a1
	dr $779a1, $77a38

SECTION "Bank 1e", ROMX, BANK [$1e]
Func_78000:: ; 78000
	dr $78000, $7bef5

SECTION "Bank 1f", ROMX, BANK [$1f]
Func_7c000:: ; 7c000
	dr $7c000, $7c0a7

Func_7c0a7:: ; 7c0a7
	dr $7c0a7, $7c33a

Func_7c33a:: ; 7c33a
	dr $7c33a, $7dbff

Func_7dbff:: ; 7dbff
	dr $7dbff, $7defa

Func_7defa:: ; 7defa
	dr $7defa, $7df32

Func_7df32:: ; 7df32
	dr $7df32, $7e055

Func_7e055:: ; 7e055
	dr $7e055, $7e182

Func_7e182:: ; 7e182
	dr $7e182, $7e19a

Func_7e19a:: ; 7e19a
	dr $7e19a, $7e21d

SECTION "Bank 20", ROMX, BANK [MUSIC_ENGINE]
	dr $80000, $80023

Func_80023:: ; 80023
	dr $80023, $803e3

Func_803e3:: ; 803e3
	dr $803e3, $803e6

Func_803e6:: ; 803e6
	dr $803e6, $80548

Func_80548:: ; 80548
	dr $80548, $80908

Func_80908:: ; 80908
	dr $80908, $8090b

Func_8090b:: ; 8090b
	dr $8090b, $80a6d

Func_80a6d:: ; 80a6d
	dr $80a6d, $80e31

Func_80e31:: ; 80e31
	dr $80e31, $80e34

Func_80e34:: ; 80e34
	dr $80e34, $80fa3

Func_80fa3:: ; 80fa3
	dr $80fa3, $81383

Func_81383:: ; 81383
	dr $81383, $813ba

Func_813ba:: ; 813ba
	dr $813ba, $8143e

Func_8143e:: ; 8143e
	dr $8143e, $81468

Func_81468:: ; 81468
	dr $81468, $81482

Func_81482:: ; 81482
	dr $81482, $81490

Func_81490:: ; 81490
	dr $81490, $814a9

Func_814a9:: ; 814a9
	dr $814a9, $814c5

Func_814c5:: ; 814c5
	dr $814c5, $816fd

Func_816fd:: ; 816fd
	dr $816fd, $81817

Func_81817:: ; 81817
	dr $81817, $81857

Func_81857:: ; 81857
	dr $81857, $8371e

SECTION "Bank 21", ROMX, BANK [$21]
Func_84000:: ; 84000
	dr $84000, $84012

Func_84012:: ; 84012
	dr $84012, $840c0

Func_840c0:: ; 840c0
	dr $840c0, $87a3f

SECTION "Bank 22", ROMX, BANK [$22]
	dr $88000, $896ea

SECTION "Bank 23", ROMX, BANK [$23]
	dr $8c000, $8ff15

SECTION "Bank 24", ROMX, BANK [$24]
Data_90000:: ; 90000
	dr $90000, $93e1d

SECTION "Bank 25", ROMX, BANK [$25]
	dr $94000, $97eee

SECTION "Bank 26", ROMX, BANK [$26]
	dr $98000, $99880

Data_99880:: ; 99880
	dr $99880, $9a4d0

Data_9a4d0:: ; 9a4d0
	dr $9a4d0, $9bc4b

SECTION "Bank 27", ROMX, BANK [$27]
	dr $9c000, $9cf0f

Func_9cf0f:: ; 9cf0f
	dr $9cf0f, $9d0ff

Func_9d0ff:: ; 9d0ff
	dr $9d0ff, $9d106

Func_9d106:: ; 9d106
	dr $9d106, $9d130

Func_9d130:: ; 9d130
	dr $9d130, $9fc25

SECTION "Bank 28", ROMX, BANK [$28]
	dr $a0000, $a3e69

SECTION "Bank 29", ROMX, BANK [$29]
	dr $a4000, $a4f4e

Func_a4f4e:: ; a4f4e
	dr $a4f4e, $a507a

Func_a507a:: ; a507a
	dr $a507a, $a509b

Func_a509b:: ; a509b
	dr $a509b, $a50c5

Func_a50c5:: ; a50c5
	dr $a50c5, $a5383

Func_a5383:: ; a5383
	dr $a5383, $a6daa

SECTION "Bank 2a", ROMX, BANK [$2a]
	dr $a8000, $a9c59

SECTION "Bank 2b", ROMX, BANK [$2b]
	dr $ac000, $afafe

SECTION "Bank 2c", ROMX, BANK [$2c]
	dr $b0000, $b2a9a

SECTION "Bank 2d", ROMX, BANK [$2d]
	dr $b4000, $b6aa8

Func_b6aa8:: ; b6aa8
	dr $b6aa8, $b6bdf

Func_b6bdf:: ; b6bdf
	dr $b6bdf, $b6c95

SECTION "Bank 2e", ROMX, BANK [$2e]
	dr $b8000, $b8156

Func_b8156:: ; b8156
	dr $b8156, $b8175

Func_b8175:: ; b8175
	dr $b8175, $b878c

Func_b878c:: ; b878c
	dr $b878c, $b8b16

Func_b8b16:: ; b8b16
	dr $b8b16, $bb12a

SECTION "Bank 2f", ROMX, BANK [$2f]
	dr $bc000, $be357

SECTION "Bank 30", ROMX, BANK [$30]
	dr $c0000, $c02c0

Func_c02c0:: ; c02c0
	dr $c02c0, $c0307

Func_c0307: ; c0307
	dr $c0307, $c0367

Func_c0367:: ; c0367
	dr $c0367, $c36e6

SECTION "Bank 31", ROMX, BANK [$31]
	dr $c4000, $c727a

Func_c727a:: ; c727a
	dr $c727a, $c738a

Func_c738a:: ; c738a
	dr $c738a, $c7391

Func_c7391:: ; c7391
	dr $c7391, $c73d6

Func_c73d6:: ; c73d6
	dr $c73d6, $c7a99

Func_c7a99:: ; c7a99
	dr $c7a99, $c7aec

SECTION "Bank 32", ROMX, BANK [$32]
	dr $c8000, $cb46b

SECTION "Bank 33", ROMX, BANK [$33]
	dr $cc000, $cc2cb

SECTION "Bank 34", ROMX, BANK [$34]
	dr $d0000, $d3e90

SECTION "Bank 35", ROMX, BANK [$35]
	dr $d4000, $d56c9

Func_d56c9:: ; d56c9
	dr $d56c9, $d5828

Func_d5828:: ; d5828
	dr $d5828, $d584f

Func_d584f:: ; d584f
	dr $d584f, $d5879

Func_d5879:: ; d5879
	dr $d5879, $d6926

SECTION "Bank 36", ROMX, BANK [$36]
	dr $d8000, $dadbe

SECTION "Bank 37", ROMX, BANK [$37]
	dr $dc000, $dede9

SECTION "Bank 38", ROMX, BANK [$38]
PuzzleTilesGFX: INCBIN "gfx/stage/puzzle_tiles.2bpp"
PuzzleTilesOBGFX: INCBIN "gfx/stage/puzzle_tiles_ob.w128.2bpp"
	dr $e1800, $e2d39

SECTION "Bank 39", ROMX, BANK [$39]
	dr $e4000, $e790d

SECTION "Bank 3a", ROMX, BANK [$3a]
	dr $e8000, $ebbfa

SECTION "Bank 3b", ROMX, BANK [$3b]
	dr $ec000, $effac

SECTION "Bank 3c", ROMX, BANK [$3c]
	dr $f0000, $f3bef

SECTION "Bank 3d", ROMX, BANK [$3d]
	dr $f4000, $f7ce0

SECTION "Bank 3e", ROMX, BANK [$3e]
	dr $f8000, $fbf78

SECTION "Bank 3f", ROMX, BANK [$3f]
	dr $fc000, $ff6d0

SECTION "Bank 40", ROMX, BANK [$40]
	dr $100000, $10130e

Func_10130e: ; 10130e
	dr $10130e, $101351

Data_101351: ; 101351
; address, value to be loaded there
	dr $101351, $102f36

SECTION "Bank 41", ROMX, BANK [$41]
Func_104000:: ; 104000
	dr $104000, $104222

Func_104222:: ; 104222
	dr $104222, $10424f

Func_10424f:: ; 10424f
	dr $10424f, $1042b3

Func_1042b3:: ; 1042b3
	dr $1042b3, $1042c6

Func_1042c6:: ; 1042c6
	dr $1042c6, $106719

Func_106719:: ; 106719
	dr $106719, $106865

Func_106865:: ; 106865
	dr $106865, $106992

Func_106992:: ; 106992
	dr $106992, $106d4a

SECTION "Bank 42", ROMX, BANK [$42]
	dr $108000, $108018

Func_108018:: ; 108018
	dr $108018, $108040

Func_108040:: ; 108040
	dr $108040, $10aa21

SECTION "Bank 43", ROMX, BANK [$43]
Func_10c000:: ; 10c000
	dr $10c000, $10c011

Func_10c011:: ; 10c011
	dr $10c011, $10eb1e

SECTION "Bank 44", ROMX, BANK [$44]
	dr $110000, $112079

SECTION "Bank 45", ROMX, BANK [$45]
	dr $114000, $117cb2

SECTION "Bank 46", ROMX, BANK [$46]
	dr $118000, $11bc47

SECTION "Bank 47", ROMX, BANK [$47]
	dr $11c000, $11cf65

SECTION "Bank 48", ROMX, BANK [$48]
	dr $120000, $122e65

SECTION "Bank 49", ROMX, BANK [$49]
	dr $124000, $1263fb

SECTION "Bank 4a", ROMX, BANK [$4a]
	dr $128000, $12ae1a

SECTION "Bank 4b", ROMX, BANK [$4b]
	dr $12c000, $12dc90

SECTION "Bank 4c", ROMX, BANK [$4c]
	dr $130000, $132c78

SECTION "Bank 4d", ROMX, BANK [$4d]
	dr $134000, $136a94

SECTION "Bank 4e", ROMX, BANK [$4e]
	dr $138000, $139126

SECTION "Bank 4f", ROMX, BANK [$4f]
	dr $13c000, $13ffb5

SECTION "Bank 50", ROMX, BANK [$50]
	dr $140000, $14394b

SECTION "Bank 51", ROMX, BANK [$51]
	dr $144000, $147a09

SECTION "Bank 52", ROMX, BANK [$52]
	dr $148000, $149e4d

SECTION "Bank 53", ROMX, BANK [$53]
	dr $14c000, $14f273

SECTION "Bank 54", ROMX, BANK [$54]
	dr $150000, $152c90

SECTION "Bank 55", ROMX, BANK [$55]
	dr $154000, $1579f2

SECTION "Bank 56", ROMX, BANK [$56]
	dr $158000, $15bdf6

SECTION "Bank 57", ROMX, BANK [$57]
	dr $15c000, $15ea77

SECTION "Bank 58", ROMX, BANK [$58]
	dr $160000, $160445

Data_160445:: ; 160445
	dr $160445, $16044d

Data_16044d:: ; 16044d
	dr $16044d, $1604c5

Data_1604c5:: ; 1604c5
	dr $1604c5, $1604ce

Data_1604ce:: ; 1604ce
	dr $1604ce, $1604ed

SECTION "Bank 59", ROMX, BANK [$59]
	dr $164000, $167ea3

SECTION "Bank 5a", ROMX, BANK [$5a]
	dr $168000, $16bdad

SECTION "Bank 5b", ROMX, BANK [$5b]
	dr $16c000, $16ff9e

SECTION "Bank 5c", ROMX, BANK [$5c]
	dr $170000, $170c98

SECTION "Bank 60", ROMX, BANK [$60]
	dr $180000, $180d40

Data_180d40:: ; 180d40
	dr $180d40, $181ae2

SECTION "Bank 61", ROMX, BANK [$61]
	dr $184000, $187ca9

SECTION "Bank 62", ROMX, BANK [$62]
	dr $188000, $18bbae

SECTION "Bank 63", ROMX, BANK [$63]
	dr $18c000, $18fc9a

SECTION "Bank 64", ROMX, BANK [$64]
	dr $190000, $192640

SECTION "Bank 66", ROMX, BANK [$66]
	dr $198000, $198c03

Func_198c03:: ; 198c03
	dr $198c03, $198c5c

Func_198c5c:: ; 198c5c
	dr $198c5c, $198ccf
