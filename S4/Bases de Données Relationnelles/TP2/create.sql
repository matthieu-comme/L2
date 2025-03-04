CREATE TABLE Region (
	idR CHAR(3),
	nomR VARCHAR(20),
	CONSTRAINT pk_region PRIMARY KEY (idR)
);

CREATE TABLE Activite (
	idA VARCHAR(3),
	libelleAct VARCHAR(50) NOT NULL,
	CONSTRAINT pk_activite PRIMARY KEY (idA)
);

CREATE TABLE Client (
	idC CHAR(4),
	nom VARCHAR(20) NOT NULL,
	prenom VARCHAR(20),
	ville VARCHAR(20) NOT NULL,
	solde NUMBER(7,2) DEFAULT 0,
	CONSTRAINT pk_client PRIMARY KEY (idC)
);

CREATE TABLE Station (
	idS CHAR(4), 
	nomStation VARCHAR(20),
	capacite INTEGER NOT NULL,
	lieu VARCHAR(20),
	idR CHAR(3),
	tarif NUMBER(7,2) DEFAULT 0,
	CONSTRAINT pk_station PRIMARY KEY (idS),
	CONSTRAINT fk_station_region FOREIGN KEY (idR) REFERENCES Region (idR),
	CONSTRAINT unique_station UNIQUE (lieu, idR),
	CONSTRAINT ck_station_tarif CHECK (tarif >= 0),
	CONSTRAINT ck_station_capacite CHECK (capacite >= 0)
);

CREATE TABLE Sejour (
	idC CHAR(4),
	idS CHAR(4),
	DateDeb DATE,
	DateFin DATE,
	nbPlaces INTEGER NOT NULL,
	CONSTRAINT pk_sejour PRIMARY KEY (idC, idS, DateDeb),
	CONSTRAINT fk_sejour_station FOREIGN KEY (idS) REFERENCES Station (idS) ON DELETE CASCADE,
	CONSTRAINT ck_sejour_dates CHECK (DateDeb < DateFin)
);

CREATE TABLE Proposer (
	idS CHAR(4),
	idA VARCHAR(3),
	prix NUMBER(7,2) DEFAULT 0,
	CONSTRAINT pk_proposer PRIMARY KEY(idS, idA),
	CONSTRAINT fk_proposer_sejour FOREIGN KEY (idS) REFERENCES Station (idS) ON DELETE CASCADE,
	CONSTRAINT fk_proposer_activite FOREIGN KEY (idA) REFERENCES Activite (idA),
	CONSTRAINT ck_proposer_prix CHECK (prix >= 0)
);
