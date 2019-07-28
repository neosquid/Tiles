
prepScreen:

  ld hl, screen
  ld de, screen+1
  ld bc, 6144
  ld (hl),0
  ldir

  ret

prepBackground:

  ld hl, ulaattr
  ld de, ulaattr+1
  ld bc, 768
  ld (hl),$00; $38
  ldir

 ret 

printString:       

  /*   

      Entry Values:

      de = address to string                    
      screenAddresstoPrint = address in Spectrum ULA screenmemory $4000 - $5800
      future - x,y coords as an option instead of screen address to print    

  */



  ld hl, screenAddresstoPrint                         
  inc l
  ld b,14                                            ; print amount of characters within string
.loop

  push bc   
  push hl, de                                        ; save screen printing address and string address before the printChar destroys original values
  ld a, (de)
  call printCharacter
  pop de,hl
  inc l                                             ; advance the screen address across by by 1
  inc e                                             ; advance string position by 1
  pop bc                                            ; return loop value
  djnz .loop

  ret


printCharacter:                                   ; RST $10 replacement :D

      ; characters (0 - 25)
      ; (8*25) references the bit data start for each character added to CharacterData (address of character data in memory)
      ; prepare address of character offset  to be stored in a
      ; calculate offset to point to characterData 
      
      ld d,8  
      sub 32 
      ld e,a

      mul d,e                                     ; result stored in de

      push hl
      ld hl, characterData                        ; base of character data ; change to IX?
      add hl,de 
      ld de,hl                                    ; de now points to appropriate character data

      ld b,07
      pop hl

.loop

      ld a, (de)
      ld (hl), a
      inc h                                      ; increasing by 256 to reference the next row of the screen
      inc e

  djnz .loop

  ret



drawInfoArea:

;----------------------------------------------------------------------------

; SET HUD Area ULA attributes

;----------------------------------------------------------------------------
; draw yellow bar

    ld b,32
    ld hl, ulaattr+512
.loop
    ld (hl), %01110000 ; yellow 
    inc l
    djnz .loop

;----------------------------------------------------------------------------
;draw red bar

    ld b,11
    ld hl, ulaattr+512+32
.loop1
    ld (hl), %01010000 ;red 
    inc l
    djnz .loop1

;----------------------------------------------------------------------------
;draw green bar

    ld b,21
    ld hl, ulaattr+523+32
.loop2
    ld (hl), %01100000 ;green 
    inc l
    djnz .loop2

;----------------------------------------------------------------------------

  ret    
