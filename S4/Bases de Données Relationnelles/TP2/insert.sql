INSERT INTO Region VALUES ('R01', 'Antarctique');
INSERT INTO Region VALUES ('R02', 'Antilles');
INSERT INTO Region VALUES ('R13', 'France');
INSERT INTO Region VALUES ('R14', 'Eurasie');
INSERT INTO Region VALUES ('R23', 'Amérique du Nord');

INSERT INTO Activite VALUES ('V','Voile');
INSERT INTO Activite VALUES ('TT','Tennis de table');
INSERT INTO Activite VALUES ('T','Tennis');
INSERT INTO Activite VALUES ('P0','Plongée Découverte');
INSERT INTO Activite VALUES ('P1','Plongée niveau I');
INSERT INTO Activite VALUES ('P2','Plongée niveau II');
INSERT INTO Activite VALUES ('Th','Thalassothérapie');
INSERT INTO Activite VALUES ('E','Escalade');

INSERT INTO Client VALUES ('202B','Fogg','Philéas','Londres',199);
INSERT INTO Client VALUES ('102P','Pascal','Blaise','Paris', 0);
INSERT INTO Client VALUES ('289Z','Hugo','Victor','Paris',2500);
INSERT INTO Client VALUES ('049Q','Verne','Jules','Amiens', 0);
INSERT INTO Client VALUES ('982M','Kerouac','Jack','New-York',1500);
INSERT INTO Client VALUES ('322M','Bill','John','New-York',150);
INSERT INTO Client VALUES ('303Z','Lenon','Jack','Paris',500);

INSERT INTO Station VALUES ('S012','Venusa',350,'Guadeloupe','R02',389);
INSERT INTO Station VALUES ('S016','Eden Star',545,'La Désirade','R02',319);
INSERT INTO Station VALUES ('S032','Les Marronniers',654,'Pyrénées','R13',199);
INSERT INTO Station VALUES ('S034','Carolina Park',3945,'Caroline','R23',5499);
INSERT INTO Station VALUES ('S045','Sultan',350,'Turquie','R14',299);

INSERT INTO Sejour VALUES ('202B','S012',TO_DATE('05/05/2005','dd/mm/yyyy'), TO_DATE('18/05/2005','dd/mm/yyyy'), 4);
INSERT INTO Sejour VALUES ('289Z','S016',TO_DATE('01/01/2007','dd/mm/yyyy'), TO_DATE('20/01/2007','dd/mm/yyyy'), 2);
INSERT INTO Sejour VALUES ('202B','S045',TO_DATE('19/05/2005','dd/mm/yyyy'), TO_DATE('26/05/2005','dd/mm/yyyy'), 4);
INSERT INTO Sejour VALUES ('982M','S045',TO_DATE('19/05/2005','dd/mm/yyyy'), TO_DATE('01/07/2005','dd/mm/yyyy'), 4);
INSERT INTO Sejour VALUES ('049Q','S034',TO_DATE('07/08/2005','dd/mm/yyyy'), TO_DATE('31/08/2005','dd/mm/yyyy'), 5);
INSERT INTO Sejour VALUES ('202B','S034',TO_DATE('27/05/2005','dd/mm/yyyy'), TO_DATE('15/06/2005','dd/mm/yyyy'), 4);

INSERT INTO Proposer VALUES ('S012','P0',29);
INSERT INTO Proposer VALUES ('S012','P1',34);
INSERT INTO Proposer VALUES ('S012','P2',24);
INSERT INTO Proposer VALUES ('S012','T',8.99);
INSERT INTO Proposer VALUES ('S032','E',39);
INSERT INTO Proposer VALUES ('S045','Th',3.49);

/*
Verif de quelques contraintes :
INSERT INTO Station VALUES ('S045','Sultan',350,'Turquie','R99',299);
INSERT INTO Sejour VALUES ('202B','S099',TO_DATE('27/05/05','dd/mm/yyyy'), TO_DATE('15/06/05','dd/mm/yyyy'), 4);
Le Delete on cascade fonctionne bien

*/
