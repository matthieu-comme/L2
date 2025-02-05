--
-- Table structure for table `modele`
--

CREATE TABLE IF NOT EXISTS `modele` (
  `id_modele` varchar(10) NOT NULL DEFAULT '',
  `modele` varchar(30) NOT NULL DEFAULT '',
  `carburant` enum('essence','diesel','gpl','électrique') NOT NULL DEFAULT 'essence',
  PRIMARY KEY (`id_modele`)
);

--
-- Dumping data for table `modele`
--

INSERT INTO `modele` (`id_modele`, `modele`, `carburant`) VALUES
('33356677PO', 'Peugeot 206', 'électrique'),
('178524ER45', 'Citroën Picasso', 'essence'),
('7499RF5679', 'Renault Mégane Scénic', 'diesel'),
('17C92853AZ', 'Citroën C5', 'diesel'),
('563339GH56', 'Citroën C3', 'essence'),
('83321TY455', 'Renault Espace', 'diesel'),
('AZER67455T', 'Peugeot 307', 'essence'),
('FTH55432GH', 'Renault Twingo', 'essence'),
('DSQS455674', 'Renault Adventime', 'diesel'),
('485228FGD7', 'Volkswagen Golf', 'diesel'),
('ZER627864K', 'Ferrari GT 40', 'essence');
