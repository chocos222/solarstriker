INCLUDE "constants/hardware_constants.asm"
SECTION "Palette Load Routine", ROMX

LoadGBCPalettes::
    ld a, $80
    ldh [rBCPS], a
    ld hl, BG_Palettes
    ld c, LOW(rBCPD)
    ld b, 64
.loop_bg:
    ld a, [hli]
    ldh [c], a
    dec b
    jr nz, .loop_bg

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
    ret

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
