DROP TABLE   TOURISTE ;
DROP TABLE  MONUMENT ;
DROP TABLE  VISITE ;




 CREATE TABLE TOURISTE (
         nom      VARCHAR2(50) NOT NULL,
         prenom       	  VARCHAR2(50),
         age         	  INT,
         paysorigine      VARCHAR2(50),
	 PRIMARY KEY (nom));
	
   CREATE TABLE MONUMENT (
         nom      VARCHAR2(50) NOT NULL,
         ville       	  VARCHAR2(50),
         pays         	  VARCHAR2(50),
         anneeConstruction    INT,
         PRIMARY KEY (nom));

   CREATE TABLE VISITE (
         nomTouriste      VARCHAR2(50) NOT NULL,
         nomMonument    	  VARCHAR2(50),
         datevisite         	  DATE,
         prixEntree    FLOAT,
         PRIMARY KEY (nomTouriste,nomMonument));


INSERT INTO TOURISTE VALUES ('Bonaparte', 'Napoleon', 37, 'France');
INSERT INTO TOURISTE VALUES ('Tepes', 'Vlad', 28, 'Roumanie');
INSERT INTO TOURISTE VALUES ('Legrand', 'Alexandre', 33, 'Grece');
INSERT INTO TOURISTE VALUES ('Deux', 'Nicolas', 41, 'Russie');
INSERT INTO TOURISTE VALUES ('Cesar', 'Jules', 44, 'Italie');
INSERT INTO TOURISTE VALUES ('Darc', 'Jeanne', 18, 'France');
INSERT INTO TOURISTE VALUES ('Joel', 'Shelley', 23, 'France');

INSERT INTO MONUMENT VALUES ('Chateau de Dracula', 'Bran', 'Roumanie', 1377);
INSERT INTO MONUMENT VALUES ('Tour Eiffel', 'Paris', 'France', 1889);
INSERT INTO MONUMENT VALUES ('Corcovado', 'Rio', 'Bresil', 1931);
INSERT INTO MONUMENT VALUES ('Colisee', 'Rome', 'Italie', 80);
INSERT INTO MONUMENT VALUES ('Tour de Pise', 'Pise', 'Italie', 1350);
INSERT INTO MONUMENT VALUES ('Chateau de Versailles', 'Versailles', 'France', NULL);
INSERT INTO MONUMENT VALUES ('Cathedrale de la Se', 'Sao Paulo', 'Bresil', 1954);
INSERT INTO MONUMENT VALUES ('Maison du Peuple', 'Bucarest', 'Roumanie', 1984);

INSERT INTO VISITE VALUES ('Bonaparte', 'Colisee', '12/12/2008', 10);
INSERT INTO VISITE VALUES ('Tepes', 'Cathedrale de la Se', '18/05/2010', 0);
INSERT INTO VISITE VALUES ('Cesar', 'Tour Eiffel', '01/01/2005', 15);
INSERT INTO VISITE VALUES ('Legrand', 'Tour Eiffel', '23/11/2008', 25);
INSERT INTO VISITE VALUES ('Cesar', 'Corcovado', '25/12/2006', 12);
INSERT INTO VISITE VALUES ('Legrand', 'Chateau de Dracula', '14/02/2009', NULL);
INSERT INTO VISITE VALUES ('Cesar', 'Cathedrale de la Se', '18/12/2006', 5);
INSERT INTO VISITE VALUES ('Bonaparte', 'Maison du Peuple', '25/09/2010', 20);
INSERT INTO VISITE VALUES('Joel','Tour Eiffel','23/11/2014',0);




SELECT * from MONUMENT;
SELECT * from TOURISTE WHERE paysorigine = 'France' ;
SELECT nom,ville from MONUMENT WHERE pays = 'Roumanie';
SELECT DISTINCT ville FROM MONUMENT where anneeConstruction BETWEEN 500 AND 1500 ;
SELECT * from VISITE WHERE  EXTRACT(YEAR FROM datevisite) = 2014 AND prixEntree=0;
--6 - Donner le nom des monuments qui sont des tours et dont le prix d’entrée peut atteindre 20 euros.
SELECT MONUMENT.nom FROM MONUMENT LEFT OUTER JOIN VISITE ON MONUMENT.nom = VISITE.nomMonument 
where VISITE.prixEntree >=20 ;
--7. Donner la liste des monuments triés par ville croissante et par année de construction décroissante
select * from MONUMENT ORDER BY ville ASC , anneeConstruction DESC ;
-- 8. Donner la liste des monuments dont on ne connait pas la date
--de construction (ou pour lesquels la date de
--construction n’a pas de sens).
select * from monument where anneeConstruction IS NULL ;
--9. Donner le nom, prénom et âge des touristes ainsi que le nom d
--es monuments qu’ils ont visités.
SELECT TOURISTE.nom,TOURISTE.prenom,TOURISTE.age,MONUMENT.nom FROM VISITE 
	INNER JOIN MONUMENT ON VISITE.nomMonument = MONUMENT.nom
	INNER JOIN TOURISTE ON TOURISTE.nom = VISITE.nomTouriste ;


--
