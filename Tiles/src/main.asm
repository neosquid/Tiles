
    DEVICE ZXSPECTRUMNEXT

            opt --zxnext=cspect

            org 34304

    ;----------------------------------------------------------------------------

    ; NOTES

    ; 28.07.2019

    ; Text Editor Sublime Text with z80asm plugin
    ; compiled with SJASMPLUS 1.13.3
    ; sjasmplus --zxnext=cspect [path to to file]
    ; tile map = 40x32 tiles, and an attribute byte
    ; load all tile definitions from file into memory which de addresses starting at 24576 ($6000)


    ; A Tile map can contain attribute bytes or no attribute bytes
    ; If a 40X32 tile map contains no attribute bytes, then it will be a size of 1280 bytes
    ; If a 40x32 tile map contains attribute bytes, then it will be a size of 2560 bytes (40x32x2)
    ; Switch between (without / with) attributes by altering the commented out code to select the cavern with attribute data
    
    ; Make changes to the commented code in the following files:
        ;   main.asm         - data and definition file includes
        ;   setPorts.asm     - attention to TILE MAP CONTROL settings
        ;   defines.asm      - tileMapDefAddr
    

    ; graphics workflow
        ; photoshop to resize manic miner png files from Manic Miner Dissasembly to 8*8 RGB pbm file
        ; V's tool to convert to pbm file to tile data
        ; UDGEED Next to get color values from graphics to for 0-15 palette of colors



    ;----------------------------------------------------------------------------

    ; MEMORY MAP

    ;----------------------------------------------------------------------------

    ; $6000 : TILE MAP (1280 BYTES SIZE)
    ; $6500 : TILE MAP DEFINITIONS BEGIN (TILE MAP + 1280)
    ; $6720 : EOF TILE DEFINITIONS (TILE MAP DEFINITIONS +  (17 TILES * 32)
    ; $8600 : PROGRAM CODE 

    ;----------------------------------------------------------------------------


MAIN:

;Includes
;----------------------------------------------------------------------------

    INCLUDE "../src/defines.asm"
	INCLUDE "../src/setPorts.asm"

;----------------------------------------------------------------------------

;  PREPARE AND DISPLAY CAVERN INFORMATION

    call prepScreen                             ; zero out screen memory
    call prepBackground                         ; fill background black
    call drawInfoArea                           ; draw ULA attrs 
    ld de, cavernTitle
    call printString                            ; print Central Cavern title
   
;----------------------------------------------------------------------------

; SET PALETTE DATA                              ; has to be done to get appropriate color range, see ../data/palette/palette.asm

;----------------------------------------------------------------------------


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

   /* COPY TILE DEFINITIONS INTO MEMORY */

    ld de,tilemap+1280                          ; If not including attribute byte in tile map
    ;ld de,tilemap+2560                         ; Including attribute byte with tile number
    ld hl,tiles
    ld bc,tiles_end
    ldir

;----------------------------------------------------------------------------

    /* COPY TILE MAP INTO MEMORY; */                    

	ld hl, tileMapData	                        ; source of tile definition data
	ld de, tilemap	                            ; address of tilemap in memory
    ld bc, 1280                                 ; number of bytes contained within tilemap (would be 1280 if you turn off the attribute byte IO_TileMapContr)
    ;ld bc, 2560                                 ; number of bytes contained within tilemap (would be 1280 if you turn off the attribute byte IO_TileMapContr)

	ldir 

;----------------------------------------------------------------------------
    
    jr $                                        ; EOP inf Loop

;----------------------------------------------------------------------------


; 'src' Includes
;----------------------------------------------------------------------------
        
        INCLUDE "../src/subroutines.asm"

;----------------------------------------------------------------------------
; 'data' Includes

        INCLUDE "../data/palette/palette.asm"
        INCLUDE "../data/tilemap/Central Cavern 1280 no attributes.asm"
      ; INCLUDE "../data/tilemap/Central Cavern 2560 with attributes.asm"
        INCLUDE "../data/tiles/tiles.asm"

 
;----------------------------------------------------------------------------

        ;CSPECTMAP test

        SAVENEX OPEN "Tiles/exe/tilemap.nex", MAIN, $ff40
        SAVENEX AUTO

;----------------------------------------------------------------------------

