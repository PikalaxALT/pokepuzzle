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
	dr $10018, $1013d

Data_1013d::
	dr $1013d, $1025e

Func_1025e::
	dr $1025e, $10996

Func_10996::
	dr $10996, $109c0

Func_109c0::
	dr $109c0, $13cf1

SECTION "Bank 05", ROMX, BANK [$05]
	dr $14000, $17464

SECTION "Bank 06", ROMX, BANK [$06]
	dr $18000, $1aa77

SECTION "Bank 07", ROMX, BANK [$07]
	dr $1c000, $1f1e1

SECTION "Bank 08", ROMX, BANK [$08]
	dr $20000, $21fd3

SECTION "Bank 09", ROMX, BANK [$09]
	dr $24000, $26257

SECTION "Bank 0a", ROMX, BANK [$0a]
	dr $28000, $29c35

SECTION "Bank 0b", ROMX, BANK [$0b]
	dr $2c000, $2fc63

SECTION "Bank 0c", ROMX, BANK [$0c]
	dr $30000, $33ff1

SECTION "Bank 0d", ROMX, BANK [$0d]
	dr $34000, $37d5d

SECTION "Bank 0e", ROMX, BANK [$0e]
	dr $38000, $3b535

SECTION "Bank 0f", ROMX, BANK [$0f]
	dr $3c000, $3db9c

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
	dr $48825, $4a7c4

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
	dr $64000, $673ab

SECTION "Bank 1a", ROMX, BANK [$1a]
	dr $68000, $6a7b4

Func_6a7b4::
	dr $6a7b4, $6be85

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
	dr $7c000, $7e21d

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
	dr $80fa3, $8371e

SECTION "Bank 21", ROMX, BANK [$21]
	dr $84000, $87a3f

SECTION "Bank 22", ROMX, BANK [$22]
	dr $88000, $896ea

SECTION "Bank 23", ROMX, BANK [$23]
	dr $8c000, $8ff15

SECTION "Bank 24", ROMX, BANK [$24]
	dr $90000, $93e1d

SECTION "Bank 25", ROMX, BANK [$25]
	dr $94000, $97eee

SECTION "Bank 26", ROMX, BANK [$26]
	dr $98000, $9bc4b

SECTION "Bank 27", ROMX, BANK [$27]
	dr $9c000, $9fc25

SECTION "Bank 28", ROMX, BANK [$28]
	dr $a0000, $a3e69

SECTION "Bank 29", ROMX, BANK [$29]
	dr $a4000, $a6daa

SECTION "Bank 2a", ROMX, BANK [$2a]
	dr $a8000, $a9c59

SECTION "Bank 2b", ROMX, BANK [$2b]
	dr $ac000, $afafe

SECTION "Bank 2c", ROMX, BANK [$2c]
	dr $b0000, $b2a9a

SECTION "Bank 2d", ROMX, BANK [$2d]
	dr $b4000, $b6c95

SECTION "Bank 2e", ROMX, BANK [$2e]
	dr $b8000, $bb12a

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
	dr $d4000, $d6926

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
	dr $104000, $106d4a

SECTION "Bank 42", ROMX, BANK [$42]
	dr $108000, $108018

Func_108018::
	dr $108018, $108040

Func_108040::
	dr $108040, $10aa21

SECTION "Bank 43", ROMX, BANK [$43]
Func_10c000::
	dr $10c000, $10eb1e

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
	dr $160000, $1604ed

SECTION "Bank 59", ROMX, BANK [$59]
	dr $164000, $167ea3

SECTION "Bank 5a", ROMX, BANK [$5a]
	dr $168000, $16bdad

SECTION "Bank 5b", ROMX, BANK [$5b]
	dr $16c000, $16ff9e

SECTION "Bank 5c", ROMX, BANK [$5c]
	dr $170000, $170c98

SECTION "Bank 60", ROMX, BANK [$60]
	dr $180000, $181ae2

SECTION "Bank 61", ROMX, BANK [$61]
	dr $184000, $187ca9

SECTION "Bank 62", ROMX, BANK [$62]
	dr $188000, $18bbae

SECTION "Bank 63", ROMX, BANK [$63]
	dr $18c000, $18fc9a

SECTION "Bank 64", ROMX, BANK [$64]
	dr $190000, $192640

SECTION "Bank 66", ROMX, BANK [$66]
	dr $198000, $198ccf
