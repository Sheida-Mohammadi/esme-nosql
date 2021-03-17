// EXERCICE 1



// Etape 1 create keyspace
CREATE KEYSPACE elections WITH replication = {'class' : 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE ADMINISTRE (
	NOM_A text PRIMARY KEY,
	PRENOM_A text,
	ADRESSE text,
	NIN varint 

);

CREATE TABLE CANDIDAT(
	NOM_P text,
	PRENOM_P text,
	PARTI_POLITIQUE text,
  NBR_VOTE int,
  PRIMARY KEY (PARTI_POLITIQUE, NBR_VOTE, NOM_P)
  
);


CREATE TABLE VOTE(
	NOM_A text,
	NOM_P text,
	PRIMARY KEY(NOM_A, NOM_P)
);



// CREER DES CANDIDATS

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Dupont', 'Jean', 'B', 43);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Mid', 'Jeanne', 'A', 64);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Quiche', 'Luc', 'C', 25);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Titi', 'Jean', 'B', 42);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Mad', 'Jeanne', 'A', 63);

INSERT INTO Candidat(Nom_P, Prenom_P, Parti_politique, nbr_vote)
VALUES ('Mud', 'Luc', 'C', 26);


// CREER DES ADMINISTRES

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Martin', 'Matin', '90 rue des etoiles 34000', 4);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Michelle', 'Jacques', '17 rue de la fontaine 23450', 6);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Guigui', 'Lucienne', '56 rue du faubourg 78900', 2);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Boun', 'Dany', '87 rue de la joie 87654', 9);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Joud', 'Jas', '6 rue de la chaud 12678', 1);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)
VALUES ('Nouille', 'Chine', '9 rue du passage 75900', 3);

// CREER DES VOTES

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Martin', 'Mud');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Guigui', 'Mad');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Boun', 'Titi');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Michelle', 'Quiche');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Joud', 'Mid');

INSERT INTO VOTE (NOM_A, NOM_P)
VALUES ('Nouille', 'Dupont');



// QUESTION 1 : Le parti politique ayant le plus de voix

// Affiche le tableau du nombre de votes par parti politique classé
SELECT  PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT GROUP BY PARTI_POLITIQUE;

// Affiche le nom du parti politique qui a eu le plus de vote (sachant qu'ici c'est A)
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT WHERE PARTI_POLITIQUE='A' ALLOW FILTERING;



// QUESTION 2 : Quel candidat a gagné les élections ?
SELECT NOM_P, PARTI_POLITIQUE, NBR_VOTE FROM CANDIDAT ORDER BY NBR_VOTE DESC;

// QUESTION 3: Candidat plus de voix ?

// On sait que le parti politique qui a le plus de voix est A

SELECT NOM_P, PARTI_POLITIQUE, MAX(NBR_VOTE) FROM CANDIDAT WHERE PARTI_POLITIQUE='A';





// EXERCICE 2 




// On reste dans la keyspace elections

// On créer une table gagnant candidat de communes
CREATE TABLE GAGNANT_CANDIDAT_COMMUNE (
    NOM_C text ,
    PRENOM_C text,
    PARTI_POLITIQUE text,
    NBR_VOTE int,
    COMMUNE text,
    PRIMARY KEY (PARTI_POLITIQUE,NBR_VOTE),) ;
    
// On insert des candidats de communes

INSERT INTO GAGNANT_CANDIDATS_COMMUNES (NOM_C , PRENOM_C , PARTI_POLITIQUE , NBR_VOTE, COMMUNE)
VALUES ('lala', 'tut, 'A', 1, 'Versailles');

INSERT INTO GAGNANT_CANDIDATS_COMMUNES (NOM_C , PRENOM_C , PARTI_POLITIQUE , NBR_VOTE, COMMUNE)
VALUES ('lolo', 'tit', 'B', 2, 'Poissy');

INSERT INTO GAGNANT_CANDIDATS_COMMUNES (NOM_C , PRENOM_C , PARTI_POLITIQUE , NBR_VOTE, COMMUNE)
VALUES ('lili', 'tot', 'C', 3, 'Trappes');

INSERT INTO GAGNANT_CANDIDATS_COMMUNES (NOM_C , PRENOM_C , PARTI_POLITIQUE , NBR_VOTE, COMMUNE)
VALUES ('lulu', 'tat', 'A', 4, 'Rambouillet');
    
    
// QUESTION 1 : Quel est le parti politique ayant eu le plus de voix ?

// Affiche le tableau du nombre de votes par parti politique
SELECT  PARTI_POLITIQUE, SUM(NBR_VOTE) FROM GAGNANT_CANDIDAT_COMMUNE GROUP BY PARTI_POLITIQUE;

// Affiche le nom du parti politique qui a eu le plus de vote (ici A)
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM GAGNANT_CANDIDAT_COMMUNE WHERE PARTI_POLITIQUE='A' ALLOW FILTERING;

// QUESTION 2 : Quel est le parti politique ayant eu le moins de voix ?

// Affiche le tableau du nombre de votes par parti politique
SELECT  PARTI_POLITIQUE, SUM(NBR_VOTE) FROM GAGNANT_CANDIDAT_COMMUNE GROUP BY PARTI_POLITIQUE;

// Affiche le nom du parti politique qui a eu le moins de vote (ici B)
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM GAGNANT_CANDIDAT_COMMUNE WHERE PARTI_POLITIQUE='B' ALLOW FILTERING;

