INCLUDE "constants/hardware_constants.asm"
SECTION "Palette Load Routine", ROMX

LoadGBCPalettesWRAMTrampoline::
    ld a, BANK(BG_Palettes)
    ld [$2000], a ; Bank switch to palette bank
    ld a, $80
    ldh [rBCPS], a

    ; WRAM executes from $C000 area.
    ; Wait, BG_Palettes is a memory address in ROMX.
    ; Is WRAM properly resolving the correct HL pointer when we execute from WRAM?
    ; Yes, because HL contains the immediate pointer resolved by the linker.

    ld hl, BG_Palettes
    ld c, LOW(rBCPD)
    ld b, 64
.loop:
    ld a, [hli]
    ldh [c], a
    dec b
    jr nz, .loop

    ld a, $80
    ldh [rOCPS], a
    ld hl, OBJ_Palettes
    ld c, LOW(rOCPD)
    ld b, 64
.loop_obj:
    ld a, [hli]
    ldh [c], a
    dec b
    jr nz, .loop_obj

    ld a, 1
    ld [$2000], a ; restore bank 1
    ret
LoadGBCPalettesWRAMTrampolineEnd::

SECTION "Palettes", ROMX
; 8 palettes of 4 colors (2 bytes per color, RGB555)
BG_Palettes::
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000

; 8 palettes of 4 colors (2 bytes per color, RGB555)
OBJ_Palettes::
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
    dw $7FFF, $5294, $294A, $0000
