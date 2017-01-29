INCLUDE "includes.asm"
SECTION "Bank 01", ROMX, BANK [$01]
Softlock_4000::
	jp Softlock_4000

Func_4003::
	dr $4003, $8000

SECTION "Bank 02", ROMX, BANK [$02]
	dr $8000, $c000

SECTION "Bank 03", ROMX, BANK [$03]
Func_c000::
	dr $c000, $c04e

Func_c04e::
	dr $c04e, $d08b

Func_d08b::
	dr $d08b, $10000

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
	dr $109c0, $14000

SECTION "Bank 05", ROMX, BANK [$05]
	dr $14000, $18000

SECTION "Bank 06", ROMX, BANK [$06]
	dr $18000, $1c000

SECTION "Bank 07", ROMX, BANK [$07]
	dr $1c000, $20000

SECTION "Bank 08", ROMX, BANK [$08]
	dr $20000, $24000

SECTION "Bank 09", ROMX, BANK [$09]
	dr $24000, $28000

SECTION "Bank 0a", ROMX, BANK [$0a]
	dr $28000, $2c000

SECTION "Bank 0b", ROMX, BANK [$0b]
	dr $2c000, $30000

SECTION "Bank 0c", ROMX, BANK [$0c]
	dr $30000, $34000

SECTION "Bank 0d", ROMX, BANK [$0d]
	dr $34000, $38000

SECTION "Bank 0e", ROMX, BANK [$0e]
	dr $38000, $3c000

SECTION "Bank 0f", ROMX, BANK [$0f]
	dr $3c000, $40000

SECTION "Bank 10", ROMX, BANK [$10]
	dr $40000, $44000

SECTION "Bank 11", ROMX, BANK [$11]
	dr $44000, $46b39

Func_46b39::
	dr $46b39, $46e47

Func_46e47::
	dr $46e47, $48000

SECTION "Bank 12", ROMX, BANK [$12]
	dr $48000, $48825

Func_48825::
	dr $48825, $4c000

SECTION "Bank 13", ROMX, BANK [$13]
	dr $4c000, $4c219

Func_4c219::
	dr $4c219, $50000

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
	dr $5343d, $54000

SECTION "Bank 15", ROMX, BANK [$15]
	dr $54000, $5485a

Func_5485a::
	dr $5485a, $55282

Func_55282::
	dr $55282, $55ded

Func_55ded::
	dr $55ded, $56aa2

Func_56aa2::
	dr $56aa2, $58000

SECTION "Bank 16", ROMX, BANK [$16]
	dr $58000, $58d49

Func_58d49::
	dr $58d49, $58d64

Func_58d64::
	dr $58d64, $5c000

SECTION "Bank 17", ROMX, BANK [$17]
	dr $5c000, $5d40c

Func_5d40c::
	dr $5d40c, $60000

SECTION "Bank 18", ROMX, BANK [$18]
Func_60000::
	dr $60000, $608c0

Func_608c0::
	dr $608c0, $617fb

Func_617fb::
	dr $617fb, $64000

SECTION "Bank 19", ROMX, BANK [$19]
	dr $64000, $68000

SECTION "Bank 1a", ROMX, BANK [$1a]
	dr $68000, $6a7b4

Func_6a7b4::
	dr $6a7b4, $6c000

SECTION "Bank 1b", ROMX, BANK [$1b]
	dr $6c000, $70000

SECTION "Bank 1c", ROMX, BANK [$1c]
	dr $70000, $74000

SECTION "Bank 1d", ROMX, BANK [$1d]
Func_74000::
	dr $74000, $74140

Func_74140::
	dr $74140, $78000

SECTION "Bank 1e", ROMX, BANK [$1e]
	dr $78000, $7c000

SECTION "Bank 1f", ROMX, BANK [$1f]
	dr $7c000, $80000

SECTION "Bank 20", ROMX, BANK [$20]
	dr $80000, $84000

SECTION "Bank 21", ROMX, BANK [$21]
	dr $84000, $88000

SECTION "Bank 22", ROMX, BANK [$22]
	dr $88000, $8c000

SECTION "Bank 23", ROMX, BANK [$23]
	dr $8c000, $90000

SECTION "Bank 24", ROMX, BANK [$24]
	dr $90000, $94000

SECTION "Bank 25", ROMX, BANK [$25]
	dr $94000, $98000

SECTION "Bank 26", ROMX, BANK [$26]
	dr $98000, $9c000

SECTION "Bank 27", ROMX, BANK [$27]
	dr $9c000, $a0000

SECTION "Bank 28", ROMX, BANK [$28]
	dr $a0000, $a4000

SECTION "Bank 29", ROMX, BANK [$29]
	dr $a4000, $a8000

SECTION "Bank 2a", ROMX, BANK [$2a]
	dr $a8000, $ac000

SECTION "Bank 2b", ROMX, BANK [$2b]
	dr $ac000, $b0000

SECTION "Bank 2c", ROMX, BANK [$2c]
	dr $b0000, $b4000

SECTION "Bank 2d", ROMX, BANK [$2d]
	dr $b4000, $b8000

SECTION "Bank 2e", ROMX, BANK [$2e]
	dr $b8000, $bc000

SECTION "Bank 2f", ROMX, BANK [$2f]
	dr $bc000, $c0000

SECTION "Bank 30", ROMX, BANK [$30]
	dr $c0000, $c02c0

Func_c02c0::
	dr $c02c0, $c0367

Func_c0367::
	dr $c0367, $c4000

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
	dr $c7a99, $c8000

SECTION "Bank 32", ROMX, BANK [$32]
	dr $c8000, $cc000

SECTION "Bank 33", ROMX, BANK [$33]
	dr $cc000, $d0000

SECTION "Bank 34", ROMX, BANK [$34]
	dr $d0000, $d4000

SECTION "Bank 35", ROMX, BANK [$35]
	dr $d4000, $d8000

SECTION "Bank 36", ROMX, BANK [$36]
	dr $d8000, $dc000

SECTION "Bank 37", ROMX, BANK [$37]
	dr $dc000, $e0000

SECTION "Bank 38", ROMX, BANK [$38]
	dr $e0000, $e4000

SECTION "Bank 39", ROMX, BANK [$39]
	dr $e4000, $e8000

SECTION "Bank 3a", ROMX, BANK [$3a]
	dr $e8000, $ec000

SECTION "Bank 3b", ROMX, BANK [$3b]
	dr $ec000, $f0000

SECTION "Bank 3c", ROMX, BANK [$3c]
	dr $f0000, $f4000

SECTION "Bank 3d", ROMX, BANK [$3d]
	dr $f4000, $f8000

SECTION "Bank 3e", ROMX, BANK [$3e]
	dr $f8000, $fc000

SECTION "Bank 3f", ROMX, BANK [$3f]
	dr $fc000, $100000

SECTION "Bank 40", ROMX, BANK [$40]
	dr $100000, $104000

SECTION "Bank 41", ROMX, BANK [$41]
	dr $104000, $108000

SECTION "Bank 42", ROMX, BANK [$42]
	dr $108000, $108018

Func_108018::
	dr $108018, $108040

Func_108040::
	dr $108040, $10c000

SECTION "Bank 43", ROMX, BANK [$43]
Func_10c000::
	dr $10c000, $110000

SECTION "Bank 44", ROMX, BANK [$44]
	dr $110000, $114000

SECTION "Bank 45", ROMX, BANK [$45]
	dr $114000, $118000

SECTION "Bank 46", ROMX, BANK [$46]
	dr $118000, $11c000

SECTION "Bank 47", ROMX, BANK [$47]
	dr $11c000, $120000

SECTION "Bank 48", ROMX, BANK [$48]
	dr $120000, $124000

SECTION "Bank 49", ROMX, BANK [$49]
	dr $124000, $128000

SECTION "Bank 4a", ROMX, BANK [$4a]
	dr $128000, $12c000

SECTION "Bank 4b", ROMX, BANK [$4b]
	dr $12c000, $130000

SECTION "Bank 4c", ROMX, BANK [$4c]
	dr $130000, $134000

SECTION "Bank 4d", ROMX, BANK [$4d]
	dr $134000, $138000

SECTION "Bank 4e", ROMX, BANK [$4e]
	dr $138000, $13c000

SECTION "Bank 4f", ROMX, BANK [$4f]
	dr $13c000, $140000

SECTION "Bank 50", ROMX, BANK [$50]
	dr $140000, $144000

SECTION "Bank 51", ROMX, BANK [$51]
	dr $144000, $148000

SECTION "Bank 52", ROMX, BANK [$52]
	dr $148000, $14c000

SECTION "Bank 53", ROMX, BANK [$53]
	dr $14c000, $150000

SECTION "Bank 54", ROMX, BANK [$54]
	dr $150000, $154000

SECTION "Bank 55", ROMX, BANK [$55]
	dr $154000, $158000

SECTION "Bank 56", ROMX, BANK [$56]
	dr $158000, $15c000

SECTION "Bank 57", ROMX, BANK [$57]
	dr $15c000, $160000

SECTION "Bank 58", ROMX, BANK [$58]
	dr $160000, $164000

SECTION "Bank 59", ROMX, BANK [$59]
	dr $164000, $168000

SECTION "Bank 5a", ROMX, BANK [$5a]
	dr $168000, $16c000

SECTION "Bank 5b", ROMX, BANK [$5b]
	dr $16c000, $170000

SECTION "Bank 5c", ROMX, BANK [$5c]
	dr $170000, $174000

SECTION "Bank 5d", ROMX, BANK [$5d]
	dr $174000, $178000

SECTION "Bank 5e", ROMX, BANK [$5e]
	dr $178000, $17c000

SECTION "Bank 5f", ROMX, BANK [$5f]
	dr $17c000, $180000

SECTION "Bank 60", ROMX, BANK [$60]
	dr $180000, $184000

SECTION "Bank 61", ROMX, BANK [$61]
	dr $184000, $188000

SECTION "Bank 62", ROMX, BANK [$62]
	dr $188000, $18c000

SECTION "Bank 63", ROMX, BANK [$63]
	dr $18c000, $190000

SECTION "Bank 64", ROMX, BANK [$64]
	dr $190000, $194000

SECTION "Bank 65", ROMX, BANK [$65]
	dr $194000, $198000

SECTION "Bank 66", ROMX, BANK [$66]
	dr $198000, $19c000

SECTION "Bank 67", ROMX, BANK [$67]
	dr $19c000, $1a0000

SECTION "Bank 68", ROMX, BANK [$68]
	dr $1a0000, $1a4000

SECTION "Bank 69", ROMX, BANK [$69]
	dr $1a4000, $1a8000

SECTION "Bank 6a", ROMX, BANK [$6a]
	dr $1a8000, $1ac000

SECTION "Bank 6b", ROMX, BANK [$6b]
	dr $1ac000, $1b0000

SECTION "Bank 6c", ROMX, BANK [$6c]
	dr $1b0000, $1b4000

SECTION "Bank 6d", ROMX, BANK [$6d]
	dr $1b4000, $1b8000

SECTION "Bank 6e", ROMX, BANK [$6e]
	dr $1b8000, $1bc000

SECTION "Bank 6f", ROMX, BANK [$6f]
	dr $1bc000, $1c0000

SECTION "Bank 70", ROMX, BANK [$70]
	dr $1c0000, $1c4000

SECTION "Bank 71", ROMX, BANK [$71]
	dr $1c4000, $1c8000

SECTION "Bank 72", ROMX, BANK [$72]
	dr $1c8000, $1cc000

SECTION "Bank 73", ROMX, BANK [$73]
	dr $1cc000, $1d0000

SECTION "Bank 74", ROMX, BANK [$74]
	dr $1d0000, $1d4000

SECTION "Bank 75", ROMX, BANK [$75]
	dr $1d4000, $1d8000

SECTION "Bank 76", ROMX, BANK [$76]
	dr $1d8000, $1dc000

SECTION "Bank 77", ROMX, BANK [$77]
	dr $1dc000, $1e0000

SECTION "Bank 78", ROMX, BANK [$78]
	dr $1e0000, $1e4000

SECTION "Bank 79", ROMX, BANK [$79]
	dr $1e4000, $1e8000

SECTION "Bank 7a", ROMX, BANK [$7a]
	dr $1e8000, $1ec000

SECTION "Bank 7b", ROMX, BANK [$7b]
	dr $1ec000, $1f0000

SECTION "Bank 7c", ROMX, BANK [$7c]
	dr $1f0000, $1f4000

SECTION "Bank 7d", ROMX, BANK [$7d]
	dr $1f4000, $1f8000

SECTION "Bank 7e", ROMX, BANK [$7e]
	dr $1f8000, $1fc000

SECTION "Bank 7f", ROMX, BANK [$7f]
	dr $1fc000, $200000

