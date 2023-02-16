/* 

;----------------------------------------------------------------------------
 Tile definition NOTES
;----------------------------------------------------------------------------
        ~ 8*4 bytes = 32 bytes per tile definition, 
        ~ each byte contains two pixels, color value is stored in 2 nibbles e.g. $1F xxxxyyyy / 0001 1111;  each nibble represents color value 0-15 
        ~ this is 8 pixels of data per line for the 8x8 tile
        ~ therefore each half of the hex values below is one pixel color value 0-15
        ~ the labels below are for reference only
        ~ place the tile index number into the tile map (Central Cavern.asm) to display the tile on the tile map
        ~ the color values $0..$F of the tile defintion nibbles are referenced within palette.asm
;----------------------------------------------------------------------------

*/

tile_definitions_start:
;----------------------------------------------------------------------------

; 00 Empty
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00

; 01 Green Key

	db $00,$11,$00,$00
	db $01,$00,$10,$00
	db $10,$00,$10,$00
	db $10,$01,$00,$00
	db $01,$10,$10,$00
	db $00,$00,$01,$00
	db $00,$00,$10,$10
	db $00,$00,$01,$00

; 02 Yellow Key
	db $00,$22,$00,$00
	db $02,$00,$20,$00
	db $20,$00,$20,$00
	db $20,$02,$00,$00
	db $02,$20,$20,$00
	db $00,$00,$02,$00
	db $00,$00,$20,$20
	db $00,$00,$02,$00

; 03 Red Key
	db $00,$33,$00,$00
	db $03,$00,$30,$00
	db $30,$00,$30,$00
	db $30,$03,$00,$00
	db $03,$30,$30,$00
	db $00,$00,$03,$00
	db $00,$00,$30,$30
	db $00,$00,$03,$00

; 04 Light Blue Key

	db $00,$44,$00,$00
	db $04,$00,$40,$00
	db $40,$00,$40,$00
	db $40,$04,$00,$00
	db $04,$40,$40,$00
	db $00,$00,$04,$00
	db $00,$00,$40,$40
	db $00,$00,$04,$00

; 05 Key
	db $00,$55,$00,$00
	db $05,$00,$50,$00
	db $50,$00,$50,$00
	db $50,$05,$00,$00
	db $05,$50,$50,$00
	db $00,$00,$05,$00
	db $00,$00,$50,$50
	db $00,$00,$05,$00

; 06 Purple Key

	db $00,$66,$00,$00
	db $06,$00,$60,$00
	db $60,$00,$60,$00
	db $60,$06,$00,$00
	db $06,$60,$60,$00
	db $00,$00,$06,$00
	db $00,$00,$60,$60
	db $00,$00,$06,$00

; 07 Floor

	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA
	db $AA,$0A,$A0,$AA
	db $0A,$A0,$AA,$A0
	db $AA,$00,$0A,$0A
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00

; 08 Wall
        db $22,$62,$22,$62
	db $66,$66,$66,$66
	db $62,$22,$62,$22
	db $66,$66,$66,$66
	db $22,$62,$22,$62
	db $66,$66,$66,$66
	db $62,$22,$62,$22
	db $66,$66,$66,$66
	
; 09 Crumbling FLoor

	db $22,$22,$22,$22
	db $22,$02,$20,$22
	db $20,$20,$02,$02
	db $00,$20,$02,$00
	db $02,$02,$00,$20
	db $00,$20,$00,$00
	db $00,$00,$20,$00
	db $00,$00,$00,$00

; 10 Conveyor

	db $88,$88,$00,$00
	db $08,$80,$08,$80
	db $88,$88,$00,$00
	db $08,$80,$08,$80
	db $00,$00,$00,$00
	db $80,$08,$80,$08
	db $88,$88,$88,$88
	db $00,$00,$00,$00

; 11 Nasty

	db $0C,$00,$0C,$00
	db $00,$C0,$C0,$00
	db $C0,$0C,$0C,$00
	db $0C,$0C,$00,$0C
	db $00,$CC,$0C,$0C
	db $CC,$0C,$0C,$C0
	db $0C,$0C,$C0,$00
	db $00,$0C,$00,$00


; 12 Nasty 2

	db $DD,$DD,$DD,$DD
	db $DD,$DD,$DD,$D0
	db $0D,$DD,$DD,$D0
	db $0D,$DD,$DD,$00
	db $0D,$00,$DD,$00
	db $0D,$00,$DD,$00
	db $00,$00,$D0,$00
	db $00,$00,$D0,$00

; 13 portalTopLeft

	db $EE,$EE,$EE,$EE
        db $E9,$9E,$99,$E9
        db $E9,$EE,$9E,$E9
        db $EE,$EE,$EE,$EE
        db $E9,$9E,$99,$E9
        db $E9,$EE,$9E,$E9
        db $EE,$EE,$EE,$EE
        db $E9,$9E,$99,$E9

; 14 portalTopRight

	db $EE,$EE,$EE,$EE
	db $9E,$99,$E9,$9E
	db $EE,$9E,$E9,$EE
	db $EE,$EE,$EE,$EE
	db $9E,$99,$E9,$9E
	db $EE,$9E,$E9,$EE
	db $EE,$EE,$EE,$EE
	db $9E,$99,$E9,$9E

; 15 portalBottomLeft

	db $E9,$EE,$9E,$E9
	db $EE,$EE,$EE,$EE
	db $E9,$9E,$99,$E9
	db $E9,$EE,$9E,$E9
	db $EE,$EE,$EE,$EE
	db $E9,$9E,$99,$E9
	db $E9,$EE,$9E,$E9
	db $EE,$EE,$EE,$EE

; 16 portalBottomRight

	db $EE,$9E,$E9,$EE
	db $EE,$EE,$EE,$EE
	db $9E,$99,$E9,$9E
	db $EE,$9E,$E9,$EE
	db $EE,$EE,$EE,$EE
	db $9E,$99,$E9,$9E
	db $EE,$9E,$E9,$EE
	db $EE,$EE,$EE,$EE

; 17 Yellow Square
	db $EE,$EE,$EE,$EE
	db $EE,$EE,$EE,$EE
	db $EE,$EE,$EE,$EE
	db $EE,$EE,$EE,$EE
	db $EE,$EE,$EE,$EE
	db $EE,$EE,$EE,$EE
	db $EE,$EE,$EE,$EE
	db $EE,$EE,$EE,$EE

; 18 Red Square
	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA
	db $AA,$AA,$AA,$AA

; 19 Green Square
	db $CC,$CC,$CC,$CC
	db $CC,$CC,$CC,$CC
	db $CC,$CC,$CC,$CC
	db $CC,$CC,$CC,$CC
	db $CC,$CC,$CC,$CC
	db $CC,$CC,$CC,$CC
	db $CC,$CC,$CC,$CC
	db $CC,$CC,$CC,$CC

tile_definitions_end:  
