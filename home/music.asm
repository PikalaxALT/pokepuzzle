Func_10c4::
	ld de, MBC5RomBank
	ld a, [hROMBank]
	push af
	ld a, [wc5fc]
	ld [hROMBank], a
	ld [de], a
	ld l, c
	ld h, b
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop af
	ld [hROMBank], a
	ld [de], a
	jp Func_80023

Func_10dc::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc61e], a
	ld a, [hld]
	ld [wc61f], a
	pop af
	bankswitch
	ret

Func_10f5::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [bc]
	ld l, a
	pop af
	bankswitch
	jp Func_803e6

Func_110a::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld l, c
	ld h, b
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop af
	bankswitch
	jp Func_803e3

Func_1122::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc624], a
	ld a, [hli]
	ld [wc625], a
	ld a, [hli]
	ld [wc629], a
	ld a, [hli]
	ld [wc62a], a
	pop af
	bankswitch
	ret

Func_1143::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [bc]
	ld e, a
	pop af
	bankswitch
	ret

Func_1156::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc6c3], a
	ld a, [hld]
	ld [wc6c4], a
	pop af
	bankswitch
	ret

Func_116f::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	call wc6c2
	pop af
	bankswitch
	ret

Func_1183::
	ld de, MBC5RomBank
	ld a, [hROMBank]
	push af
	ld a, [wc5fc]
	ld [hROMBank], a
	ld [de], a
	ld l, c
	ld h, b
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop af
	ld [hROMBank], a
	ld [de], a
	jp Func_80548

Func_119b::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc64e], a
	ld a, [hld]
	ld [wc64f], a
	pop af
	bankswitch
	ret

Func_11b4::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [bc]
	ld l, a
	pop af
	bankswitch
	jp Func_8090b

Func_11c9::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld l, c
	ld h, b
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop af
	bankswitch
	jp Func_80908

Func_11e1::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc654], a
	ld a, [hli]
	ld [wc655], a
	ld a, [hli]
	ld [wc659], a
	ld a, [hli]
	ld [wc65a], a
	pop af
	bankswitch
	ret

Func_1202::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [bc]
	ld e, a
	pop af
	bankswitch
	ret

Func_1215::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc6c6], a
	ld a, [hld]
	ld [wc6c7], a
	pop af
	bankswitch
	ret

Func_122e::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	call wc6c5
	pop af
	bankswitch
	ret

Func_1242::
	ld de, MBC5RomBank
	ld a, [hROMBank]
	push af
	ld a, [wc5fc]
	ld [hROMBank], a
	ld [de], a
	ld l, c
	ld h, b
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop af
	ld [hROMBank], a
	ld [de], a
	jp Func_80a6d

Func_125a::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc67e], a
	ld a, [hld]
	ld [wc67f], a
	pop af
	bankswitch
	ret

Func_1273::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [bc]
	ld l, a
	pop af
	bankswitch
	jp Func_80e34

Func_1288::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld l, c
	ld h, b
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop af
	bankswitch
	jp Func_80e31

Func_12a0::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc684], a
	ld a, [hli]
	ld [wc685], a
	ld a, [hli]
	ld [wc689], a
	ld a, [hli]
	ld [wc68a], a
	pop af
	bankswitch
	ret

Func_12c1::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [bc]
	ld e, a
	pop af
	bankswitch
	ret

Func_12d4::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc6c9], a
	ld a, [hld]
	ld [wc6ca], a
	pop af
	bankswitch
	ret

Func_12ed::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	call wc6c8
	pop af
	bankswitch
	ret

Func_1301::
	ld de, MBC5RomBank
	ld a, [hROMBank]
	push af
	ld a, [wc5fc]
	ld [hROMBank], a
	ld [de], a
	ld l, c
	ld h, b
	ld a, [hli]
	ld c, a
	ld b, [hl]
	pop af
	ld [hROMBank], a
	ld [de], a
	jp Func_80fa3

Func_1319::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc6b4], a
	ld a, [hli]
	ld [wc6b5], a
	ld a, [hli]
	ld [wc6b9], a
	ld a, [hli]
	ld [wc6ba], a
	pop af
	bankswitch
	ret

Func_133a::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [bc]
	ld e, a
	pop af
	bankswitch
	ret

Func_134d::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	ld a, [hli]
	ld [wc6cc], a
	ld a, [hld]
	ld [wc6cd], a
	pop af
	bankswitch
	ret

Func_1366::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	call wc6cb
	pop af
	bankswitch
	ret

