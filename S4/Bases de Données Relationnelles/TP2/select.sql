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

-- 4
SELECT nomStation, tarif From Station ORDER BY tarif DESC FETCH FIRST 1 ROWS ONLY;

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
SELECT nom, idR, SUM(tarif) FROM Station st, Sejour se, Client c WHERE st.idS = se.idS AND se.idC = c.idC GROUP BY nom, idR HAVING SUM(tarif) > 350 ORDER BY nom; 

-- 16
SELECT nomR AS "Région", COUNT(*) AS "Nombre activités" FROM Proposer p, Station s, Region r WHERE p.idS = s.idS AND s.idR = r.idR GROUP BY s.idR, nomR;

-- 17 : requête custom plongée pour check le résultat

--a
SELECT idS FROM Proposer p, Activite a WHERE p.idA = a.idA AND libelleAct LIKE 'Plongée%' GROUP BY idS HAVING COUNT(DISTINCT(p.idA)) = (SELECT COUNT(idA) FROM Activite WHERE idA LIKE 'P%');

-- b Soit s € Station
-- Pour tout a € A, (s,a) € P
-- 1ère négation -> Il existe a € A, (s,a) €/ P
-- 2ème          -> Il n'existe pas a € A, (s,a) €/ P

SELECT DISTINCT idS FROM Proposer p1 WHERE NOT EXISTS 
(SELECT idA FROM Activite a WHERE libelleAct LIKE 'Plongée%' AND NOT EXISTS
(SELECT * FROM Proposer p2 WHERE p1.idS = p2.idS AND p2.idA = a.idA));


-- c
SELECT DISTINCT idS FROM Proposer WHERE NOT EXISTS (
	SELECT idA FROM Activite WHERE libelleAct LIKE 'Plongée%'
	MINUS (
	SELECT idA FROM Proposer p WHERE p.idS = Proposer.idS));

-- 18 :

--a
SELECT idS, idA FROM Proposer p WHERE idA IN (SELECT idA FROM Proposer WHERE idS = 'S045') GROUP BY idS, idA HAVING COUNT(idA) >= (SELECT COUNT(*) FROM Proposer WHERE idS ='S045');

--b Soit s1 € S, s2 = 'S045'
-- Pour tout a tq (s2,a) € P, (s1,a) € P
-- 1ère négation -> Il existe a tq (s2,a) €P, (s1,a) €/ P
-- 2ème	     -> Il n'existe pas de a tq (s2,a) €P, (s1,a) €/ P

SELECT idS FROM Station st WHERE idS <> 'S045' AND NOT EXISTS (
SELECT idA FROM Proposer p1 WHERE idS = 'S045' AND NOT EXISTS ( 
SELECT * FROM Proposer p2 WHERE p2.idS = st.idS AND p2.idA = p1.idA));

--c
SELECT idS FROM Station st WHERE ids <> 'S045' AND NOT EXISTS (
	SELECT idA FROM Proposer p1 WHERE idS = 'S045'
	MINUS (
	SELECT idA FROM Proposer p2 WHERE p2.idS = st.idS));

