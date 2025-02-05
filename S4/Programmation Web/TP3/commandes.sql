CREATE TABLE `proprietaire` (
`id_pers` mediumint(8) unsigned NOT NULL auto_increment,
`nom` varchar(30) NOT NULL default '',
`prenom` varchar(30) NOT NULL default '',
`adresse` varchar(50) NOT NULL default '',
`ville` varchar(40) NOT NULL default '',
`codepostal` mediumint(5) unsigned NOT NULL default '0',
PRIMARY KEY (`id_pers`));
CREATE TABLE `cartegrise` (
`id_pers` mediumint(8) unsigned NOT NULL default '0',
`immat` varchar(6) NOT NULL default '',
`datecarte` date NOT NULL default '1970-01-01',
PRIMARY KEY (`id_pers`,`immat`));
CREATE TABLE `voiture` (
`immat` varchar(6) NOT NULL default '',
`id_modele` varchar(10) NOT NULL default '',
`couleur` enum('claire','moyenne','foncée') NOT NULL default
'claire',
`datevoiture` date NOT NULL default '1970-01-01',
PRIMARY KEY (`immat`));
CREATE TABLE `modele` (
`id_modele` varchar(10) NOT NULL default '',
`modele` varchar(30) NOT NULL default '',
`carburant` enum('essence','diesel','gpl','electrique') NOT NULL
default 'essence',
PRIMARY KEY (`id_modele`));

DROP TABLE modele;
DROP TABLE voiture;
DROP TABLE cartegrise;
DROP TABLE proprietaire;

INSERT INTO `proprietaire` (`nom`, `prenom`, `adresse`, `ville`, `codepostal`)VALUES
('Reyel', 'Colonel','123 rue Bidon','Paris','75013'),
('Donald', 'Mike','66 rue Street','New York','66666'),
('White', 'Walter','12 rue de la Meth','Albuquerque','55555'),
('Ida', 'Zoub','213 rue du Bar','Paris','75018');

SELECT proprietaire.nom, cartegrise.immat FROM modele,voiture,cartegrise,proprietaire WHERE modele.id_modele=voiture.id_modele AND voiture.immat = cartegrise.immat AND cartegrise.id_pers = proprietaire.id_pers AND modele.id_modele = '7499RF5679';
