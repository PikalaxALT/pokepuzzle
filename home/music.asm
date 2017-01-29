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



Func_137a::
	homecall Func_81383
	homecall Func_84000
	ret

Func_13a1::
	push af
	push hl
	ld l, a
	ld a, [wc601]
	and a
	jr nz, .asm_13bd
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	call Func_813ba
	pop af
	bankswitch
.asm_13bd
	pop hl
	pop af
	ret

Func_13c0::
	ld de, MBC5RomBank
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	ld [hROMBank], a
	ld [de], a
	ld a, [hld]
	ld [wc5fc], a
	ld a, [hld]
	ld l, [hl]
	ld h, a
	pop af
	ld [hROMBank], a
	ld [de], a
	ret

Func_13d7::
	ld a, [hROMBank]
	push af
	ld a, [wc5fc]
	bankswitch
	ld a, [hli]
	ld e, a
	pop af
	bankswitch
	ret

Func_13eb:: ; 13eb (0:13eb)
	homecall Func_84012
	homecall Func_814c5
	ret

Func_1412::
	ld hl, MBC5RomBank
	ld a, [hROMBank]
	push af
	ld a, [wc5fc]
	ld [hROMBank], a
	ld [hl], a
	ld a, [bc]
	inc bc
	ld e, a
	pop af
	ld [hROMBank], a
	ld [hl], a
	ret

Func_1426::
	homecall Func_840c0
	homecall Func_8143e
	ret

Func_144d::
	ld e, a
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
	call Func_816fd
	pop af
	bankswitch
	ret

Func_1462::
	homecall Func_81817
	ret

Func_1476::
	ld a, [hROMBank]
	push af
	ld a, MUSIC_ENGINE
	bankswitch
.asm_1480
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_1480
	pop af
	bankswitch
	ret

Func_148d::
	homecall Func_81468
	ret

Func_14a1::
	homecall Func_81482
	ret

Func_14b5::
	homecall Func_81490
	ret

Func_14c9::
	homecall Func_814a9
	ret

Func_14dd::
	ld a, [wc601]
	and a
	jr z, .asm_14e5
	scf
	ret

.asm_14e5
	ld a, [wc5fd]
	and a
	ret nz
	ld a, [wc60a]
	and a
	ret nz
	ld a, [wc63a]
	and a
	ret nz
	ld a, [wc66a]
	and a
	ret nz
	ld a, [wc69a]
	and a
	ret nz
	scf
	ret

Func_1500::
	homecall Func_81857
	ret
