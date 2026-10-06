INCLUDE "constants/hardware_constants.asm"
SECTION "Palette Load Routine", ROMX

; Since we are called from ROM0 which already bankswitched to BANK(LoadGBCPalettes),
; we must NOT bankswitch here, because replacing the ROMX bank we are currently running from
; will crash the game!
; The palettes are also in ROMX. So we must put LoadGBCPalettes and BG_Palettes in the SAME bank!
LoadGBCPalettes::
    ; Setup Background Palette Index (auto increment)
    ld a, $80
    ldh [rBCPS], a

    ; Copy 64 bytes (8 palettes * 4 colors * 2 bytes)
    ld hl, BG_Palettes
    ld c, LOW(rBCPD)
    ld b, 64
.loop:
    ld a, [hli]
    ldh [c], a
    dec b
    jr nz, .loop

    ret

; 8 palettes of 4 colors (2 bytes per color, RGB555)
BG_Palettes::
    ; Palette 0 (Black, Dark Gray, Light Gray, White)
    dw $0000, $3DEF, $6B5A, $7FFF
    ; Palette 1
    dw $0000, $011F, $03E0, $7C00
    ; Palette 2
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 3
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 4
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 5
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 6
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 7
    dw $0000, $7FFF, $7FFF, $7FFF

LoadGBCObjectPalettes::
    ; Setup Object Palette Index (auto increment)
    ld a, $80
    ldh [rOCPS], a

    ; Copy 64 bytes (8 palettes * 4 colors * 2 bytes)
    ld hl, OBJ_Palettes
    ld c, LOW(rOCPD)
    ld b, 64
.loop:
    ld a, [hli]
    ldh [c], a
    dec b
    jr nz, .loop

    ret

; 8 palettes of 4 colors (2 bytes per color, RGB555)
OBJ_Palettes::
    ; Palette 0 (Transparent, Dark Gray, Light Gray, White)
    dw $0000, $3DEF, $6B5A, $7FFF
    ; Palette 1 (Transparent, Red, Green, Blue)
    dw $0000, $001F, $03E0, $7C00
    ; Palette 2
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 3
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 4
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 5
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 6
    dw $0000, $7FFF, $7FFF, $7FFF
    ; Palette 7
