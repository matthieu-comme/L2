CREATE TABLE Realisateur (
	id INTEGER NOT NULL,
	nom VARCHAR(20) NOT NULL,
	prenom VARCHAR(20) NOT NULL,
	CONSTRAINT realisateur_pk PRIMARY KEY (id)
);

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
