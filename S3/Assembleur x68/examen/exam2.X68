    ORG $400
    MOVE.L  #T,A0
    MOVE.L  #0,D0
    MOVE.L  #0,D1
    MOVE.L  #0,D2
BOUCLE:
    MOVE.W  (A0)+,D0
    ADD.W   D0,D1
    ADD.B   #1,D2
    CMP.B   #30,D2
    BNE BOUCLE
    JMP FINPRG
    INCLUDE 'BIBLIO.X68'
    
    ORG $1000
T: DC.W 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

    END $400
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
