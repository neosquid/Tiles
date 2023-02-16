
        DEVICE ZXSPECTRUMNEXT
        opt --zxnext=cspect
        org $8000
        
        INCLUDE "../src/defines.asm"
        INCLUDE "../src/tilemap_init.asm"
        INCLUDE "../src/subroutines.asm"
        INCLUDE "../data/Central Cavern 1280 no attributes.asm"
        INCLUDE "../data/tile_definitions.asm"

MAIN:

        ld a,$02          
        out ($FE),a             ; set border colour red
        call PrepScreen         ; zero out screen memory
        call PrepBackground     ; fill background black

        call InitTilemap 
        call SetTileMapPalette
        call LoadTileDefinitionsIntoMemory    
        call LoadtileMapIntoMemory

        jr $                    ; end - infinite loop
 

 ; SJASMPLUS create exe
;----------------------------------------------------------------------------
        SAVENEX OPEN "exe/tiles.nex", MAIN, $FF40
        SAVENEX AUTO
;----------------------------------------------------------------------------