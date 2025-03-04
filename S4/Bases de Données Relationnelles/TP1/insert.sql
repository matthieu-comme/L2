INSERT INTO Realisateur VALUES ('1','Van Sant','Gus');
INSERT INTO Realisateur VALUES ('2','Scott','Ridley');
INSERT INTO Realisateur VALUES ('3','Gans','Christophe');
INSERT INTO Realisateur VALUES ('4','Almodovar','Pedro');
INSERT INTO Realisateur VALUES ('5','Polanski','Roman');
INSERT INTO Realisateur VALUES ('6','Russel','Charles');
INSERT INTO Realisateur VALUES ('7','Tarentino','Quentin');
INSERT INTO Realisateur VALUES ('8','Burton','Tim');
INSERT INTO Realisateur VALUES ('9','Spielberg','Steven');

INSERT INTO Dvd VALUES ('A la rencontre de Forrester','1', TO_DATE('18/04/2001','dd/mm/yyyy'),'Comédie Dramatique',30.06,'oui','USA');
INSERT INTO Dvd VALUES ('Blade Runner','2',TO_DATE('15/09/1982','dd/mm/yyyy'),'Fantastique',7.41,'non','USA');
INSERT INTO Dvd VALUES ('Le pacte des loups','3',TO_DATE('31/01/2001','dd/mm/yyyy'),'Aventure',16.50,'oui','France');
INSERT INTO Dvd VALUES ('Gladiator','2',TO_DATE('20/06/2000','dd/mm/yyyy'),'Peplum',12.95,'oui','USA');
INSERT INTO Dvd ('Talon aiguilles','4',TO_DATE('15/01/1992','dd/mm/yyyy'),'Comédie Dramatique',22,'oui','Espagne');
INSERT INTO Dvd VALUES ('La neuvième porte','5',TO_DATE('25/08/1999','dd/mm/yyyy'),'Fantastique',12,'oui','USA');
INSERT INTO Dvd VALUES ('The Mask','6',TO_DATE('26/10/1994','dd/mm/yyyy'),'Fantastique',11,'non','USA');
INSERT INTO Dvd VALUES ('Kill Bill','7',TO_DATE('28/04/2004','dd/mm/yyyy'),'Action',26.33,'oui','USA');
INSERT INTO Dvd VALUES ('Sleepy Hollow','8',TO_DATE('09/02/2000','dd/mm/yyyy'),'Fantastique',12.99,'oui','USA');
INSERT INTO Dvd VALUES ('Pulp Fiction','7',TO_DATE('26/10/1994','dd/mm/yyyy'),'Policier',18.96,'non','USA');
INSERT INTO Dvd VALUES ('Indiana Jones et les Aventuriers de l''arche perdue','9',TO_DATE('21/07/1981','dd/mm/yyyy'),'Aventure',9.99,'non','USA');

DELETE from Dvd WHERE id = 2;
DELETE from Realisateur WHERE id = 2;
