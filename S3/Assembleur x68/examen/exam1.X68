    ORG $400
    MOVE.L  #CHAINE,A0
BOUCLE:
    JSR SAISCAR
    CMP.B   #13,D1
    BEQ SUITE
    MOVE.B  D1,(A0)+
    BRA BOUCLE
SUITE:
    MOVE.B  #0,(A0)
    JMP FINPRG
    INCLUDE 'BIBLIO.X68'
    
    ORG $1000
CHAINE: DS.B 20

    END $400
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
