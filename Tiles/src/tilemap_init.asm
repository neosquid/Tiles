;----------------------------------------------------------------------------
InitTilemap:  
;----------------------------------------------------------------------------   
        ld hl,TILEMAP 
	ld a,h                                          ; get MSB
	nextreg IO_TILEMAPBASEADDRESS,a                    ; load it
	ld hl,TILEMAP+1280                              ; if not using attribute byte		
	ld a,h                                          ; get MSB
	nextreg IO_TILEMAPDEFBASEADDRESS,a                 ; load it
        nextreg IO_TILEMAPCONTROL,%10100000               ; bit 7 set = enable tile map bit 7, bit 5 set = tile map with attribute byte eliminated is selected, (bit 5 is 1)
	nextreg IO_TILEMAPTRANSPARENCY,%0000000         
	nextreg IO_TILEMAPPALETTERCONTROL,%000110000
        ret

;----------------------------------------------------------------------------
LoadTileDefinitionsIntoMemory:
;----------------------------------------------------------------------------
        ld de,TILEMAP+1280                              ; If not including attribute byte in tile map
        ld hl,tile_definitions_start
        ld bc,tile_definitions_end
        ldir
        ret

;----------------------------------------------------------------------------
LoadtileMapIntoMemory:
;----------------------------------------------------------------------------                    
	ld hl,tileMapData                               ; source of tile definition data
	ld de,TILEMAP                                   ; address of tileMap in memory
        ld bc,1280                                      ; number of bytes contained within tileMap (would be 1280 if you turn off the attribute byte IO_tileMapContr)
        ;ld bc,2560                                     ; number of bytes contained within tileMap (would be 1280 if you turn off the attribute byte IO_tileMapContr)
	ldir 
        ret

;---------------------------------------------------------------------------------------
SetTileMapPalette:
;---------------------------------------------------------------------------------------
	nextreg $40,%00000000		                ; palette index 0
	nextreg $43,%00110000 		                ; tilemap

	ld hl,ula_palette_8_bit 
	ld b,16
.loop
	ld a,(HL)
	nextreg $41,a
	inc hl
	djnz .loop
	ret

ula_palette_8_bit:
;---------------------------------------------------------------------------------------
; ULA 8 bit palette
;---------------------------------------------------------------------------------------
	db $00 ; $0 		black	
	db $02 ; $1		blue	
	db $a0 ; $2		red	
	db $a2 ; $3		magenta	
	db $14 ; $4		green	
	db $16 ; $5		cyan	
	db $b4 ; $6		yellow	
	db $b6 ; $7		white	
	db $c0 ; $8		transparent
	db $03 ; $9	blue	bright
	db $e0 ; $A	red 	bright
	db $e7 ; $B	magenta bright
	db $1c ; $C	green 	bright
	db $1f ; $D	cyan 	bright
	db $fc ; $E	yellow 	bright
	db $ff ; $F	white 	bright