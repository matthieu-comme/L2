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














