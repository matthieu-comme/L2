CREATE TABLE Realisateur (
	id INTEGER NOT NULL,
	nom VARCHAR(20) NOT NULL,
	prenom VARCHAR(20) NOT NULL,
	CONSTRAINT realisateur_pk PRIMARY KEY (id)
);

INSERT INTO Realisateur VALUES ('1','Van Sant','Gus');
INSERT INTO Realisateur VALUES ('2','Scott','Ridley');
INSERT INTO Realisateur VALUES ('3','Gans','Christophe');
INSERT INTO Realisateur VALUES ('4','Almodovar','Pedro');
INSERT INTO Realisateur VALUES ('5','Polanski','Roman');
INSERT INTO Realisateur VALUES ('6','Russel','Charles');
INSERT INTO Realisateur VALUES ('7','Tarentino','Quentin');
INSERT INTO Realisateur VALUES ('8','Burton','Tim');
INSERT INTO Realisateur VALUES ('9','Spielberg','Steven');

CREATE TABLE Dvd (
	titre VARCHAR(50),
	id INTEGER,
	date_sortie DATE,
	genre VARCHAR(20),
	prix NUMBER(6,2),
	dispo CHAR(3),
	pays VARCHAR(20),
	CONSTRAINT dvd_pk PRIMARY KEY (titre),
	CONSTRAINT dvd_fk FOREIGN KEY (id) REFERENCES Realisateur(id),
	CONSTRAINT dvd_ck CHECK (dispo IN ('oui','non'))
);

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

COLUMN titre FORMAT A50;
COLUMN genre FORMAT A20;
COLUMN pays FORMAT A20;
COLUMN nom FORMAT A20;
COLUMN prenom FORMAT A20;

SELECT * from Dvd;

SELECT titre, genre FROM Dvd;

SELECT DISTINCT(pays) FROM Dvd;

SELECT titre, nom FROM Realisateur r, Dvd d WHERE r.id = d.id;

SELECT titre, UPPER(nom) AS NOM FROM Realisateur r, Dvd d WHERE r.id = d.id;

SELECT titre, TO_CHAR(date_sortie, 'yyyy') AS "Année_de_sortie" FROM Dvd;

SELECT titre, genre, prix FROM Dvd WHERE prix > 15;

SELECT titre, genre, prix, TO_CHAR(date_sortie, 'dd-mm-yyyy') AS "DATE DE SORTIE" FROM Dvd ORDER BY date_sortie; 

SELECT titre, genre, TO_CHAR(date_sortie,'dd-mm-yyyy') AS "DATE DE SORTIE" FROM Dvd ORDER BY genre DESC, date_sortie ASC;

SELECT nom, prenom from Realisateur r, Dvd d WHERE r.id = d.id AND titre = 'Gladiator';

SELECT titre FROM Dvd WHERE titre LIKE 'T%';

SELECT titre, prix FROM Dvd WHERE prix BETWEEN 10 AND 15;

SELECT DISTINCT TO_CHAR(date_sortie, 'yyyy') AS "Année" FROM Dvd ORDER BY "Année";

SELECT TO_CHAR(date_sortie, 'dd month yyyy') AS "Date de sortie" FROM Dvd;

SELECT titre, dispo, TO_CHAR(date_sortie, 'dd/mm/yyyy') AS "Date de sortie" FROM Dvd WHERE dispo = 'oui' AND date_sortie > TO_DATE('01-01-2000','dd-mm-yy');

SELECT titre, dispo, TO_CHAR(date_sortie, 'dd/mm/yyyy') AS "Date de sortie" FROM Dvd WHERE dispo = 'oui' AND date_sortie BETWEEN TO_DATE('01-01-2000','dd-mm-yy') AND TO_DATE('31-12-2001','dd-mm-yy') ORDER BY date_sortie;

SELECT titre, TO_CHAR(date_sortie + 7, 'dd/mm/yy') AS "Date de sortie" FROM Dvd ORDER BY date_sortie;

SELECT titre, pays FROM Dvd WHERE pays <> 'USA';

SELECT DISTINCT pays FROM Dvd WHERE genre IN ('Aventure', 'Fantastique');

COLUMN titre1 FORMAT A50;
COLUMN titre2 FORMAT A50;
COLUMN r1 FORMAT A20;
COLUMN "date1 (+récent)" FORMAT A20;
COLUMN date2 FORMAT A20;

SELECT r.nom AS R1, d1.titre AS titre1, TO_CHAR(d1.date_sortie,'dd/mm/yyyy') AS "date1 (+récent)", TO_CHAR(d2.date_sortie,'dd/mm/yyyy') AS date2, d2.titre AS titre2 FROM Dvd d1, Dvd d2, Realisateur r WHERE r.id = d1.id AND d1.date_sortie > d2.date_sortie ORDER BY d2.date_sortie, titre2;














