;----------------------------------------------------------------------------
PrepScreen:
;----------------------------------------------------------------------------
        ld hl,SCREEN
        ld de,SCREEN+1
        ld bc,6144
        ld (hl),0
        ldir
        ret

;----------------------------------------------------------------------------
PrepBackground:
;----------------------------------------------------------------------------
        ld hl,ULATTR
        ld de,ULATTR+1
        ld bc,768-1
        ld (hl),%00'000'111     ; paper black, ink white
        ldir
        ret 