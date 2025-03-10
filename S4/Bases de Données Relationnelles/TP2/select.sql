COLUMN nom FORMAT A20;
COLUMN nomStation FORMAT A20;
COLUMN idC FORMAT A4;
COLUMN ville FORMAT A20;
COLUMN nom FORMAT A20;
COLUMN prenom FORMAT A20;
COLUMN nomR FORMAT A20;
COLUMN nomStation FORMAT A20;

-- 1
SELECT nomStation, capacite FROM Station ORDER BY capacite;

-- 2
SELECT DISTINCT nom, nomStation FROM Client c, Sejour se, Station st WHERE c.idc = se.idc AND se.ids = st.ids AND datefin - datedeb > 14; 

-- 3
SELECT DISTINCT nomR FROM Region r, Station st, Proposer p, Activite a 
WHERE r.idr = st.idr AND st.idS = p.ids AND p.ida = a.ida
AND libelleAct LIKE 'Plongée%';

-- 4 pas compris ?
SELECT nomStation, tarif From Station ORDER BY tarif DESC FETCH FIRST 3 ROWS ONLY;

-- 5
SELECT DISTINCT nomStation FROM Station st, Proposer p, Activite a 
WHERE st.idS = p.ids AND p.ida = a.ida
AND (libelleAct = 'Tennis' OR libelleAct LIKE 'Plongée%');

-- 6
SELECT nom FROM Client c, Sejour se, Proposer p, Activite a
WHERE c.idc = se.idc AND se.ids = p.ids AND p.ida = a.ida
AND libelleAct = 'Tennis';

-- 7
SELECT c1.idc, c1.nom, c2.idc, c2.nom, c1.ville FROM Client c1, Client c2 WHERE c1.ville = c2.ville AND c1.idc < c2.idc;

-- 8
SELECT SUM(capacite) FROM Station;

-- 9
SELECT COUNT(*) FROM Region;

-- 10
SELECT nomR, COUNT(*) AS "Nombre de stations", SUM(capacite) AS "Capacité totale" FROM Station s, Region r WHERE r.idR = s.idR GROUP BY nomR
UNION 
(SELECT nomR, 0, 0 FROM Region WHERE idR NOT IN 
(SELECT idr FROM Station));

-- 11
SELECT nomStation, SUM(prix) AS "Somme Prix" FROM Station s, Proposer p WHERE p.idS = s.idS GROUP BY s.idS, nomStation
UNION
(SELECT nomStation, 0 FROM Station s WHERE idS NOT IN (SELECT idS FROM Proposer)) 
ORDER BY nomStation;

-- 12
SELECT nomR AS "Région Premium" FROM Region r WHERE idR IN 
(SELECT idR FROM Station s WHERE 3 <= (SELECT COUNT(*) FROM Proposer p WHERE p.idS = s.idS));

-- 13
SELECT nomR, COUNT(idC) FROM Region r, Station st, Sejour se WHERE se.idS = st.idS AND st.idR = r.idR AND DateDeb <= TO_DATE('21-05-2005','DD-MM-YYYY') AND DateFin >= TO_DATE('05-21-2005','MM-DD-YYYY') GROUP BY st.idR, nomR;

-- 14
SELECT nom FROM Client c WHERE 2 <= (SELECT COUNT(DISTINCT idR) FROM Station st, Sejour se WHERE c.idc = se.idc AND se.idS = st.idS);

-- 15

-- 16
SELECT nomR AS "Région", COUNT(*) AS "Nombre activités" FROM Proposer p, Station s, Region r WHERE p.idS = s.idS AND s.idR = r.idR GROUP BY s.idR, nomR;
