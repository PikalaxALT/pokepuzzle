

dr: MACRO
INCBIN "baserom.gbc", \1, \2 - \1
ENDM

dbw: MACRO
	db \1
	dw \2
	ENDM

dba: MACRO
	dbw BANK(\1), \1
	ENDM

dwb: MACRO
	dw \1
	db \2
	ENDM

dab: MACRO
	dwb \1, BANK(\1)
	ENDM

RGB: MACRO
	dw (\3 << 10) | (\2 << 5) | (\1)
	ENDM
