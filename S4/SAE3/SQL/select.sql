COLUMN NOM FORMAT A20;
-- Les noms portés par plusieurs elfes
SELECT DISTINCT nom_elfe AS NOM FROM Elfe e1 WHERE nom_elfe IN (SELECT nom_elfe FROM Elfe e2 WHERE e1.id_elfe <> e2.id_elfe);

-- Elfes qui ont pour spécialité ‘Couture’ ou ‘Emballage’
SELECT DISTINCT e.id_elfe, nom_elfe from Elfe e, Elfe_Spe es, Specialite s 
WHERE e.id_elfe = es.id_elfe AND es.id_spe = s.id_spe
AND (nom_spe = 'Couture' OR nom_spe = 'Emballage') ORDER BY e.id_elfe;

-- Elfes qui ont pour spécialité ‘Couture’ et ‘Emballage’
SELECT DISTINCT e.id_elfe, nom_elfe from Elfe e, Elfe_Spe es, Specialite s 
WHERE e.id_elfe = es.id_elfe AND es.id_spe = s.id_spe AND nom_spe = 'Couture' 
INTERSECT (
	SELECT DISTINCT e.id_elfe, nom_elfe from Elfe e, Elfe_Spe es, Specialite s 
	WHERE e.id_elfe = es.id_elfe AND es.id_spe = s.id_spe AND nom_spe = 'Emballage' 
);

-- Les elfes ayant plus de 2 spécialités

SELECT es.id_elfe AS ID, nom_elfe AS NOM, COUNT(id_spe) AS "Nombre de spe" FROM Elfe_Spe es, Elfe e WHERE es.id_elfe = e.id_elfe GROUP BY es.id_elfe, nom_elfe HAVING(COUNT(id_spe)) > 2;

-- La somme des volumes des traineaux par couleur
SELECT couleur_tr, SUM(volume_tr) AS SOMME FROM Traineau GROUP BY couleur_tr;

-- La capacité de chaque traineau
SELECT t.id_tr, SUM(capac_renne) FROM Traineau t, Renne r WHERE t.id_tr = r.id_tr GROUP BY t.id_tr ORDER BY t.id_tr;

-- Quels jouets sont demandés par tous les enfants ?

-- Double négation : Soit j € J
-- 	Pour tout e€E, (j,e) € D
-- -> 	Il n'existe pas e€E, (j,e) €/D
SELECT id_jouet, nom_jouet FROM Jouet j WHERE NOT EXISTS (
SELECT id_enfant FROM Enfant e WHERE NOT EXISTS (
SELECT * FROM Demande d WHERE d.id_enfant = e.id_enfant AND j.id_jouet = d.id_jouet)); 
-- Dénombrement

SELECT d.id_jouet, nom_jouet FROM Demande d, Jouet j WHERE d.id_jouet = j.id_jouet GROUP BY d.id_jouet, nom_jouet HAVING COUNT(id_enfant) = (SELECT COUNT(*) FROM Enfant); 

-- Ensembliste

SELECT DISTINCT d1.id_jouet, nom_jouet FROM Demande d1, Jouet j WHERE d1.id_jouet = j.id_jouet AND NOT EXISTS (
SELECT id_enfant FROM Enfant e 
MINUS (
SELECT id_enfant FROM Demande d2 WHERE d2.id_jouet = d1.id_jouet));

-- Poids d'un jouet
SELECT id_jouet, SUM(quantite) FROM Est_Compose EC GROUP BY id_jouet ORDER BY id_jouet;

SELECT Region, SUM(EC.quantite) FROM Est_Compose EC, Est_Stocke ES GROUP BY Region ORDER BY Region;



