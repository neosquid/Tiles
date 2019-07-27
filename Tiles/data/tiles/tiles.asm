; tile definition NOTES

; 32 bytes per tile map 8*4 bytes

; each byte contains two pixels, color value is stored in 2 nibbles e.g. $1F xxxxyyyy / 0001 1111;  each nibble represents color value 0-15 
; this is 8 pixels of data per line for the 8x8 tile
; therefore each half of the hex values below is one pixel color value 0-15
; the labels below are for reference only
; place the tile defintion reference number into the tile map (Central Cavern.asm) to display the tile on the tile map
; the color values below are referenced in palette.asm

tiles:

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

	db $55,$55,$55,$55
	db $55,$55,$55,$55
	db $55,$05,$50,$55
	db $05,$50,$55,$50
	db $55,$00,$05,$05
	db $00,$00,$00,$00
	db $00,$00,$00,$00
	db $00,$00,$00,$00

; 08 Wall

	db $33,$23,$33,$23
	db $22,$22,$22,$22
	db $23,$33,$23,$33
	db $22,$22,$22,$22
	db $33,$23,$33,$23
	db $22,$22,$22,$22
	db $23,$33,$23,$33
	db $22,$22,$22,$22

; 09 Crumbling FLoor

	db $33,$33,$33,$33
	db $33,$03,$30,$33
	db $30,$30,$03,$03
	db $00,$30,$03,$00
	db $03,$03,$00,$30
	db $00,$30,$00,$00
	db $00,$00,$30,$00
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

	db $08,$00,$08,$00
	db $00,$80,$80,$00
	db $80,$08,$08,$00
	db $08,$08,$00,$08
	db $00,$88,$08,$08
	db $88,$08,$08,$80
	db $08,$08,$80,$00
	db $00,$08,$00,$00


; 12 Nasty 2

	db $44,$44,$44,$44
	db $44,$44,$44,$40
	db $04,$44,$44,$40
	db $04,$44,$44,$00
	db $04,$00,$44,$00
	db $04,$00,$44,$00
	db $00,$00,$40,$00
	db $00,$00,$40,$00

; 13 portalTopLeft

	db $22,$22,$22,$22
	db $2A,$A2,$AA,$2A
	db $2A,$22,$A2,$2A
	db $22,$22,$22,$22
	db $2A,$A2,$AA,$2A
	db $2A,$22,$A2,$2A
	db $22,$22,$22,$22
	db $2A,$A2,$AA,$2A

; 14 portalTopRight

	db $22,$22,$22,$22
	db $A2,$AA,$2A,$A2
	db $22,$A2,$2A,$22
	db $22,$22,$22,$22
	db $A2,$AA,$2A,$A2
	db $22,$A2,$2A,$22
	db $22,$22,$22,$22
	db $A2,$AA,$2A,$A2

; 15 portalBottomLeft

	db $2A,$22,$A2,$2A
	db $22,$22,$22,$22
	db $2A,$A2,$AA,$2A
	db $2A,$22,$A2,$2A
	db $22,$22,$22,$22
	db $2A,$A2,$AA,$2A
	db $2A,$22,$A2,$2A
	db $22,$22,$22,$22

; 16 portalBottomRight

	db $22,$A2,$2A,$22
	db $22,$22,$22,$22
	db $A2,$AA,$2A,$A2
	db $22,$A2,$2A,$22
	db $22,$22,$22,$22
	db $A2,$AA,$2A,$A2
	db $22,$A2,$2A,$22
	db $22,$22,$22,$22

tiles_end:  
