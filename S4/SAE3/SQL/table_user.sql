CREATE TABLE utilisateur ( 
pseudo VARCHAR(20),
mdp VARCHAR(50),
CONSTRAINT pk_user PRIMARY KEY(pseudo));

INSERT INTO utilisateur VALUES('lutin1','mdp1');
INSERT INTO utilisateur VALUES('lutin2','mdp2');
INSERT INTO utilisateur VALUES('LUTIN1','MDP1');	