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
	ld hl, wd000
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
	ld hl, wd0b0
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
	ld hl, wc864
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
	ld hl, wc864
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
	ld hl, wc864
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
	and $8
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
	ld a, [wc864]
	ld b, a
	ld a, [wc865]
	ld d, a
	ld a, [wc866]
	ld e, a
	xor a
	ld [hFF8A], a
	ld a, [wcea1]
	cp $e
	jp z, Func_44a0
	cp $3
	jr z, .asm_447d
	ld hl, wc89d
	ld a, [hl]
	and a
	jr z, .asm_4427
	dec [hl]
	jp Func_44a0

.asm_4427
	ld a, [hJoyPressed]
	and $2
	jp z, Func_44a0
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
	jr nz, Func_44a0
	ld hl, wd000
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
	jr nz, Func_44a0
	ld a, [wceba]
	and a
	jr nz, .asm_4475
	call Func_7313
	and a
	jr nz, Func_44a0
.asm_4475
	ld a, $1
	ld [wc87b], a
	jp Func_46b9

.asm_447d
	ld a, [hJoyNew]
	and $2
	jp z, Func_44a0
	ld hl, wc8dc
	ld a, [wc8da]
	cp [hl]
	jr z, Func_44a0
	ld a, [wc7ce]
	and a
	jr nz, .asm_4498
	ld a, $4
	ld [wc7cb], a
.asm_4498
	ld a, $4
	ld [wc887], a
	jp Func_46b9

Func_44a0: ; 44a0 (1:44a0)
	ld a, [hJoyPressed]
	and $20
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
	and $10
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
	and $40
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
	and $80
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
	and $1
	jp z, Func_4644
	ld a, [wcad2]
	and a
	jp nz, Func_4644
	ld a, [wc881]
	and $3f
	cp $b
	jr c, .asm_4611
	ld a, [wc864]
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
	and $4
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
	ld [wc864], a
	ld a, d
	ld [wc865], a
	ld a, e
	ld [wc866], a
	ret

Func_46c6:
	dr $46c6, $4763

Func_4763:
	dr $4763, $4cf7

Func_4cf7:
	dr $4cf7, $4f43

Func_4f43:
	dr $4f43, $5146

Func_5146:
	dr $5146, $5475

Func_5475:
	dr $5475, $55fb

Func_55fb:
	dr $55fb, $6777

Func_6777:
	dr $6777, $68f6

Func_68f6:
	dr $68f6, $69b3

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
	dr $808b, $8d59

Func_8d59::
	dr $8d59, $9306

Func_9306::
	dr $9306, $9c22

Func_9c22::
	dr $9c22, $b9ec

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
	dr $40004, $4334d

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
	dr $6e509, $6f3bc

SECTION "Bank 1c", ROMX, BANK [$1c]
	dr $70000, $73cfe

SECTION "Bank 1d", ROMX, BANK [$1d]
Func_74000::
	dr $74000, $74140

Func_74140::
	dr $74140, $76ff5

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
	dr $e0000, $e2d39

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
