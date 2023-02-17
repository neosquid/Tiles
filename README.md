
        
        ~ A simplistic Tile Map Demo for the ZX Spectrum Next
        ~ Updated 15th Feb 2023

        ~ tidied and simplified code after working on another project and returned to this
        ~ less unused ports set and less explanation - see ZX Next Wiki for more detailed information
        ~ purpose is to provide code to see the tile map system loading defintions into a tile map 

        Compile:
 
        ~ Z80 Compiler - SJASMPLUS https://github.com/z00m128/sjasmplus
        ~ sjasmplus --zxnext=cspect [path to to file]
        ~ .nex file has been tested to run on CSPECT emulator: https://dailly.blogspot.com/
        ~ install MONO framework to run on MacOS
        
        ;----------------------------------------------------------------------------
        ; MEMORY MAP
        ;----------------------------------------------------------------------------
        ; $6000 ~ TILE MAP (1280 BYTES SIZE)
        ; $6720 ~ EOF TILE DEFINITIONS (TILE MAP DEFINITIONS + (17 TILES * 32)
        ; $8000 ~ PROGRAM CODE START
        ;----------------------------------------------------------------------------
