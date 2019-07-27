
    DEVICE ZXSPECTRUMNEXT

            opt --zxnext=cspect

            org 34304

    ;----------------------------------------------------------------------------

    ; NOTES

    ; 27.07.2019

    ; Text Editor Sublime Text with z80asm plugin
    ; compiled with SJASMPLUS 1.13.3
    ; sjasmplus --zxnext=cspect [path to to file]
    ; tile map = 40x32 tiles, and an attribute byte
    ; load all tile definitions from file into memory which de addresses starting at 24576 ($6000)

    ; graphics workflow
        ; photoshop to resize manic miner png files from Manic Miner Dissasembly to 8*8 RGB pbm file
        ; github varmfskii/zxnext_tools to convert to pbm file to tile data
        ; UDGEED Next to get color values from graphics to for 0-15 palette of colors

    ;----------------------------------------------------------------------------

    ; MEMORY MAP

    ;----------------------------------------------------------------------------

    ; $6000 : TILE MAP (1280X2 BYTES SIZE)
    ; $6500 : TILE MAP DEFINITIONS BEGIN (TILE MAP + 1280X2)
    ; $8500 : EOF TILE DEFINITIONS (TILE MAP DEFINITIONS + 8192 (256 TILES * 32))
    ; $8600 : PROGRAM CODE 

    ;----------------------------------------------------------------------------


MAIN:

;Includes
;----------------------------------------------------------------------------

    INCLUDE "../src/defines.asm"
	INCLUDE "../src/setPorts.asm"

;----------------------------------------------------------------------------

    call prepScreen                             ; zero out screen memory
    call prepBackground                         ; fill background black

    call drawInfoArea                           ; draw ULA attrs 
    call printString                            ; print Central Cavern title

;----------------------------------------------------------------------------
   
    /* 

        Set Palette Data                        ; has to be done to get appropriate color range, see ../data/palette/palette.asm

    */


    ld hl,palette                               ; data stored in file ../data/palette/palette.asm
    ld b,32

.pal
    
    ld a,(hl)
    inc hl
    nextreg $44,a
    push bc
    ld bc, $0044
    out (c),a
    pop bc

    djnz .pal

;----------------------------------------------------------------------------

    ld a,2          
    out (254),a                                 ; set border colour red

;----------------------------------------------------------------------------
; TILE MAP LOAD INTO MEMORY
;----------------------------------------------------------------------------

   /* Copy Tile Definitions Into Memory */


      ld de,tilemap+2560
      ld hl,tiles
      ld bc,tiles_end

      ldir

;----------------------------------------------------------------------------

    /* Copy Tile Map Into Memory; */	                

	ld hl, tileMapData	                        ; source of tile definition data
	ld de, tilemap	                            ; address of tilemap in memory
    ld bc, 2560                                 ; number of bytes contained within tilemap (would be 1280 if you turn off the attribute byte IO_TileMapContr)
	ldir 

;----------------------------------------------------------------------------
    
    jr $                                        ; EOP inf Loop


; 'src' Includes
;----------------------------------------------------------------------------
        
        INCLUDE "../src/subroutines.asm"

;----------------------------------------------------------------------------
; 'data' Includes

        INCLUDE "../data/palette/palette.asm"
        INCLUDE "../data/tilemap/Central Cavern.asm"
        ;INCLUDE "../data/tiles/definitions/tiles.asm"
        INCLUDE "../data/tiles/tiles.asm"

 
;----------------------------------------------------------------------------

        SAVENEX OPEN "Tiles/exe/tilemap.nex", MAIN, $ff40
        SAVENEX AUTO

;----------------------------------------------------------------------------

