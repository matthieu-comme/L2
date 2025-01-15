    ORG $1000
    
SSPRG:
    MOVE.L #0,D2
    MOVE.L #0,D3
    JSR SSPRG1
    JMP FINPRG
    
    INCLUDE 'BIBLIO.X68'

SSPRG1:
    JSR SAISCAR
    CMP.B #13,D1
    BEQ SSPRG2
    SUB.B #48,D1
    
    ROL.L #3,D2
    OR.L D1,D2
    BRA SSPRG1
    
SSPRG2:
    ROL.L #4,D2
    MOVE.B D2,D1
    AND.B #15,D1
    CMP.B #10,D1
    BLT LT
    ADD.B #55,D1
    BRA SUITE
LT:
    ADD.B #48,D1
SUITE:
    JSR AFFCAR
    ADD.B #1,D3
    CMP.B #8,D3
    BNE SSPRG2
     
    RTS

   


    END $1000
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
