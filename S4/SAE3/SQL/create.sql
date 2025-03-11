CREATE TABLE Specialite (
	id_spe CHAR(3),
	nom_spe VARCHAR(20) NOT NULL,
	CONSTRAINT pk_specialite PRIMARY KEY (id_spe)
);

CREATE TABLE Elfe (
	id_elfe INTEGER,
	nom_elfe VARCHAR(20) NOT NULL,
	CONSTRAINT pk_elfe PRIMARY KEY (id_elfe)
);

CREATE TABLE Elfe_Spe (
	id_elfe INTEGER,
	id_spe CHAR(3),
	type_spe CHAR(1) NOT NULL,
	CONSTRAINT pk_elfespe PRIMARY KEY (id_elfe, id_spe),
	CONSTRAINT fk_elfespe_elfe FOREIGN KEY(id_elfe) REFERENCES Elfe(id_elfe),
	CONSTRAINT fk_elfespe_spe FOREIGN KEY(id_spe) REFERENCES Specialite(id_spe),
	CONSTRAINT ck_elfespe_typespe CHECK (type_spe IN ('P', 'S'))
);

CREATE TABLE Elfe_Remplace (
	id_absent INTEGER,
	id_remplacant INTEGER,
	CONSTRAINT pk_elferemplace PRIMARY KEY (id_absent, id_remplacant),
	CONSTRAINT fk_absent_elfe FOREIGN KEY(id_absent) REFERENCES Elfe(id_elfe),
	CONSTRAINT fk_remplacant_elfe FOREIGN KEY(id_remplacant) REFERENCES Elfe(id_elfe)
);

CREATE TABLE Atelier (
	id_atelier INTEGER,
	nom_atelier VARCHAR(20) NOT NULL,
	adr_atelier VARCHAR(100) NOT NULL,
	CONSTRAINT pk_atelier PRIMARY KEY (id_atelier)
);

CREATE TABLE Traineau (
	id_tr INTEGER,
	volume_tr INTEGER NOT NULL,
	couleur_tr CHAR(1) NOT NULL,
	CONSTRAINT pk_tr PRIMARY KEY(id_tr),
	CONSTRAINT ck_tr CHECK (couleur_tr IN ('M', 'R', 'V'))
);

CREATE TABLE Renne (
	id_renne INTEGER,
	nom_renne VARCHAR(20),
	capac_renne NUMBER(4,0) NOT NULL,
	id_tr INTEGER,
	position_tr INTEGER NOT NULL,
	capitaine CHAR(3) NOT NULL,
	CONSTRAINT pk_renne PRIMARY KEY(id_renne),
	CONSTRAINT fk_renne_traineau FOREIGN KEY(id_tr) REFERENCES Traineau(id_tr),
	CONSTRAINT ck_renne_position CHECK (position_tr BETWEEN 0 AND 8),
	CONSTRAINT ck_renne_capac CHECK (capac_renne > 0),
	CONSTRAINT ck_renne_capitaine CHECK (capitaine IN ('OUI','NON'))
);

CREATE TABLE Fournisseur (
	id_fo INTEGER,
	nom_fo VARCHAR(20) NOT NULL,
	tel_go VARCHAR(10),
	email_fo VARCHAR(50),
	adr_fo VARCHAR(100) NOT NULL,
	CONSTRAINT pk_fo PRIMARY KEY (id_fo)
);

CREATE TABLE Matiere_Premiere (
    id_mat INTEGER,
    nom_mat VARCHAR(20) NOT NULL,
    cout_mat NUMBER(6,3) NOT NULL,
    id_fo INTEGER NOT NULL,
    CONSTRAINT pk_mat PRIMARY KEY (id_mat),
    CONSTRAINT fk_fo FOREIGN KEY(id_fo) REFERENCES Fournisseur(id_fo)
);

CREATE TABLE Jouet (
    id_jouet INTEGER,
    nom_jouet VARCHAR(20) NOT NULL,
    CONSTRAINT pk_jouet PRIMARY KEY (id_jouet)
);

CREATE TABLE Est_compose (
    id_mat INTEGER,
    id_jouet INTEGER,
    quantite NUMBER(6,3) NOT NULL,
    CONSTRAINT pk_estcompose PRIMARY KEY (id_mat,id_jouet),
    CONSTRAINT fk_estcompose_matierepremiere  FOREIGN KEY(id_mat) REFERENCES Matiere_Premiere(id_mat),
    CONSTRAINT fk_estcompose_jouet  FOREIGN KEY(id_jouet) REFERENCES Jouet(id_jouet)
);

CREATE TABLE Fabrique ( /* après atelier */
    id_jouet INTEGER,
    id_atelier INTEGER,
    CONSTRAINT pk_fabrique PRIMARY KEY (id_atelier,id_jouet),
    CONSTRAINT fk_fabrique_atelier FOREIGN KEY(id_atelier) REFERENCES Atelier(id_atelier),
    CONSTRAINT fk_fabrisue_jouet FOREIGN KEY(id_jouet) REFERENCES Jouet(id_jouet)
); 

CREATE TABLE Sous_traitant (
    id_st INTEGER,
    nom_st VARCHAR(20) NOT NULL,
    tel_st VARCHAR(10),
    email_st VARCHAR(50),
    adr_st VARCHAR(100),
    CONSTRAINT pk_st PRIMARY KEY (id_st)
);

CREATE TABLE Sous_traite (
    id_st INTEGER,
    id_jouet INTEGER,
    CONSTRAINT pk_soustraite PRIMARY KEY (id_st,id_jouet),
    CONSTRAINT fk_soustraite_st FOREIGN KEY(id_st) REFERENCES Sous_traitant(id_st),
    CONSTRAINT fk_soustraite_jouet FOREIGN KEY(id_jouet) REFERENCES Jouet(id_jouet)
);

CREATE TABLE Substitue (
    id_substitue INTEGER,
    id_substituant INTEGER,
    CONSTRAINT pk_substitue PRIMARY KEY (id_substitue,id_substituant),
    CONSTRAINT fk_substitue_jouet FOREIGN KEY(id_substitue) REFERENCES Jouet(id_jouet),
    CONSTRAINT fk_substituant_jouet FOREIGN KEY(id_substituant) REFERENCES Jouet(id_jouet)
);

CREATE TABLE Entrepot ( /* après traineau */
    region VARCHAR(3),
    nom_region VARCHAR(20) NOT NULL,
    ville VARCHAR(20),
    capac_ent INTEGER NOT NULL,
    id_tr INTEGER NOT NULL,
    CONSTRAINT pk_ent PRIMARY KEY (region),
    CONSTRAINT fk_ent_tr FOREIGN KEY(id_tr) REFERENCES Traineau(id_tr)
); 

CREATE TABLE Est_stocke (
    id_jouet INTEGER,
    region VARCHAR(3),
    quantite NUMBER(6,3) NOT NULL,
    CONSTRAINT pk_eststocke PRIMARY KEY (id_jouet, region),
    CONSTRAINT fk_eststocke_ent FOREIGN KEY(region) REFERENCES Entrepot(region),
    CONSTRAINT fk_eststocke_jouet FOREIGN KEY(id_jouet) REFERENCES Jouet(id_jouet)
);

CREATE TABLE Tournee (
    id_to INTEGER,
    date_to DATE NOT NULL,
    CONSTRAINT pk_to PRIMARY KEY (id_to)
);

CREATE TABLE Intermittent (
    id_int INTEGER,
    nom_int VARCHAR(20) NOT NULL,
    id_to INTEGER NOT NULL,
    CONSTRAINT pk_int PRIMARY KEY  (id_int),
    CONSTRAINT fk_int_to FOREIGN KEY(id_to) REFERENCES Tournee(id_to)
);

CREATE TABLE Est_affecte (
    region VARCHAR(3),
    id_int INTEGER,
    CONSTRAINT pk_estaffecte PRIMARY KEY (region,id_int),
    CONSTRAINT fk_estaffecte_ent FOREIGN KEY(region) REFERENCES Entrepot(region),
    CONSTRAINT fk_estaffecte_int FOREIGN KEY(id_int) REFERENCES Intermittent(id_int)
);
CREATE TABLE Enfant (
    id_enfant INTEGER,
    nom_enfant VARCHAR(20) NOT NULL,
    prenom_enfant VARCHAR(20) NOT NULL,
    adr_enfant VARCHAR(100) NOT NULL,
    id_to INTEGER NOT NULL,
    CONSTRAINT pk_enfant PRIMARY KEY  (id_enfant),
    CONSTRAINT fk_enfant_to FOREIGN KEY(id_to) REFERENCES Tournee(id_to)
);
CREATE TABLE Distribue (
    id_enfant INTEGER,
    id_jouet INTEGER,
    id_to INTEGER,
    CONSTRAINT pk_distribue PRIMARY KEY (id_enfant,id_jouet, id_to),
    CONSTRAINT fk_distribue_efant FOREIGN KEY(id_enfant) REFERENCES Enfant(id_enfant),
    CONSTRAINT fk_distribue_jouet FOREIGN KEY(id_jouet) REFERENCES Jouet(id_jouet),
    CONSTRAINT fk_distribue_to FOREIGN KEY(id_to) REFERENCES Tournee(id_to)
);

CREATE TABLE Demande (
    id_enfant INTEGER,
    id_jouet INTEGER,
    jouet_choisi CHAR(1),
    CONSTRAINT pk_demande PRIMARY KEY (id_enfant, id_jouet),
    CONSTRAINT fk_demande_enfant FOREIGN KEY(id_enfant) REFERENCES Enfant(id_enfant),
    CONSTRAINT fk_demande_jouet FOREIGN KEY(id_jouet) REFERENCES Jouet(id_jouet),
    CONSTRAINT ck_jouetchoisi CHECK ( jouet_choisi IN ('V', 'F') )
);

CREATE TABLE Equipe (
	id_equipe INTEGER,
	nom_equipe VARCHAR(20) NOT NULL,
	id_spe CHAR(3) NOT NULL,
	id_chef INTEGER NOT NULL,
	id_atelier INTEGER,
	region VARCHAR(3),
	CONSTRAINT pk_equipe PRIMARY KEY(id_equipe),
	CONSTRAINT fk_equipe_spe FOREIGN KEY(id_spe) REFERENCES Specialite(id_spe),
	CONSTRAINT fk_equipe_elfe FOREIGN KEY(id_chef) REFERENCES Elfe(id_elfe),
	CONSTRAINT fk_equipe_atelier FOREIGN KEY(id_atelier) REFERENCES Atelier(id_atelier),
	CONSTRAINT fk_equipe_entrepot FOREIGN KEY(region) REFERENCES Entrepot(region)
);

CREATE TABLE Elfe_Equipe (
    id_elfe INTEGER,
    id_equipe INTEGER,
    CONSTRAINT pk_elfeequipe PRIMARY KEY (id_elfe, id_equipe),
    CONSTRAINT fk_elfeequipe_elfe FOREIGN KEY (id_elfe) REFERENCES Elfe(id_elfe),
    CONSTRAINT fk_elfeequipe_equipe FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);
