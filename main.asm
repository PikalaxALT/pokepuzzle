INCLUDE "includes.asm"
SECTION "Bank 01", ROMX, BANK [$01]
Softlock_4000::
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

Func_4105::
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
	call Func_0532
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

Data_4174:
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

Func_4712:
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

Data_4731:
	db  6
	db -3, -3, $00, $00
	db  9, -3, $00, $40
	db  9, 25, $00, $60
	db -3, 25, $00, $20
	db -3, 11, $01, $00
	db  9, 11, $01, $40

Data_474a:
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

Func_4d06:
	ret

Pointers_4d07:
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

Data_4db2:
	dw $0400
	dw $0156
	dw $0100
	dw $0200

Func_4dba:
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

Func_4dfe:
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

Pointers_4ea8:
	dw Data_4eba
	dw Data_4ebb
	dw Data_4ecc
	dw Data_4edd
	dw Data_4eee
	dw Data_4eff
	dw Data_4f10
	dw Data_4f21
	dw Data_4f32

Data_4eba:
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

Data_5426:
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

Pointers_566e:
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

Pointers_5697:
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

Func_6777:
	dr $6777, $67b8

Func_67b8:
	dr $67b8, $683b

Func_683b:
	dr $683b, $688c

Func_688c:
	dr $688c, $68c1

Func_68c1:
	dr $68c1, $68f6

Func_68f6:
	dr $68f6, $693c

Func_693c:
	dr $693c, $6969

Func_6969:
	dr $6969, $6995

Func_6995:
	dr $6995, $69b3

Func_69b3:
	dr $69b3, $6c1f

Func_6c1f:
	dr $6c1f, $6df0

Func_6df0:
	dr $6df0, $6ed3

Func_6ed3:
	dr $6ed3, $6ef3

Func_6ef3:
	dr $6ef3, $7313

Func_7313:
	dr $7313, $73cc

Func_73cc:
	dr $73cc, $7650

SECTION "Bank 02", ROMX, BANK [$02]
	dr $8000, $808b

Func_808b::
	dr $808b, $8ce2

Func_8ce2:
	dr $8ce2, $8d59

Func_8d59::
	dr $8d59, $9306

Func_9306::
	dr $9306, $9c22

Func_9c22::
	dr $9c22, $b6a7

Func_b6a7:
	dr $b6a7, $b6c5

Func_b6c5:
	dr $b6c5, $b9ec

SECTION "Bank 03", ROMX, BANK [$03]
Func_c000::
	dr $c000, $c04e

Func_c04e::
	dr $c04e, $d08b

Func_d08b::
	dr $d08b, $f3a7

SECTION "Bank 04", ROMX, BANK [$04]
Func_10000::
	dr $10000, $10018

Func_10018::
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

Func_1014e::
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

Func_10199::
	dr $10199, $1025e

Func_1025e::
	dr $1025e, $1036d

Func_1036d::
	dr $1036d, $10996

Func_10996::
	dr $10996, $109c0

Func_109c0::
	dr $109c0, $10e63

Func_10e63::
	dr $10e63, $13cf1

SECTION "Bank 05", ROMX, BANK [$05]
Func_14000::
	dr $14000, $14257

Func_14257::
	dr $14257, $1442e

Func_1442e::
	dr $1442e, $17464

SECTION "Bank 06", ROMX, BANK [$06]
	dr $18000, $1813f

Func_1813f::
	dr $1813f, $1821d

Func_1821d::
	dr $1821d, $182b0

Func_182b0::
	dr $182b0, $1887e

Func_1887e::
	dr $1887e, $188a3

Func_188a3::
	dr $188a3, $188cf

Func_188cf::
	dr $188cf, $18a9d

Func_18a9d::
	dr $18a9d, $1aa77

SECTION "Bank 07", ROMX, BANK [$07]
Func_1c000::
	dr $1c000, $1c2f4

Func_1c2f4::
	dr $1c2f4, $1c524

Func_1c524::
	dr $1c524, $1c747

Func_1c747::
	dr $1c747, $1cc63

Func_1cc63::
	dr $1cc63, $1cc76

Func_1cc76::
	dr $1cc76, $1f1e1

SECTION "Bank 08", ROMX, BANK [$08]
	dr $20000, $2015a

Func_2015a::
	dr $2015a, $2027f

Func_2027f::
	dr $2027f, $21fd3

SECTION "Bank 09", ROMX, BANK [$09]
	dr $24000, $2402f

Func_2402f::
	dr $2402f, $241b4

Func_241b4::
	dr $241b4, $2435b

Func_2435b::
	dr $2435b, $244c1

Func_244c1::
	dr $244c1, $26257

SECTION "Bank 0a", ROMX, BANK [$0a]
GFX_28000::
	dr $28000, $29c35

SECTION "Bank 0b", ROMX, BANK [$0b]
	dr $2c000, $2fc63

SECTION "Bank 0c", ROMX, BANK [$0c]
	dr $30000, $30255

Func_30255::
	dr $30255, $3067d

Func_3067d::
	dr $3067d, $33ff1

SECTION "Bank 0d", ROMX, BANK [$0d]
	dr $34000, $37d5d

SECTION "Bank 0e", ROMX, BANK [$0e]
	dr $38000, $3b535

SECTION "Bank 0f", ROMX, BANK [$0f]
	dr $3c000, $3d5ab

Func_3d5ab::
	dr $3d5ab, $3d6f4

Func_3d6f4::
	dr $3d6f4, $3d706

Func_3d706::
	dr $3d706, $3db9c

SECTION "Bank 10", ROMX, BANK [$10]
	dr $40000, $40004

Func_40004::
	dr $40004, $42417

Func_42417:
	dr $42417, $4334d

SECTION "Bank 11", ROMX, BANK [$11]
Func_44000::
	dr $44000, $46b39

Func_46b39::
	dr $46b39, $46e47

Func_46e47::
	dr $46e47, $46f43

SECTION "Bank 12", ROMX, BANK [$12]
	dr $48000, $48825

Func_48825::
	dr $48825, $49420

GFX_49420::
	dr $49420, $496a0

GFX_496a0::
	dr $496a0, $4a7c4

SECTION "Bank 13", ROMX, BANK [$13]
	dr $4c000, $4c219

Func_4c219::
	dr $4c219, $4fb70

SECTION "Bank 14", ROMX, BANK [$14]
Func_50000::
    dr $50000, $5001f

Func_5001f::
	dr $5001f, $5170a

Func_5170a::
	dr $5170a, $528f3

Func_528f3::
	dr $528f3, $5343d

Func_5343d::
	dr $5343d, $53e9e

SECTION "Bank 15", ROMX, BANK [$15]
	dr $54000, $5485a

Func_5485a::
	dr $5485a, $55282

Func_55282::
	dr $55282, $55ded

Func_55ded::
	dr $55ded, $56aa2

Func_56aa2::
	dr $56aa2, $57fc8

SECTION "Bank 16", ROMX, BANK [$16]
	dr $58000, $58d49

Func_58d49::
	dr $58d49, $58d64

Func_58d64::
	dr $58d64, $5bd87

SECTION "Bank 17", ROMX, BANK [$17]
	dr $5c000, $5d40c

Func_5d40c::
	dr $5d40c, $5ea8e

SECTION "Bank 18", ROMX, BANK [$18]
Func_60000::
	dr $60000, $608c0

Func_608c0::
	dr $608c0, $617fb

Func_617fb::
	dr $617fb, $626c0

SECTION "Bank 19", ROMX, BANK [$19]
Func_64000::
	dr $64000, $649c1

Func_649c1::
	dr $649c1, $649ce

Func_649ce::
	dr $649ce, $64c67

Func_64c67::
	dr $64c67, $64db5

Func_64db5::
	dr $64db5, $65fc4

Func_65fc4::
	dr $65fc4, $661c3

Func_661c3::
	dr $661c3, $661d0

Func_661d0::
	dr $661d0, $662c3

Func_662c3::
	dr $662c3, $662dd

Func_662dd::
	dr $662dd, $673ab

SECTION "Bank 1a", ROMX, BANK [$1a]
	dr $68000, $68a0f

Func_68a0f:
	dr $68a0f, $68b3d

Func_68b3d:
	dr $68b3d, $68c73

Func_68c73::
	dr $68c73, $68d42

Func_68d42::
	dr $68d42, $68ebb

Func_68ebb::
	dr $68ebb, $68ef9

Data_68ef9::
	dr $68ef9, $69b08

Func_69b08::
	dr $69b08, $6a2f4

Func_6a2f4:
	dr $6a2f4, $6a7b4

Func_6a7b4::
	dr $6a7b4, $6af04

Func_6af04::
	dr $6af04, $6be85

SECTION "Bank 1b", ROMX, BANK [$1b]
	dr $6c000, $6c085

Func_6c085::
	dr $6c085, $6e509

Func_6e509:
	dr $6e509, $6ee9a

Func_6ee9a:
	dr $6ee9a, $6f3bc

SECTION "Bank 1c", ROMX, BANK [$1c]
	dr $70000, $70034

Func_70034:
	dr $70034, $73cfe

SECTION "Bank 1d", ROMX, BANK [$1d]
Func_74000::
	dr $74000, $74140

Func_74140::
	dr $74140, $74d05

Func_74d05:
	dr $74d05, $75a5d

Func_75a5d:
	dr $75a5d, $76ff5

Func_76ff5::
	dr $76ff5, $779a1

Func_779a1::
	dr $779a1, $77a38

SECTION "Bank 1e", ROMX, BANK [$1e]
Func_78000::
	dr $78000, $7bef5

SECTION "Bank 1f", ROMX, BANK [$1f]
Func_7c000::
	dr $7c000, $7c0a7

Func_7c0a7::
	dr $7c0a7, $7c33a

Func_7c33a::
	dr $7c33a, $7dbff

Func_7dbff::
	dr $7dbff, $7defa

Func_7defa::
	dr $7defa, $7df32

Func_7df32::
	dr $7df32, $7e055

Func_7e055::
	dr $7e055, $7e182

Func_7e182::
	dr $7e182, $7e19a

Func_7e19a::
	dr $7e19a, $7e21d

SECTION "Bank 20", ROMX, BANK [MUSIC_ENGINE]
	dr $80000, $80023

Func_80023::
	dr $80023, $803e3

Func_803e3::
	dr $803e3, $803e6

Func_803e6::
	dr $803e6, $80548

Func_80548::
	dr $80548, $80908

Func_80908::
	dr $80908, $8090b

Func_8090b::
	dr $8090b, $80a6d

Func_80a6d::
	dr $80a6d, $80e31

Func_80e31::
	dr $80e31, $80e34

Func_80e34::
	dr $80e34, $80fa3

Func_80fa3::
	dr $80fa3, $81383

Func_81383::
	dr $81383, $813ba

Func_813ba::
	dr $813ba, $8143e

Func_8143e::
	dr $8143e, $81468

Func_81468::
	dr $81468, $81482

Func_81482::
	dr $81482, $81490

Func_81490::
	dr $81490, $814a9

Func_814a9::
	dr $814a9, $814c5

Func_814c5::
	dr $814c5, $816fd

Func_816fd::
	dr $816fd, $81817

Func_81817::
	dr $81817, $81857

Func_81857::
	dr $81857, $8371e

SECTION "Bank 21", ROMX, BANK [$21]
Func_84000::
	dr $84000, $84012

Func_84012::
	dr $84012, $840c0

Func_840c0::
	dr $840c0, $87a3f

SECTION "Bank 22", ROMX, BANK [$22]
	dr $88000, $896ea

SECTION "Bank 23", ROMX, BANK [$23]
	dr $8c000, $8ff15

SECTION "Bank 24", ROMX, BANK [$24]
Data_90000::
	dr $90000, $93e1d

SECTION "Bank 25", ROMX, BANK [$25]
	dr $94000, $97eee

SECTION "Bank 26", ROMX, BANK [$26]
	dr $98000, $99880

Data_99880::
	dr $99880, $9a4d0

Data_9a4d0::
	dr $9a4d0, $9bc4b

SECTION "Bank 27", ROMX, BANK [$27]
	dr $9c000, $9cf0f

Func_9cf0f::
	dr $9cf0f, $9d0ff

Func_9d0ff::
	dr $9d0ff, $9d106

Func_9d106::
	dr $9d106, $9d130

Func_9d130::
	dr $9d130, $9fc25

SECTION "Bank 28", ROMX, BANK [$28]
	dr $a0000, $a3e69

SECTION "Bank 29", ROMX, BANK [$29]
	dr $a4000, $a4f4e

Func_a4f4e::
	dr $a4f4e, $a507a

Func_a507a::
	dr $a507a, $a509b

Func_a509b::
	dr $a509b, $a50c5

Func_a50c5::
	dr $a50c5, $a5383

Func_a5383::
	dr $a5383, $a6daa

SECTION "Bank 2a", ROMX, BANK [$2a]
	dr $a8000, $a9c59

SECTION "Bank 2b", ROMX, BANK [$2b]
	dr $ac000, $afafe

SECTION "Bank 2c", ROMX, BANK [$2c]
	dr $b0000, $b2a9a

SECTION "Bank 2d", ROMX, BANK [$2d]
	dr $b4000, $b6aa8

Func_b6aa8::
	dr $b6aa8, $b6bdf

Func_b6bdf::
	dr $b6bdf, $b6c95

SECTION "Bank 2e", ROMX, BANK [$2e]
	dr $b8000, $b8156

Func_b8156::
	dr $b8156, $b8175

Func_b8175::
	dr $b8175, $b878c

Func_b878c::
	dr $b878c, $b8b16

Func_b8b16::
	dr $b8b16, $bb12a

SECTION "Bank 2f", ROMX, BANK [$2f]
	dr $bc000, $be357

SECTION "Bank 30", ROMX, BANK [$30]
	dr $c0000, $c02c0

Func_c02c0::
	dr $c02c0, $c0367

Func_c0367::
	dr $c0367, $c36e6

SECTION "Bank 31", ROMX, BANK [$31]
	dr $c4000, $c727a

Func_c727a::
	dr $c727a, $c738a

Func_c738a::
	dr $c738a, $c7391

Func_c7391::
	dr $c7391, $c73d6

Func_c73d6::
	dr $c73d6, $c7a99

Func_c7a99::
	dr $c7a99, $c7aec

SECTION "Bank 32", ROMX, BANK [$32]
	dr $c8000, $cb46b

SECTION "Bank 33", ROMX, BANK [$33]
	dr $cc000, $cc2cb

SECTION "Bank 34", ROMX, BANK [$34]
	dr $d0000, $d3e90

SECTION "Bank 35", ROMX, BANK [$35]
	dr $d4000, $d56c9

Func_d56c9::
	dr $d56c9, $d5828

Func_d5828::
	dr $d5828, $d584f

Func_d584f::
	dr $d584f, $d5879

Func_d5879::
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
	dr $100000, $102f36

SECTION "Bank 41", ROMX, BANK [$41]
Func_104000::
	dr $104000, $104222

Func_104222::
	dr $104222, $10424f

Func_10424f::
	dr $10424f, $1042b3

Func_1042b3::
	dr $1042b3, $1042c6

Func_1042c6::
	dr $1042c6, $106719

Func_106719::
	dr $106719, $106865

Func_106865::
	dr $106865, $106992

Func_106992::
	dr $106992, $106d4a

SECTION "Bank 42", ROMX, BANK [$42]
	dr $108000, $108018

Func_108018::
	dr $108018, $108040

Func_108040::
	dr $108040, $10aa21

SECTION "Bank 43", ROMX, BANK [$43]
Func_10c000::
	dr $10c000, $10c011

Func_10c011::
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

Data_160445::
	dr $160445, $16044d

Data_16044d::
	dr $16044d, $1604c5

Data_1604c5::
	dr $1604c5, $1604ce

Data_1604ce::
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

Data_180d40::
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

Func_198c03::
	dr $198c03, $198c5c

Func_198c5c::
	dr $198c5c, $198ccf
