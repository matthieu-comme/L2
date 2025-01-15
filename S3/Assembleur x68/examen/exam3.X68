    ORG $1000
    
SSPRG:
    MOVE.L  #VAR,A0
    MOVE.L  #14,D7
    JSR SSPRG1
    JMP FINPRG

    INCLUDE 'BIBLIO.X68'
    
SSPRG1:
    MOVE.B  (A0)+,D1
    JSR AFFCAR
    SUB.B   #1,D7
    CMP.B   #0,D7
    BNE SSPRG1
    RTS
    
    ORG $2000
VAR:    DC.B 72,69,76,76,79,10,13,65,10,13,84,79,85,83

    END $1000
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
