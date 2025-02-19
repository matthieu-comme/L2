CREATE TABLE `cartegrise` (
  `id_pers` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `immat` varchar(7) NOT NULL,
  `datecarte` date NOT NULL DEFAULT '1970-01-01'
) ;
INSERT INTO `cartegrise` (`id_pers`, `immat`, `datecarte`) VALUES
(1, 'CCCCCCC', '2000-01-01'),
(1, 'DDDDDD', '2001-01-01'),
(1, 'DEF19GH', '1970-01-01'),
(2, '123AB45', '1970-01-01'),
(2, 'XYZ12AB', '1970-01-01'),
(4, 'XYZ12AB', '1970-01-01');

CREATE TABLE `modele` (
  `id_modele` varchar(10) NOT NULL DEFAULT '',
  `modele` varchar(30) NOT NULL DEFAULT '',
  `carburant` enum('essence','diesel','gpl','electrique') NOT NULL DEFAULT 'essence'
);

INSERT INTO `modele` (`id_modele`, `modele`, `carburant`) VALUES
('178524ER45', 'Citroën Picasso', 'essence'),
('17C92853AZ', 'Citroën C5', 'diesel'),
('33356677PO', 'Peugeot 206', 'electrique'),
('485228FGD7', 'Volkswagen Golf', 'diesel'),
('563339GH56', 'Citroën C3', 'essence'),
('7499RF5679', 'Renault Mégane Scénic', 'diesel'),
('83321TY455', 'Renault Espace', 'diesel'),
('ABCD', 'Test Modèle', 'electrique'),
('ALLOOUI', 'prout mobile', 'diesel'),
('AZER67455T', 'Peugeot 307', 'essence'),
('BOBOMAMAN', 'Gmal', 'electrique'),
('DSQS455674', 'Renault Adventime', 'diesel'),
('FTH55432GH', 'Renault Twingo', 'essence'),
('PIPIPIPI12', 'Toz Toz', 'essence'),
('ZER627864K', 'Ferrari GT 40', 'essence');


CREATE TABLE `proprietaire` (
  `id_pers` mediumint UNSIGNED NOT NULL,
  `nom` varchar(30) NOT NULL DEFAULT '',
  `prenom` varchar(30) NOT NULL DEFAULT '',
  `adresse` varchar(50) NOT NULL DEFAULT '',
  `ville` varchar(40) NOT NULL DEFAULT '',
  `codepostal` mediumint UNSIGNED NOT NULL DEFAULT '0'
);



INSERT INTO `proprietaire` (`id_pers`, `nom`, `prenom`, `adresse`, `ville`, `codepostal`) VALUES
(1, 'Reyel', 'Colonel', '123 rue Bidon', 'Paris', 75013),
(2, 'Donald', 'Mac', '66 rue Street', 'New York', 66666),
(3, 'White', 'Walter', '12 rue de la Meth', 'Albuquerque', 55555),
(4, 'Ida', 'Zoub', '213 rue du Bar', 'Paris', 75018);



CREATE TABLE `voiture` (
  `immat` varchar(7) NOT NULL,
  `id_modele` varchar(10) NOT NULL DEFAULT '',
  `couleur` enum('claire','moyenne','foncée') NOT NULL DEFAULT 'claire',
  `datevoiture` date NOT NULL DEFAULT '1970-01-01'
);



INSERT INTO `voiture` (`immat`, `id_modele`, `couleur`, `datevoiture`) VALUES
('123AB45', '563339GH56', 'moyenne', '1979-01-01'),
('ABC12DE', '17C92853AZ', 'claire', '1970-01-01'),
('CCCCCCC', 'PIPIPIPI12', 'claire', '1990-01-01'),
('DDDDDD', 'ALLOOUI', 'moyenne', '1987-08-07'),
('DEF19GH', 'FTH55432GH', 'foncée', '1970-09-01'),
('XYZ12AB', '7499RF5679', 'claire', '2001-09-09');


ALTER TABLE `cartegrise`
  ADD PRIMARY KEY (`id_pers`,`immat`),
  ADD KEY `immat` (`immat`);


ALTER TABLE `modele`
  ADD PRIMARY KEY (`id_modele`);

ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`id_pers`);

ALTER TABLE `voiture`
  ADD PRIMARY KEY (`immat`),
  ADD KEY `voiture_ibfk_1` (`id_modele`);

ALTER TABLE `proprietaire`
  MODIFY `id_pers` mediumint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `cartegrise`
  ADD CONSTRAINT `cartegrise_ibfk_1` FOREIGN KEY (`id_pers`) REFERENCES `proprietaire` (`id_pers`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cartegrise_ibfk_2` FOREIGN KEY (`immat`) REFERENCES `voiture` (`immat`) ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE `voiture`
  ADD CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id_modele`) ON DELETE RESTRICT ON UPDATE RESTRICT;
