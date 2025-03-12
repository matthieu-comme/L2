INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (1, 'Pipotin');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (2, 'Fidou');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (3, 'Brindille');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (4, 'Lustrine');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (5, 'Moussu');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (6, 'Tibiscuit');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (7, 'Ribouldingue');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (8, 'Tourneboule');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (9, 'Zéphirin');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (10, 'Faribol');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (11, 'Bourrondelle');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (12, 'Gribouille');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (13, 'Toupillon');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (14, 'Zibeline');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (15, 'Chiffonnette');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (16, 'Biscotin');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (17, 'Niflette');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (18, 'Chantibule');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (19, 'Tirlipot');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (20, 'Patachon');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (21, 'Gribouille');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (22, 'Asticot');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (23, 'Chiffonnette');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (24, 'Savonnette');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (25, 'Brillolin');
INSERT INTO Elfe (id_elfe, nom_elfe) VALUES (26, 'Raoul');

 
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('MEN', 'Menuiserie');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('EMB', 'Emballage');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('PEI', 'Peinture');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('SOU', 'Soudure');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('COU', 'Couture');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('MEC', 'Mécanique');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('ELE', 'Électronique');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('TST', 'Test de jouets');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('ASB', 'Assemblage de jouets');
INSERT INTO Specialite (id_spe, nom_spe) VALUES ('ENT', 'Entretien');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (1, 'MEN', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (1, 'SOU', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (2, 'EMB', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (2, 'TST', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (3, 'PEI', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (3, 'MEN', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (4, 'SOU', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (4, 'MEC', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (5, 'COU', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (5, 'EMB', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (6, 'MEC', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (6, 'ELE', 'S');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (6, 'TST', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (7, 'ELE', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (7, 'TST', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (8, 'TST', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (8, 'ASB', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (9, 'ASB', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (9, 'PEI', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (10, 'MEN', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (10, 'MEC', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (11, 'EMB', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (11, 'COU', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (12, 'PEI', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (12, 'ASB', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (13, 'MEC', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (13, 'SOU', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (14, 'ELE', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (14, 'TST', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (15, 'TST', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (15, 'MEN', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (16, 'ASB', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (16, 'EMB', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (17, 'MEN', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (17, 'PEI', 'S');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (17, 'ELE', 'S');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (17, 'ASB', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (18, 'COU', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (18, 'SOU', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (19, 'SOU', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (19, 'ELE', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (20, 'MEC', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (20, 'TST', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (21, 'ENT', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (21, 'MEN', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (22, 'ENT', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (22, 'EMB', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (23, 'ENT', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (23, 'PEI', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (24, 'ENT', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (24, 'MEC', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (25, 'ENT', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (25, 'ASB', 'S');

INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (26, 'ENT', 'P');
INSERT INTO Elfe_Spe (id_elfe, id_spe, type_spe) VALUES (26, 'COU', 'S');

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (1, 10);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (1, 17);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (1, 4);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (2, 11);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (2, 20);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (3, 12);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (3, 17);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (4, 13); 
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (4, 19); 

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (5, 18);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (5, 11);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (6, 20);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (6, 13);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (7, 14);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (7, 19);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (8, 15);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (8, 16);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (9, 16);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (9, 12);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (10, 1);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (10, 20);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (11, 2);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (11, 16);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (11, 5);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (11, 18);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (12, 3);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (12, 17);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (12, 9);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (12, 16);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (13, 4); 
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (13, 19);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (13, 6);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (13, 20);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (14, 7); 
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (14, 19);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (15, 8);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (15, 17);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (16, 9);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (16, 12);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (16, 2);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (16, 11);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (17, 1);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (17, 10);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (17, 3); 
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (17, 12);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (18, 5);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (18, 13);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (19, 4); 
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (19, 13);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (19, 7);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (19, 14);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (20, 6); 
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (20, 13);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (20, 8);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (20, 15);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (21, 22);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (21, 1);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (22, 24);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (22, 2);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (23, 21);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (23, 3);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (24, 22);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (24, 6);

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (25, 23);
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (25, 9); 

INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (26, 25); 
INSERT INTO Elfe_Remplace (id_absent, id_remplacant) VALUES (26, 11); 

INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (1, 'Bois Magique', '12 Rue des Lutins, 59000 Lille'); 
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (2, 'Papier Cadeau', '45 Avenue des Étoiles, 62000 Arras');
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (3, 'Couleurs Féeriques', '78 Rue des Pinceaux, 80000 Amiens');
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (4, 'Métaux Enchantés', '23 Boulevard des Forges, 02100 Saint-Quentin');
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (5, 'Fil Magique', '5 Place des Elfes, 60200 Compiègne');
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (6, 'Rouages Mystiques', '14 Impasse des Lutins, 59200 Tourcoing');  
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (7, 'Circuits Magiques', '32 Route des Énergies, 62500 Saint-Omer');
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (8, 'Grand Test', '9 Allée du Père Noël, 59300 Valenciennes'); 
INSERT INTO Atelier (id_atelier, nom_atelier, adr_atelier) VALUES (9, 'Mains Habiles', '67 Rue des Jouets, 60280 Senlis');

INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (1, 500, 'R'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (2, 600, 'V'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (3, 550, 'M');  
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (4, 700, 'R'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (5, 800, 'V'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (6, 650, 'M'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (7, 750, 'R'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (8, 850, 'V');  
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (9, 900, 'M'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (10, 1000, 'R');  
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (11, 1100, 'V'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (12, 950, 'M'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (13, 1200, 'R'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (14, 1300, 'V'); 
INSERT INTO Traineau (id_tr, volume_tr, couleur_tr) VALUES (15, 1400, 'M'); 

INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (1, 'Rudolphe', 1500, 13, 1, 'OUI');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (2, 'Comète', 1200, 13, 2, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (3, 'Étoile', 1100, 13, 3, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (4, 'Frimas', 1350, 13, 4, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (5, 'Pluie', 1450, 13, 5, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (6, 'Lutin', 1300, 13, 6, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (7, 'Glace', 1400, 13, 7, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (8, 'Neige', 1250, 13, 8, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (9, 'Frost', 1550, 14, 1, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (10, 'Hiver', 1600, 14, 2, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (11, 'Givre', 1500, 14, 3, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (12, 'Soleil', 1700, 14, 4, 'OUI');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (13, 'Tempête', 1800, 14, 5, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (14, 'Avalanche', 1900, 14, 6, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (15, 'Mistral', 2000, 14, 7, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (16, 'Boreal', 1400, 14, 8, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (17, 'Vent', 1350, 15, 1, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (18, 'Blizzard', 1450, 15, 2, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (19, 'Aurore', 1600, 15, 3, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (20, 'Neptune', 1500, 15, 4, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (21, 'Solstice', 1550, 15, 5, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (22, 'Odyssée', 1700, 15, 6, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (23, 'Nebula', 1650, 15, 7, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (24, 'Polaris', 1500, 15, 8, 'OUI');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (25, 'Stella', 1600, null, 0, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (26, 'Chimère', 1400, null, 0, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (27, 'Orion', 1750, null, 0, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (28, 'Nébuleuse', 1450, null, 0, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (29, 'Phoenix', 1850, null, 0, 'NON');  
INSERT INTO Renne (id_renne, nom_renne, capac_renne, id_tr, position_tr, capitaine) VALUES (30, 'Galaxie', 1900, null, 0, 'NON');

INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('NA', 'Amérique du Nord', 'Québec', 10000, 1);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('SA', 'Amérique du Sud', 'La Paz', 8000, 2);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('EUW', 'Europe de l''Ouest', 'Paris', 15000, 3);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('EUE', 'Europe de l''Est', 'Moscou', 12000, 4);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('AFN', 'Afrique du Nord', 'Marrakech', 9000, 5);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('AFS', 'Afrique du Sud', 'Dakar', 11000, 6);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('ASE', 'Asie du Sud-Est', 'Singapour', 9500, 7);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('AE', 'Asie de l''Est', 'Pékin', 13500, 8);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('AC', 'Asie Centrale', 'Almaty', 8500, 9);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('OCE', 'Océanie', 'Sydney', 7000, 10);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('ANT', 'Antarctique', 'Station Polaire', 6000, 11);  
INSERT INTO Entrepot (region, nom_region, ville, capac_ent, id_tr) VALUES ('MO', 'Moyen-Orient', 'Dubaï', 10500, 12);  

INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (1, 'Les Menuisiers', 'MEN', 1, 1, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (2, 'Les Emballeurs', 'EMB', 2, 2, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (3, 'Les Artistes', 'PEI', 3, 3, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (4, 'Les Étincelles', 'SOU', 4, 4, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (5, 'Les Aiguilles', 'COU', 5, 5, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (6, 'Les Mécanos', 'MEC', 6, 6, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (7, 'Les Nerds', 'ELE', 7, 7, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (8, 'Les Petits Testeurs', 'TST', 8, 8, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (9, 'Les Assembleurs', 'ASB', 9, 9, null);
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (10, 'The Cleaners', 'ENT', 21, null, 'NA');
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (11, 'Los Limpiadores', 'ENT', 22, null, 'SA');
INSERT INTO Equipe (id_equipe, nom_equipe, id_spe, id_chef, id_atelier, region) VALUES (12, 'Les Nettoyeurs', 'ENT', 23, null, 'EUW');

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (1, 1);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (10, 1);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (17, 1);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (2, 2);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (11, 2);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (3, 3);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (12, 3);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (4, 4);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (19, 4);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (5, 5);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (18, 5);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (6, 6);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (13, 6);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (20, 6);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (7, 7);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (14, 7);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (8, 8);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (15, 8);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (9, 9);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (16, 9);

INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (21, 10);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (22, 10);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (23, 11);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (24, 11);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (25, 12);
INSERT INTO Elfe_Equipe (id_elfe, id_equipe) VALUES (26, 12);


INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (1, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (2, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (3, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (4, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (5, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (6, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (7, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (8, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (9, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (10, 2, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (1, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (2, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (3, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (4, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (5, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (6, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (7, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (8, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (9, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (10, 3, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (6, 4, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (7, 4, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (8, 4, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (9, 4, 'F');
INSERT INTO Demande (id_enfant, id_jouet, jouet_choisi) VALUES (10, 4, 'F');

