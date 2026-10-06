INCLUDE "macros/audio.asm"
INCLUDE "macros/const.asm"
INCLUDE "macros/data.asm"

bankswitch: MACRO
	ld a, (\1)
	ld [$2000], a
ENDM
