; Tile Map I/O ports

IO_TILEMAPCONTROL	        equ $6B                 ; Tile Map Control register
IO_TILEMAPBASEADDRESS           equ $6E                 ; tileMap Base Address register
IO_TILEMAPDEFBASEADDRESS        equ $6F                 ; Tile Definitions Base Address register
IO_TILEMAPPALETTERCONTROL       equ $43                 ; Palette Control register
IO_TILEMAPTRANSPARENCY          equ $4C                 ; Transparency index for the tileMap register

; Tile Map Memory Addresses

TILEMAP                         equ $6000               ; start address of tile map in memory	 	
TILEMAPDEFADDRESS               equ TILEMAP+1280        ; start address of tile map definitons

; ULA

SCREEN                          equ $4000               ; screen ULA address
ULATTR                          equ $5800               ; attribute ULA address