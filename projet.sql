-- Table Clients
CREATE TABLE Clients (
    numero_client VARCHAR2(15) CONSTRAINT pk_clients PRIMARY KEY,
    nom VARCHAR2(30),
    prenom VARCHAR2(30)
);

-- Table Boulangerie
CREATE TABLE Boulangerie (
    numero_siret VARCHAR2(14) CONSTRAINT pk_boulangerie PRIMARY KEY,
    nom_boulangerie VARCHAR2(40),
    adresse VARCHAR2(50),
    ville VARCHAR2(20),
    heure_ouverture VARCHAR2(8),
    heure_fermeture VARCHAR2(8),
    nss_responsable VARCHAR2(14)
);

-- Table Equipe
CREATE TABLE Equipe (
    numero_equipe NUMBER CONSTRAINT pk_equipe PRIMARY KEY,
    horaire VARCHAR2(50),
    num_siret_magasin VARCHAR2(14) CONSTRAINT fk_magasin_equipe REFERENCES Boulangerie(numero_siret)
);

-- Table Employe
CREATE TABLE Employe (
    nss VARCHAR2(14) CONSTRAINT pk_employe PRIMARY KEY,
    nom VARCHAR2(20),
    prenom VARCHAR2(20),
    date_naissance DATE,
    sexe CHAR(1),
    siret_magasin VARCHAR2(14),
    salaire NUMBER(10, 2),
    date_embauche DATE,
    num_equipe NUMBER CONSTRAINT fk_equipe REFERENCES Equipe(numero_equipe),
    jours_repos VARCHAR2(9),
    role VARCHAR2(40)
);

-- Ajout de la contrainte après la création de la table Employe
ALTER TABLE Employe
ADD CONSTRAINT fk_magasin
FOREIGN KEY (siret_magasin)
REFERENCES Boulangerie(numero_siret);

-- Table Vente
CREATE TABLE Vente (
    numero_vente NUMBER CONSTRAINT pk_vente PRIMARY KEY,
    date_vente DATE,
    date_recup DATE,
    num_siret_magasin VARCHAR2(14),
    nss_vendeur VARCHAR2(14),
    numero_client VARCHAR2(15),
    total NUMBER(10, 2)
);

-- Ajout des contraintes après la création des tables Vente et Employe
ALTER TABLE Vente
ADD CONSTRAINT fk_magasin_vente
FOREIGN KEY (num_siret_magasin)
REFERENCES Boulangerie(numero_siret);

ALTER TABLE Vente
ADD CONSTRAINT fk_vendeur
FOREIGN KEY (nss_vendeur)
REFERENCES Employe(nss);

ALTER TABLE Vente
ADD CONSTRAINT fk_client
FOREIGN KEY (numero_client)
REFERENCES Clients(numero_client);

-- Table Produit
CREATE TABLE Produit (
    reference_produit VARCHAR2(10) CONSTRAINT pk_produit PRIMARY KEY,
    prix NUMBER(4, 2),
    date_fabrication DATE,
    nss_fabricant VARCHAR2(14)
);

-- Ajout de la contrainte après la création de la table Produit
ALTER TABLE Produit
ADD CONSTRAINT fk_fabricant
FOREIGN KEY (nss_fabricant)
REFERENCES Employe(nss);

-- Table Pain
CREATE TABLE Pain (
    reference_produit VARCHAR2(10) CONSTRAINT pk_pain PRIMARY KEY,
    nom VARCHAR2(30),
    temperature_conservation NUMBER
);

-- Ajout de la contrainte après la création de la table Pain
ALTER TABLE Pain
ADD CONSTRAINT fk_reference_pain
FOREIGN KEY (reference_produit)
REFERENCES Produit(reference_produit);


-- Table Patisserie
CREATE TABLE Patisserie (
    reference_produit VARCHAR2(10) CONSTRAINT pk_patisserie PRIMARY KEY,
    nom Varchar(30),
    temperature_conservation NUMBER
);

-- Ajout de la contrainte après la création de la table Patisserie
ALTER TABLE Patisserie
ADD CONSTRAINT fk_reference_patisserie
FOREIGN KEY (reference_produit)
REFERENCES Produit(reference_produit);


-- Table Ligne_Vente
CREATE TABLE Ligne_Vente (
    numero_ligne_vente NUMBER CONSTRAINT pk_ligne PRIMARY KEY,
    numero_vente NUMBER,
    ref_produit VARCHAR2(10),
    total_ligne NUMBER,
    quantite NUMBER
);

-- Ajout des contraintes après la création de la table Ligne_Vente
ALTER TABLE Ligne_Vente
ADD CONSTRAINT fk_vente_ligne
FOREIGN KEY (numero_vente)
REFERENCES Vente(numero_vente);

ALTER TABLE Ligne_Vente
ADD CONSTRAINT fk_ligne_produit  
FOREIGN KEY (ref_produit)
REFERENCES Produit(reference_produit); 



-- INSERT CLIENTS
INSERT INTO Clients VALUES ('100000000000001', 'Dupont', 'Alice');
INSERT INTO Clients VALUES ('200000000000002', 'Martin', 'Bob');
INSERT INTO Clients VALUES ('300000000000003', 'Smith', 'Carol');
INSERT INTO Clients VALUES ('400000000000004', 'Jones', 'David');
INSERT INTO Clients VALUES ('500000000000005', 'Miller', 'Emma');
INSERT INTO Clients VALUES ('600000000000006', 'Wilson', 'Frank');
INSERT INTO Clients VALUES ('700000000000007', 'Taylor', 'Grace');
INSERT INTO Clients VALUES ('800000000000008', 'Anderson', 'Henry');
INSERT INTO Clients VALUES ('900000000000009', 'Perez', 'Isabella');
INSERT INTO Clients VALUES ('101000000000010', 'Garcia', 'Jack');
INSERT INTO Clients VALUES ('111000000000011', 'Thomas', 'Karen');
INSERT INTO Clients VALUES ('121000000000012', 'White', 'Liam');
INSERT INTO Clients VALUES ('131000000000013', 'Harris', 'Olivia');
INSERT INTO Clients VALUES ('141000000000014', 'Moore', 'Nathan');
INSERT INTO Clients VALUES ('151000000000015', 'Clark', 'Sophia');
INSERT INTO Clients VALUES ('161000000000016', 'Allen', 'Taylor');
INSERT INTO Clients VALUES ('171000000000017', 'Lewis', 'Victoria');
INSERT INTO Clients VALUES ('181000000000018', 'Walker', 'William');
INSERT INTO Clients VALUES ('191000000000019', 'Hall', 'Zoe');
INSERT INTO Clients VALUES ('201000000000020', 'Young', 'Andrew');
INSERT INTO Clients VALUES ('211000000000021', 'Lopez', 'Bella');
INSERT INTO Clients VALUES ('221000000000022', 'Adams', 'Christopher');
INSERT INTO Clients VALUES ('231000000000023', 'Cook', 'Daisy');
INSERT INTO Clients VALUES ('241000000000024', 'Evans', 'Ella');
INSERT INTO Clients VALUES ('251000000000025', 'Green', 'Gabriel');
INSERT INTO Clients VALUES ('261000000000026', 'King', 'Hailey');
INSERT INTO Clients VALUES ('271000000000027', 'Morgan', 'Ian');
INSERT INTO Clients VALUES ('281000000000028', 'Scott', 'Jasmine');
INSERT INTO Clients VALUES ('291000000000029', 'Baker', 'Kevin');


-- INSERT BOULANGERIE 
INSERT INTO Boulangerie VALUES ('11111111111111', 'Le Pain Doré', '123 Rue de la Boulangerie', 'Ville1', '07:00', '18:00', '10000000000001');
INSERT INTO Boulangerie VALUES ('22222222222222', 'Au Levain Magique', '456 Avenue du Croissant', 'Ville2', '06:30', '17:30', '20000000000002');
INSERT INTO Boulangerie VALUES ('33333333333333', 'La Baguette Gourmande', '789 Boulevard de la Baguette', 'Ville3', '06:00', '18:30', '30000000000003');
INSERT INTO Boulangerie VALUES ('44444444444444', 'Les Délices du Four', '101 Rue des Pains', 'Ville4', '08:00', '19:00', '40000000000004');
INSERT INTO Boulangerie VALUES ('55555555555555', 'Croissants et Compagnie', '202 Avenue des Croissants', 'Ville5', '07:30', '18:30', '50000000000005');
INSERT INTO Boulangerie VALUES ('66666666666666', 'La Fournée Croustillante', '303 Boulevard de la Fournée', 'Ville6', '06:30', '18:00', '60000000000006');
INSERT INTO Boulangerie VALUES ('77777777777777', 'Pains et Délices', '404 Rue des Délices', 'Ville7', '07:00', '19:00', '70000000000007');
INSERT INTO Boulangerie VALUES ('88888888888888', 'Le Petit Pain', '505 Avenue du Petit Pain', 'Ville8', '06:00', '17:30', '80000000000008');
INSERT INTO Boulangerie VALUES ('99999999999999', 'La Mie Dorée', '606 Boulevard de la Mie', 'Ville9', '07:30', '18:30', '90000000000009');
INSERT INTO Boulangerie VALUES ('10101010101010', 'Les Pains du Coin', '707 Rue du Coin', 'Ville10', '08:00', '19:00', '10100000000010');
INSERT INTO Boulangerie VALUES ('12121212121212', 'La Boulangerie Gourmande', '808 Avenue Gourmande', 'Ville11', '06:30', '18:00', '11100000000011');
INSERT INTO Boulangerie VALUES ('13131313131313', 'Au Pain Frais', '909 Boulevard du Pain', 'Ville12', '07:00', '18:30', '12100000000012');
INSERT INTO Boulangerie VALUES ('14141414141414', 'Le Pain Chaud', '111 Rue Chaud', 'Ville13', '06:00', '19:00', '13100000000013');
INSERT INTO Boulangerie VALUES ('15151515151515', 'Les Saveurs du Four', '121 Avenue des Saveurs', 'Ville14', '07:30', '18:30', '14100000000014');
INSERT INTO Boulangerie VALUES ('16161616161616', 'La Baguette Royale', '131 Boulevard Royal', 'Ville15', '08:00', '19:00', '15100000000015');
INSERT INTO Boulangerie VALUES ('17171717171717', 'Le Pain Croustillant', '141 Rue Croustillant', 'Ville16', '06:30', '18:00', '16100000000016');
INSERT INTO Boulangerie VALUES ('18181818181818', 'Croissants Gourmets', '151 Avenue Gourmets', 'Ville17', '07:00', '19:00', '17100000000017');
INSERT INTO Boulangerie VALUES ('19191919191919', 'Délices du Matin', '161 Boulevard du Matin', 'Ville18', '06:00', '17:30', '18100000000018');
INSERT INTO Boulangerie VALUES ('20202020202020', 'Pains Chauds et Dorés', '171 Rue Dorée', 'Ville19', '07:30', '18:30', '19100000000019');
INSERT INTO Boulangerie VALUES ('21212121212121', 'Le Four Créatif', '181 Avenue Créatif', 'Ville20', '08:00', '19:00', '20100000000020');
INSERT INTO Boulangerie VALUES ('22222222222220', 'La Mie Gourmande', '191 Boulevard Gourmande', 'Ville21', '06:30', '18:00', '21100000000021');
INSERT INTO Boulangerie VALUES ('23232323232323', 'Au Pain Chaud', '202 Rue Chaud', 'Ville22', '07:00', '18:30', '22100000000022');
INSERT INTO Boulangerie VALUES ('24242424242424', 'Délices et Saveurs', '212 Avenue Saveurs', 'Ville23', '06:00', '19:00', '23100000000023');
INSERT INTO Boulangerie VALUES ('25252525252525', 'La Baguette Croustillante', '222 Boulevard Croustillante', 'Ville24', '07:30', '18:30', '24100000000024');
INSERT INTO Boulangerie VALUES ('26262626262626', 'Pain Doré et Chaud', '232 Rue Dorée', 'Ville25', '08:00', '19:00', '25100000000025');
INSERT INTO Boulangerie VALUES ('27272727272727', 'Au Levain Gourmand', '242 Avenue Gourmand', 'Ville26', '06:30', '18:00', '26100000000026');
INSERT INTO Boulangerie VALUES ('28282828282828', 'Les Pains du Matin', '252 Boulevard du Matin', 'Ville27', '07:00', '19:00', '27100000000027');
INSERT INTO Boulangerie VALUES ('29292929292929', 'La Fournée Délicieuse', '262 Rue Délicieuse', 'Ville28', '06:00', '17:30', '28100000000028');
INSERT INTO Boulangerie VALUES ('30303030303030', 'Croissants Magiques', '272 Avenue Magique', 'Ville29', '07:30', '18:30', '29100000000029');


-- INSERT EQUIPE 
INSERT INTO Equipe VALUES (1, 'Matin', '11111111111111');
INSERT INTO Equipe VALUES (2, 'Après-midi', '22222222222222');
INSERT INTO Equipe VALUES (3, 'Soir', '33333333333333');
INSERT INTO Equipe VALUES (4, 'Nuit', '44444444444444');
INSERT INTO Equipe VALUES (5, 'Weekend Matin', '55555555555555');
INSERT INTO Equipe VALUES (6, 'Weekend Après-midi', '66666666666666');
INSERT INTO Equipe VALUES (7, 'Weekend Soir', '77777777777777');
INSERT INTO Equipe VALUES (8, 'Weekend Nuit', '88888888888888');
INSERT INTO Equipe VALUES (9, 'Jour', '99999999999999');
INSERT INTO Equipe VALUES (10, 'Nuit Tardive', '10101010101010');
INSERT INTO Equipe VALUES (11, 'Matin Tôt', '12121212121212');
INSERT INTO Equipe VALUES (12, 'Après-midi Tardif', '13131313131313');
INSERT INTO Equipe VALUES (13, 'Soir Tardif', '14141414141414');
INSERT INTO Equipe VALUES (14, 'Nuit Tôt', '15151515151515');
INSERT INTO Equipe VALUES (15, 'Weekend Matin Tôt', '16161616161616');
INSERT INTO Equipe VALUES (16, 'Weekend Après-midi Tardif', '17171717171717');
INSERT INTO Equipe VALUES (17, 'Weekend Soir Tardif', '18181818181818');
INSERT INTO Equipe VALUES (18, 'Weekend Nuit Tôt', '19191919191919');
INSERT INTO Equipe VALUES (19, 'Jour Tardif', '20202020202020');
INSERT INTO Equipe VALUES (20, 'Nuit Matin', '21212121212121');
INSERT INTO Equipe VALUES (21, 'Matin Weekend', '22222222222222');
INSERT INTO Equipe VALUES (22, 'Après-midi Weekend', '23232323232323');
INSERT INTO Equipe VALUES (23, 'Soir Weekend', '24242424242424');
INSERT INTO Equipe VALUES (24, 'Nuit Weekend', '25252525252525');
INSERT INTO Equipe VALUES (25, 'Weekend', '26262626262626');
INSERT INTO Equipe VALUES (26, 'Weekend Tardif', '27272727272727');
INSERT INTO Equipe VALUES (27, 'Jour Weekend', '28282828282828');
INSERT INTO Equipe VALUES (28, 'Nuit Weekend Tôt', '29292929292929');
INSERT INTO Equipe VALUES (29, 'Matin Tardif Weekend', '30303030303030');


-- INSERT EMPLOYE 
INSERT INTO Employe VALUES ('10000000000001', 'Anderson', 'Michael', TO_DATE('1992-03-18', 'YYYY-MM-DD'), 'M', '11111111111111', 53000.00, TO_DATE('2022-08-25', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Che');
INSERT INTO Employe VALUES ('20000000000002', 'Davis', 'Olivia', TO_DATE('1994-07-10', 'YYYY-MM-DD'), 'F', '22222222222222', 56000.00, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('30000000000003', 'Clark', 'Christopher', TO_DATE('1987-12-03', 'YYYY-MM-DD'), 'M', '11111111111111', 51000.00, TO_DATE('2021-12-01', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('40000000000004', 'Taylor', 'Sophia', TO_DATE('1996-09-27', 'YYYY-MM-DD'), 'F', '22222222222222', 54000.00, TO_DATE('2022-05-15', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('50000000000005', 'Moore', 'Ethan', TO_DATE('1990-04-14', 'YYYY-MM-DD'), 'M', '11111111111111', 59000.00, TO_DATE('2023-03-20', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('60000000000006', 'White', 'Isabella', TO_DATE('1993-11-08', 'YYYY-MM-DD'), 'F', '22222222222222', 50000.00, TO_DATE('2021-10-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('70000000000007', 'Hall', 'Daniel', TO_DATE('1988-06-21', 'YYYY-MM-DD'), 'M', '11111111111111', 55000.00, TO_DATE('2022-07-12', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('80000000000008', 'Chef', 'Amelia', TO_DATE('1995-02-04', 'YYYY-MM-DD'), 'F', '22222222222222', 52000.00, TO_DATE('2023-04-18', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('90000000000009', 'Fisher', 'Logan', TO_DATE('1991-09-15', 'YYYY-MM-DD'), 'M', '11111111111111', 48000.00, TO_DATE('2021-11-30', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('10100000000010', 'Barnes', 'Mia', TO_DATE('1989-05-28', 'YYYY-MM-DD'), 'F', '22222222222222', 58000.00, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('11100000000011', 'Reed', 'William', TO_DATE('1997-10-11', 'YYYY-MM-DD'), 'M', '11111111111111', 53000.00, TO_DATE('2022-09-10', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('12100000000012', 'Cole', 'Ava', TO_DATE('1994-03-24', 'YYYY-MM-DD'), 'F', '22222222222222', 56000.00, TO_DATE('2023-01-25', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('13100000000013', 'Hill', 'Jackson', TO_DATE('1986-08-07', 'YYYY-MM-DD'), 'M', '11111111111111', 51000.00, TO_DATE('2021-12-20', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('14100000000014', 'Cooper', 'Grace', TO_DATE('1993-01-30', 'YYYY-MM-DD'), 'F', '22222222222222', 54000.00, TO_DATE('2022-06-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('15100000000015', 'Stewart', 'Ella', TO_DATE('1998-05-18', 'YYYY-MM-DD'), 'F', '11111111111111', 48000.00, TO_DATE('2021-08-15', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('16100000000016', 'Lee', 'Matthew', TO_DATE('1992-10-03', 'YYYY-MM-DD'), 'M', '22222222222222', 52000.00, TO_DATE('2022-11-20', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('17100000000017', 'Foster', 'Aria', TO_DATE('1987-04-26', 'YYYY-MM-DD'), 'F', '33333333333333', 56000.00, TO_DATE('2023-01-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('18100000000018', 'Gray', 'Oliver', TO_DATE('1995-09-09', 'YYYY-MM-DD'), 'M', '44444444444444', 50000.00, TO_DATE('2021-10-10', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('19100000000019', 'Bryant', 'Lily', TO_DATE('1989-02-22', 'YYYY-MM-DD'), 'F', '55555555555555', 53000.00, TO_DATE('2022-05-25', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('20100000000020', 'Murray', 'Elijah', TO_DATE('1994-07-17', 'YYYY-MM-DD'), 'M', '66666666666666', 59000.00, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('21100000000021', 'Fleming', 'Scarlett', TO_DATE('1991-12-30', 'YYYY-MM-DD'), 'F', '77777777777777', 55000.00, TO_DATE('2022-08-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('22100000000022', 'Graham', 'Lucas', TO_DATE('1986-06-13', 'YYYY-MM-DD'), 'M', '88888888888888', 51000.00, TO_DATE('2021-12-15', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('23100000000023', 'Palmer', 'Chloe', TO_DATE('1993-11-06', 'YYYY-MM-DD'), 'F', '99999999999999', 58000.00, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('24100000000024', 'Gardner', 'James', TO_DATE('1997-04-21', 'YYYY-MM-DD'), 'M', '10101010101010', 54000.00, TO_DATE('2022-07-18', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('25100000000025', 'Riley', 'Nora', TO_DATE('1988-09-04', 'YYYY-MM-DD'), 'F', '11111111111111', 56000.00, TO_DATE('2021-09-20', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('26100000000026', 'Woods', 'Mason', TO_DATE('1995-02-17', 'YYYY-MM-DD'), 'M', '12121212121212', 51000.00, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('27100000000027', 'Porter', 'Zoe', TO_DATE('1990-07-02', 'YYYY-MM-DD'), 'F', '13131313131313', 59000.00, TO_DATE('2022-10-25', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('28100000000028', 'Hudson', 'Gabriel', TO_DATE('1998-12-15', 'YYYY-MM-DD'), 'M', '14141414141414', 48000.00, TO_DATE('2021-11-30', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Chef');
INSERT INTO Employe VALUES ('29100000000029', 'Perry', 'Hannah', TO_DATE('1992-05-28', 'YYYY-MM-DD'), 'F', '15151515151515', 55000.00, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('30100000000030', 'Watson', 'James', TO_DATE('1988-10-23', 'YYYY-MM-DD'), 'M', '16161616161616', 52000.00, TO_DATE('2022-04-19', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Baker');
INSERT INTO Employe VALUES ('31100000000031', 'Broussard', 'Robert', TO_DATE('1993-11-21', 'YYYY-MM-DD'), 'M', '16161616161616', 51000.00, TO_DATE('2021-10-25', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Cashier');
INSERT INTO Employe VALUES ('32100000000032', 'Smith', 'Mary', TO_DATE('1991-09-09', 'YYYY-MM-DD'), 'F', '17171717171717', 53000.00, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Baker');
INSERT INTO Employe VALUES ('33100000000033', 'Perry', 'Michael', TO_DATE('1995-07-13', 'YYYY-MM-DD'), 'M', '18181818181818', 53000.00, TO_DATE('2022-03-12', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('34100000000034', 'Williams', 'Jennifer', TO_DATE('2000-05-30', 'YYYY-MM-DD'), 'F', '19191919191919', 53000.00, TO_DATE('2021-06-24', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('35100000000035', 'Brown', 'David', TO_DATE('1987-02-26', 'YYYY-MM-DD'), 'M', '20202020202020', 49000.00, TO_DATE('2023-08-29', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('36100000000036', 'Jones', 'Elizabeth', TO_DATE('1994-01-28', 'YYYY-MM-DD'), 'F', '21212121212121', 50000.00, TO_DATE('2022-07-02', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('37100000000037', 'Miller', 'William', TO_DATE('1997-04-13', 'YYYY-MM-DD'), 'M', '22222222222222', 51000.00, TO_DATE('2022-11-08', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('38100000000038', 'Davis', 'Joseph', TO_DATE('1991-09-23', 'YYYY-MM-DD'), 'M', '23232323232323', 48000.00, TO_DATE('2021-09-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Baker');
INSERT INTO Employe VALUES ('39100000000039', 'Dumont', 'Jessica', TO_DATE('1992-07-24', 'YYYY-MM-DD'), 'F', '24242424242424', 49000.00, TO_DATE('2023-02-17', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('40100000000040', 'Wilson', 'Sarah', TO_DATE('1992-07-09', 'YYYY-MM-DD'), 'F', '25252525252525', 50000.00, TO_DATE('2022-07-15', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('41100000000041', 'Wilde', 'Lisa', TO_DATE('1996-06-02', 'YYYY-MM-DD'), 'F', '25252525252525', 51000.00, TO_DATE('2022-09-22', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Cashier');
INSERT INTO Employe VALUES ('42100000000042', 'Grey', 'Chris', TO_DATE('1998-03-22', 'YYYY-MM-DD'), 'M', '18181818181818', 53000.00, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Assistant');
INSERT INTO Employe VALUES ('43100000000043', 'King', 'Chris', TO_DATE('1995-09-28', 'YYYY-MM-DD'), 'M', '19191919191919', 52000.00, TO_DATE('2022-09-18', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('44100000000044', 'Foley', 'Sandra', TO_DATE('1989-09-13', 'YYYY-MM-DD'), 'F', '26262626262626', 51000.00, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Assistant');
INSERT INTO Employe VALUES ('45100000000045', 'Thomas', 'Steven', TO_DATE('1998-06-14', 'YYYY-MM-DD'), 'M', '27272727272727', 55000.00, TO_DATE('2022-08-23', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('46100000000046', 'Moore', 'Emily', TO_DATE('1999-08-13', 'YYYY-MM-DD'), 'F', '28282828282828', 48000.00, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Cashier');
INSERT INTO Employe VALUES ('47100000000047', 'Martin', 'Paul', TO_DATE('1993-04-12', 'YYYY-MM-DD'), 'M', '29292929292929', 48000.00, TO_DATE('2022-11-13', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Assistant');
INSERT INTO Employe VALUES ('48100000000048', 'Thompson', 'Kenneth', TO_DATE('1987-05-14', 'YYYY-MM-DD'), 'M', '30303030303030', 51000.00, TO_DATE('2023-09-23', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('49100000000049', 'Harris', 'Joshua', TO_DATE('1992-09-17', 'YYYY-MM-DD'), 'M', '30303030303030', 49000.00, TO_DATE('2023-07-27', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('50100000000050', 'Walker', 'Amanda', TO_DATE('1993-12-25', 'YYYY-MM-DD'), 'F', '29292929292929', 52000.00, TO_DATE('2021-12-03', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('51100000000051', 'Allen', 'Rebecca', TO_DATE('1997-11-23', 'YYYY-MM-DD'), 'F', '28282828282828', 53000.00, TO_DATE('2022-05-14', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Assistant');
INSERT INTO Employe VALUES ('52100000000052', 'Wright', 'Samuel', TO_DATE('1996-11-03', 'YYYY-MM-DD'), 'M', '27272727272727', 54000.00, TO_DATE('2022-08-19', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Cashier');
INSERT INTO Employe VALUES ('53100000000053', 'Scott', 'Ryan', TO_DATE('1995-08-18', 'YYYY-MM-DD'), 'M', '26262626262626', 49000.00, TO_DATE('2023-01-09', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Baker');
INSERT INTO Employe VALUES ('54100000000054', 'Hill', 'Nick', TO_DATE('1991-10-31', 'YYYY-MM-DD'), 'M', '25252525252525', 50000.00, TO_DATE('2022-06-17', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Cashier');
INSERT INTO Employe VALUES ('55100000000055', 'Hills', 'Angela', TO_DATE('1994-09-23', 'YYYY-MM-DD'), 'F', '24242424242424', 51000.00, TO_DATE('2023-10-14', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Assistant');
INSERT INTO Employe VALUES ('56100000000056', 'Hillman', 'Alexander', TO_DATE('1997-08-18', 'YYYY-MM-DD'), 'M', '23232323232323', 48000.00, TO_DATE('2022-11-18', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('57100000000057', 'Green', 'Helen', TO_DATE('1996-02-28', 'YYYY-MM-DD'), 'F', '22222222222222', 49000.00, TO_DATE('2023-11-30', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('58100000000058', 'Addams', 'Tyler', TO_DATE('1992-10-21', 'YYYY-MM-DD'), 'M', '15151515151515', 48000.00, TO_DATE('2021-03-31', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('59100000000059', 'Campbell', 'Hannah', TO_DATE('1993-11-17', 'YYYY-MM-DD'), 'F', '15151515151515', 51000.00, TO_DATE('2022-08-12', 'YYYY-MM-DD'), 1, 'Tue-Sat', 'Baker');
INSERT INTO Employe VALUES ('60100000000060', 'Roberts', 'Kyle', TO_DATE('1990-09-30', 'YYYY-MM-DD'), 'M', '15151515151515', 53000.00, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 2, 'Mon-Fri', 'Assistant');

-- INSERT VENTE 
INSERT INTO Vente VALUES (101, TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2022-01-15', 'YYYY-MM-DD'), '11111111111111', '10000000000001', '100000000000001', 150.00);
INSERT INTO Vente VALUES (102, TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2022-02-20', 'YYYY-MM-DD'), '22222222222222', '20000000000002', '200000000000002', 120.50);
INSERT INTO Vente VALUES (103, TO_DATE('2022-03-10', 'YYYY-MM-DD'), TO_DATE('2022-03-10', 'YYYY-MM-DD'), '33333333333333', '30000000000003', '300000000000003', 200.75);
INSERT INTO Vente VALUES (104, TO_DATE('2022-04-05', 'YYYY-MM-DD'), TO_DATE('2022-04-05', 'YYYY-MM-DD'), '44444444444444', '40000000000004', '400000000000004', 175.25);
INSERT INTO Vente VALUES (105, TO_DATE('2022-05-12', 'YYYY-MM-DD'), TO_DATE('2022-05-12', 'YYYY-MM-DD'), '55555555555555', '50000000000005', '500000000000005', 130.99);
INSERT INTO Vente VALUES (106, TO_DATE('2022-06-18', 'YYYY-MM-DD'), TO_DATE('2022-06-18', 'YYYY-MM-DD'), '66666666666666', '60000000000006', '600000000000006', 180.50);
INSERT INTO Vente VALUES (107, TO_DATE('2022-07-23', 'YYYY-MM-DD'), TO_DATE('2022-07-23', 'YYYY-MM-DD'), '77777777777777', '70000000000007', '700000000000007', 210.25);
INSERT INTO Vente VALUES (108, TO_DATE('2022-08-30', 'YYYY-MM-DD'), TO_DATE('2022-08-30', 'YYYY-MM-DD'), '88888888888888', '80000000000008', '800000000000008', 95.99);
INSERT INTO Vente VALUES (109, TO_DATE('2022-09-05', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), '99999999999999', '90000000000009', '900000000000009', 240.75);
INSERT INTO Vente VALUES (110, TO_DATE('2022-10-10', 'YYYY-MM-DD'), TO_DATE('2022-10-10', 'YYYY-MM-DD'), '10101010101010', '10100000000010', '101000000000010', 155.00);
INSERT INTO Vente VALUES (111, TO_DATE('2022-11-15', 'YYYY-MM-DD'), TO_DATE('2022-11-15', 'YYYY-MM-DD'), '12121212121212', '11100000000011', '111000000000011', 128.50);
INSERT INTO Vente VALUES (112, TO_DATE('2022-12-20', 'YYYY-MM-DD'), TO_DATE('2022-12-20', 'YYYY-MM-DD'), '13131313131313', '12100000000012', '121000000000012', 190.75);
INSERT INTO Vente VALUES (113, TO_DATE('2023-01-25', 'YYYY-MM-DD'), TO_DATE('2023-01-25', 'YYYY-MM-DD'), '14141414141414', '13100000000013', '131000000000013', 165.25);
INSERT INTO Vente VALUES (114, TO_DATE('2023-02-28', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), '15151515151515', '14100000000014', '141000000000014', 120.99);
INSERT INTO Vente VALUES (115, TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2023-03-10', 'YYYY-MM-DD'), '16161616161616', '15100000000015', '151000000000015', 170.50);
INSERT INTO Vente VALUES (116, TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-15', 'YYYY-MM-DD'), '17171717171717', '16100000000016', '161000000000016', 200.25);
INSERT INTO Vente VALUES (117, TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), '18181818181818', '17100000000017', '171000000000017', 145.99);
INSERT INTO Vente VALUES (118, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), '19191919191919', '18100000000018', '181000000000018', 220.75);
INSERT INTO Vente VALUES (119, TO_DATE('2023-07-30', 'YYYY-MM-DD'), TO_DATE('2023-07-30', 'YYYY-MM-DD'), '20202020202020', '19100000000019', '191000000000019', 135.00);
INSERT INTO Vente VALUES (120, TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), '21212121212121', '20100000000020', '201000000000020', 108.50);
INSERT INTO Vente VALUES (121, TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'), '22222222222220', '21100000000021', '211000000000021', 160.75);
INSERT INTO Vente VALUES (122, TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), '23232323232323', '22100000000022', '221000000000022', 135.25);
INSERT INTO Vente VALUES (123, TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), '24242424242424', '23100000000023', '231000000000023', 90.99);
INSERT INTO Vente VALUES (124, TO_DATE('2023-12-25', 'YYYY-MM-DD'), TO_DATE('2023-12-25', 'YYYY-MM-DD'), '25252525252525', '24100000000024', '241000000000024', 140.50);
INSERT INTO Vente VALUES (125, TO_DATE('2024-01-30', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), '26262626262626', '25100000000025', '251000000000025', 170.25);
INSERT INTO Vente VALUES (126, TO_DATE('2024-02-05', 'YYYY-MM-DD'), TO_DATE('2024-02-05', 'YYYY-MM-DD'), '27272727272727', '26100000000026', '261000000000026', 115.99);
INSERT INTO Vente VALUES (127, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), '28282828282828', '27100000000027', '271000000000027', 190.75);
INSERT INTO Vente VALUES (128, TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), '29292929292929', '28100000000028', '281000000000028', 215.00);
INSERT INTO Vente VALUES (129, TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), '30303030303030', '29100000000029', '291000000000029', 178.50);



--INSERT PRODUIT 
INSERT INTO Produit VALUES ('P001', 12.99, TO_DATE('2022-01-15', 'YYYY-MM-DD'), '10000000000001');
INSERT INTO Produit VALUES ('P002', 8.50, TO_DATE('2022-02-20', 'YYYY-MM-DD'), '20000000000002');
INSERT INTO Produit VALUES ('P003', 19.99, TO_DATE('2022-03-10', 'YYYY-MM-DD'), '30000000000003');
INSERT INTO Produit VALUES ('P004', 15.75, TO_DATE('2022-04-05', 'YYYY-MM-DD'), '40000000000004');
INSERT INTO Produit VALUES ('P005', 10.99, TO_DATE('2022-05-12', 'YYYY-MM-DD'), '50000000000005');
INSERT INTO Produit VALUES ('P006', 25.50, TO_DATE('2022-06-18', 'YYYY-MM-DD'), '60000000000006');
INSERT INTO Produit VALUES ('P007', 14.25, TO_DATE('2022-07-23', 'YYYY-MM-DD'), '70000000000007');
INSERT INTO Produit VALUES ('P008', 9.99, TO_DATE('2022-08-30', 'YYYY-MM-DD'), '80000000000008');
INSERT INTO Produit VALUES ('P009', 18.50, TO_DATE('2022-09-05', 'YYYY-MM-DD'), '90000000000009');
INSERT INTO Produit VALUES ('P010', 22.00, TO_DATE('2022-10-10', 'YYYY-MM-DD'), '10100000000010');
INSERT INTO Produit VALUES ('P011', 7.75, TO_DATE('2022-11-15', 'YYYY-MM-DD'), '11100000000011');
INSERT INTO Produit VALUES ('P012', 16.99, TO_DATE('2022-12-20', 'YYYY-MM-DD'), '12100000000012');
INSERT INTO Produit VALUES ('P013', 11.50, TO_DATE('2023-01-25', 'YYYY-MM-DD'), '13100000000013');
INSERT INTO Produit VALUES ('P014', 28.00, TO_DATE('2023-02-28', 'YYYY-MM-DD'), '14100000000014');
INSERT INTO Produit VALUES ('P015', 13.25, TO_DATE('2023-03-10', 'YYYY-MM-DD'), '15100000000015');
INSERT INTO Produit VALUES ('P016', 17.99, TO_DATE('2023-04-15', 'YYYY-MM-DD'), '16100000000016');
INSERT INTO Produit VALUES ('P017', 9.50, TO_DATE('2023-05-20', 'YYYY-MM-DD'), '17100000000017');
INSERT INTO Produit VALUES ('P018', 23.75, TO_DATE('2023-06-25', 'YYYY-MM-DD'), '18100000000018');
INSERT INTO Produit VALUES ('P019', 14.99, TO_DATE('2023-07-30', 'YYYY-MM-DD'), '19100000000019');
INSERT INTO Produit VALUES ('P020', 11.25, TO_DATE('2023-08-05', 'YYYY-MM-DD'), '20100000000020');
INSERT INTO Produit VALUES ('P021', 20.50, TO_DATE('2023-09-10', 'YYYY-MM-DD'), '21100000000021');
INSERT INTO Produit VALUES ('P022', 25.99, TO_DATE('2023-10-15', 'YYYY-MM-DD'), '22100000000022');
INSERT INTO Produit VALUES ('P023', 8.75, TO_DATE('2023-11-20', 'YYYY-MM-DD'), '23100000000023');
INSERT INTO Produit VALUES ('P024', 12.50, TO_DATE('2023-12-25', 'YYYY-MM-DD'), '24100000000024');
INSERT INTO Produit VALUES ('P025', 19.99, TO_DATE('2024-01-30', 'YYYY-MM-DD'), '25100000000025');
INSERT INTO Produit VALUES ('P026', 14.25, TO_DATE('2024-02-05', 'YYYY-MM-DD'), '26100000000026');
INSERT INTO Produit VALUES ('P027', 9.50, TO_DATE('2024-03-10', 'YYYY-MM-DD'), '27100000000027');
INSERT INTO Produit VALUES ('P028', 16.75, TO_DATE('2024-04-15', 'YYYY-MM-DD'), '28100000000028');
INSERT INTO Produit VALUES ('P029', 22.00, TO_DATE('2024-05-20', 'YYYY-MM-DD'), '29100000000029');

-- INSERT Pain
INSERT INTO Pain VALUES ('P001', 'baguette tradition', 20);
INSERT INTO Pain VALUES ('P002', 'pain de campagne', 20);
INSERT INTO Pain VALUES ('P003', 'pain nordique', 20);
INSERT INTO Pain VALUES ('P004', 'baguette tradition', 20);
INSERT INTO Pain VALUES ('P005', 'baguette', 20);
INSERT INTO Pain VALUES ('P006', 'baguette aux graines', 20);
INSERT INTO Pain VALUES ('P007', 'pain complet', 20);
INSERT INTO Pain VALUES ('P008', 'pain de mie', 20);
INSERT INTO Pain VALUES ('P009', 'pain brioche', 20);
INSERT INTO Pain VALUES ('P010', 'baguette epi', 20);
INSERT INTO Pain VALUES ('P011', 'pain de seigle', 20);
INSERT INTO Pain VALUES ('P012', 'pain marguerite', 20);
INSERT INTO Pain VALUES ('P012', 'pain aux graines', 20);
INSERT INTO Pain VALUES ('P013', 'pain abricot-noisette', 20);
INSERT INTO Pain VALUES ('P014', 'baguette viennoise', 20);

-- INSERT Patisserie
INSERT INTO Patisserie VALUES ('P015', 'éclair au chocolat', 2);
INSERT INTO Patisserie VALUES ('P016', 'pain au chocolat', 20);
INSERT INTO Patisserie VALUES ('P017', 'croissant', 20);
INSERT INTO Patisserie VALUES ('P018', 'pain au raisin', 20);
INSERT INTO Patisserie VALUES ('P019', 'éclair au café', 2);
INSERT INTO Patisserie VALUES ('P020', 'fraisier', 4);
INSERT INTO Patisserie VALUES ('P021', 'paris-brest', 4);
INSERT INTO Patisserie VALUES ('P022', 'mille-feuille', 4);
INSERT INTO Patisserie VALUES ('P023', 'gland', 2);
INSERT INTO Patisserie VALUES ('P024', 'chouquettes', 20);
INSERT INTO Patisserie VALUES ('P025', 'tarte au fraises', 2);
INSERT INTO Patisserie VALUES ('P026', 'tarte au citron meringuée', 2);
INSERT INTO Patisserie VALUES ('P027', 'meringue', 20);
INSERT INTO Patisserie VALUES ('P028', 'religieuse café', 2);
INSERT INTO Patisserie VALUES ('P029', 'religieuse chocolat', 2);



-- INSERT Ligne_Vente
INSERT INTO ligne_vente VALUES (1, 101, 'P001', 50.00, 2);
INSERT INTO ligne_vente VALUES (2, 102, 'P002', 45.00, 1);
INSERT INTO ligne_vente VALUES (3, 103, 'P003', 30.00, 3);
INSERT INTO ligne_vente VALUES (4, 104, 'P004', 25.00, 1);
INSERT INTO ligne_vente VALUES (5, 105, 'P005', 20.00, 2);
INSERT INTO ligne_vente VALUES (6, 106, 'P006', 15.00, 1);
INSERT INTO ligne_vente VALUES (7, 107, 'P007', 40.00, 3);
INSERT INTO ligne_vente VALUES (8, 108, 'P008', 35.00, 1);
INSERT INTO ligne_vente VALUES (9, 109, 'P009', 60.00, 2);
INSERT INTO ligne_vente VALUES (10, 110, 'P010', 55.00, 1);
INSERT INTO ligne_vente VALUES (11, 111, 'P011', 70.00, 3);
INSERT INTO ligne_vente VALUES (12, 112, 'P012', 65.00, 1);
INSERT INTO ligne_vente VALUES (13, 113, 'P013', 80.00, 2);
INSERT INTO ligne_vente VALUES (14, 114, 'P014', 75.00, 1);
INSERT INTO ligne_vente VALUES (15, 115, 'P015', 90.00, 3);
INSERT INTO ligne_vente VALUES (16, 116, 'P016', 85.00, 1);
INSERT INTO ligne_vente VALUES (17, 117, 'P017', 100.00, 2);
INSERT INTO ligne_vente VALUES (18, 118, 'P018', 95.00, 1);
INSERT INTO ligne_vente VALUES (19, 119, 'P019', 110.00, 3);
INSERT INTO ligne_vente VALUES (20, 120, 'P020', 105.00, 1);
INSERT INTO ligne_vente VALUES (21, 121, 'P021', 120.00, 2);
INSERT INTO ligne_vente VALUES (22, 122, 'P022', 115.00, 1);
INSERT INTO ligne_vente VALUES (23, 123, 'P023', 130.00, 3);
INSERT INTO ligne_vente VALUES (24, 124, 'P024', 125.00, 1);
INSERT INTO ligne_vente VALUES (25, 125, 'P025', 140.00, 2);
INSERT INTO ligne_vente VALUES (26, 126, 'P026', 135.00, 1);
INSERT INTO ligne_vente VALUES (27, 127, 'P027', 150.00, 3);
INSERT INTO ligne_vente VALUES (28, 128, 'P028', 145.00, 1);
INSERT INTO ligne_vente VALUES (29, 129, 'P029', 160.00, 2);
INSERT INTO ligne_vente VALUES (30, 129, 'P029', 155.00, 1);


-- TRIGGER HERITAGE PAIN
CREATE OR REPLACE TRIGGER heritage_pain
BEFORE INSERT OR UPDATE ON pain
FOR EACH ROW
DECLARE  
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Patisserie
    WHERE reference_produit = :NEW.reference_produit;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le produit est déjà une pâtisserie');
    END IF;
END;
/

-- TRIGGER HERITAGE PATISSERIE
CREATE OR REPLACE TRIGGER heritage_patisserie
BEFORE INSERT OR UPDATE ON patisserie 
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO v_count 
    FROM Pain 
    WHERE Pain.reference_produit = :NEW.reference_produit;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le produit est déjà un pain');

    END IF;
END;
/


-- TRIGGER NSS VENDEUR EXISTE DANS NSS EMPLOYE
CREATE OR REPLACE TRIGGER check_vente_employe
BEFORE INSERT OR UPDATE ON Vente
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Employe
    WHERE nss = :NEW.nss_vendeur;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Le NSS du vendeur n''existe pas dans la table Employe');
    END IF;
END;
/


-- TRIGGER SIRET DE LA BOULANGERIE CORRESPOND AU SIRET DANS EMPLOYE
CREATE OR REPLACE TRIGGER check_boulangerie_employe
BEFORE INSERT OR UPDATE ON Employe
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    IF :NEW.siret_magasin IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM Boulangerie
        WHERE numero_siret = :NEW.siret_magasin;

        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'Le SIRET de la boulangerie spécifié dans l''employé n''existe pas.');
        END IF;
    END IF;
END;
/

-- TRIGGER RESTRICTION AGE DES EMPLOYE
CREATE OR REPLACE TRIGGER verif_age_employe
BEFORE INSERT OR UPDATE ON Employe
FOR EACH ROW
DECLARE
    v_age_minimum NUMBER := 18; 
BEGIN
    IF MONTHS_BETWEEN(SYSDATE, :NEW.date_naissance) < v_age_minimum * 12 THEN
        RAISE_APPLICATION_ERROR(-20006, 'L''employé doit être âgé d''au moins 18 ans.');
    END IF;
END;
/

-- TRIGGER MAJ DU MONTANT TOTAL DE VENTE DANS LA TABLE VENTE
CREATE OR REPLACE TRIGGER maj_montant_total_vente
BEFORE INSERT OR UPDATE OF total_ligne ON Ligne_Vente
FOR EACH ROW
DECLARE
    v_montant_total NUMBER;
BEGIN
    SELECT SUM(total_ligne)
    INTO v_montant_total
    FROM Ligne_Vente
    WHERE numero_vente = :NEW.numero_vente;

    UPDATE Vente
    SET total = v_montant_total
    WHERE numero_vente = :NEW.numero_vente;
END;
/


-- TRIGGER VERIFIER L'ASSIGNATION A UNE EQUIPE A L'EMBAUCHE
CREATE OR REPLACE TRIGGER verif_assignation_equipe_embauche
BEFORE INSERT ON Employe
FOR EACH ROW
DECLARE
BEGIN
    IF :NEW.num_equipe IS NULL THEN
        RAISE_APPLICATION_ERROR(-20008, 'L''employé doit être assigné à une équipe lors de l''embauche.');
    END IF;
END;
/

-- VUE DES MEMBRES D'UNE ÉQUIPE D'UN MAGASIN
CREATE OR REPLACE VIEW membre_equipe as 
SELECT em.nss, em.nom, em.prenom,em.num_equipe
FROM Employe em
JOIN Equipe eq ON em.num_equipe = eq.numero_equipe
JOIN Boulangerie b ON eq.num_siret_magasin = b.numero_siret
ORDER BY em.numero_equipe;

-- VUE DES HORAIRES DU NOMBRE D'EMPLOYE PAR MAGASINS
CREATE OR REPLACE VIEW nombre_employes (numero_siret, nom_boulangerie, quantite_employe) AS
SELECT b.numero_siret, b.nom_boulangerie, COUNT(em.nss)
from Boulangerie b, employe em
JOIN employe em ON b.numero_siret = em.siret_magasin
ORDER BY b.numero_siret;
