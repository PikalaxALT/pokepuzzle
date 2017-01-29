const_def: MACRO
IF _NARG > 0
const_value set \1
ELSE
const_value set 0
ENDC
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + 1
ENDM
