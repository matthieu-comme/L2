SELECT nomStation, capacite FROM Station ORDER BY capacite;

COLUMN nom FORMAT A20;
COLUMN nomStation FORMAT A20;
COLUMN idC FORMAT A4;
COLUMN ville FORMAT A20;
COLUMN nom FORMAT A20;
COLUMN prenom FORMAT A20;

SELECT DISTINCT nom, nomStation FROM Client c, Sejour se, Station st WHERE c.idc = se.idc AND se.ids = st.ids AND datefin - datedeb > 14; 

SELECT DISTINCT nomR FROM Region r, Station st, Proposer p, Activite a 
WHERE r.idr = st.idr AND st.idS = p.ids AND p.ida = a.ida
AND libelleAct LIKE 'Plongée%';

/* pas compris la question suivante ?*/
SELECT nomStation, tarif From Station ORDER BY tarif DESC FETCH FIRST 3 ROWS ONLY;

SELECT DISTINCT nomStation FROM Station st, Proposer p, Activite a 
WHERE st.idS = p.ids AND p.ida = a.ida
AND (libelleAct = 'Tennis' OR libelleAct LIKE 'Plongée%');

SELECT nom FROM Client c, Sejour se, Proposer p, Activite a
WHERE c.idc = se.idc AND se.ids = p.ids AND p.ida = a.ida
AND libelleAct = 'Tennis';

/* Reprendre à la question 7 */
