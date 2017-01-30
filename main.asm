INCLUDE "includes.asm"
SECTION "Bank 01", ROMX, BANK [$01]
Softlock_4000::
	jp Softlock_4000

Func_4003::
	dr $4003, $7650

SECTION "Bank 02", ROMX, BANK [$02]
	dr $8000, $b9ec

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

Func_1011c::
	dr $1011c, $1013d

Data_1013d::
	dr $1013d, $1025e

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
	dr $40000, $4334d

SECTION "Bank 11", ROMX, BANK [$11]
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
	dr $68000, $68c73

Func_68c73::
	dr $68c73, $68d42

Func_68d42::
	dr $68d42, $68ef9

Data_68ef9::
	dr $68ef9, $6a7b4

Func_6a7b4::
	dr $6a7b4, $6af04

Func_6af04::
	dr $6af04, $6be85

SECTION "Bank 1b", ROMX, BANK [$1b]
	dr $6c000, $6f3bc

SECTION "Bank 1c", ROMX, BANK [$1c]
	dr $70000, $73cfe

SECTION "Bank 1d", ROMX, BANK [$1d]
Func_74000::
	dr $74000, $74140

Func_74140::
	dr $74140, $77a38

SECTION "Bank 1e", ROMX, BANK [$1e]
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
