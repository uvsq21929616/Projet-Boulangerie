-- Table Clients
CREATE TABLE Clients (
    numero_client VARCHAR2(15) CONSTRAINT pk_clients PRIMARY KEY,
    nom VARCHAR2(50),
    prenom VARCHAR2(50)
);

-- Table Boulangerie
CREATE TABLE Boulangerie (
    numero_siret VARCHAR2(14) CONSTRAINT pk_boulangerie PRIMARY KEY,
    nom_boulangerie VARCHAR2(50),
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
    reference_type_produit VARCHAR2(20),
    prix NUMBER(4, 2),
    date_fabrication DATE,
    nss_fabricant VARCHAR2(14)
);

-- Ajout de la contrainte après la création de la table Produit
ALTER TABLE Produit
ADD CONSTRAINT fk_fabricant
FOREIGN KEY (nss_fabricant)
REFERENCES Employe(nss);

-- Table Ligne_Vente
CREATE TABLE Ligne_Vente (
    numero_ligne_vente NUMBER CONSTRAINT pk_ligne PRIMARY KEY,
    numero_vente NUMBER,
    ref_produit VARCHAR(10),
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
REFERENCES Produit(ref_produit);


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
INSERT INTO Boulangerie VALUES ('11111111111111', 'Le Pain Doré', '123 Rue de la Boulangerie', 'Ville1', '07:00', '18:00', '1234567890123');
INSERT INTO Boulangerie VALUES ('22222222222222', 'Au Levain Magique', '456 Avenue du Croissant', 'Ville2', '06:30', '17:30', '2345678901234');
INSERT INTO Boulangerie VALUES ('33333333333333', 'La Baguette Gourmande', '789 Boulevard de la Baguette', 'Ville3', '06:00', '18:30', '3456789012345');
INSERT INTO Boulangerie VALUES ('44444444444444', 'Les Délices du Four', '101 Rue des Pains', 'Ville4', '08:00', '19:00', '4567890123456');
INSERT INTO Boulangerie VALUES ('55555555555555', 'Croissants et Compagnie', '202 Avenue des Croissants', 'Ville5', '07:30', '18:30', '5678901234567');
INSERT INTO Boulangerie VALUES ('66666666666666', 'La Fournée Croustillante', '303 Boulevard de la Fournée', 'Ville6', '06:30', '18:00', '6789012345678');
INSERT INTO Boulangerie VALUES ('77777777777777', 'Pains et Délices', '404 Rue des Délices', 'Ville7', '07:00', '19:00', '7890123456789');
INSERT INTO Boulangerie VALUES ('88888888888888', 'Le Petit Pain', '505 Avenue du Petit Pain', 'Ville8', '06:00', '17:30', '8901234567890');
INSERT INTO Boulangerie VALUES ('99999999999999', 'La Mie Dorée', '606 Boulevard de la Mie', 'Ville9', '07:30', '18:30', '9012345678901');
INSERT INTO Boulangerie VALUES ('10101010101010', 'Les Pains du Coin', '707 Rue du Coin', 'Ville10', '08:00', '19:00', '1234567890123');
INSERT INTO Boulangerie VALUES ('12121212121212', 'La Boulangerie Gourmande', '808 Avenue Gourmande', 'Ville11', '06:30', '18:00', '2345678901234');
INSERT INTO Boulangerie VALUES ('13131313131313', 'Au Pain Frais', '909 Boulevard du Pain', 'Ville12', '07:00', '18:30', '3456789012345');
INSERT INTO Boulangerie VALUES ('14141414141414', 'Le Pain Chaud', '111 Rue Chaud', 'Ville13', '06:00', '19:00', '4567890123456');
INSERT INTO Boulangerie VALUES ('15151515151515', 'Les Saveurs du Four', '121 Avenue des Saveurs', 'Ville14', '07:30', '18:30', '5678901234567');
INSERT INTO Boulangerie VALUES ('16161616161616', 'La Baguette Royale', '131 Boulevard Royal', 'Ville15', '08:00', '19:00', '6789012345678');
INSERT INTO Boulangerie VALUES ('17171717171717', 'Le Pain Croustillant', '141 Rue Croustillant', 'Ville16', '06:30', '18:00', '7890123456789');
INSERT INTO Boulangerie VALUES ('18181818181818', 'Croissants Gourmets', '151 Avenue Gourmets', 'Ville17', '07:00', '19:00', '8901234567890');
INSERT INTO Boulangerie VALUES ('19191919191919', 'Délices du Matin', '161 Boulevard du Matin', 'Ville18', '06:00', '17:30', '9012345678901');
INSERT INTO Boulangerie VALUES ('20202020202020', 'Pains Chauds et Dorés', '171 Rue Dorée', 'Ville19', '07:30', '18:30', '1234567890123');
INSERT INTO Boulangerie VALUES ('21212121212121', 'Le Four Créatif', '181 Avenue Créatif', 'Ville20', '08:00', '19:00', '2345678901234');
INSERT INTO Boulangerie VALUES ('22222222222220', 'La Mie Gourmande', '191 Boulevard Gourmande', 'Ville21', '06:30', '18:00', '3456789012345');
INSERT INTO Boulangerie VALUES ('23232323232323', 'Au Pain Chaud', '202 Rue Chaud', 'Ville22', '07:00', '18:30', '4567890123456');
INSERT INTO Boulangerie VALUES ('24242424242424', 'Délices et Saveurs', '212 Avenue Saveurs', 'Ville23', '06:00', '19:00', '5678901234567');
INSERT INTO Boulangerie VALUES ('25252525252525', 'La Baguette Croustillante', '222 Boulevard Croustillante', 'Ville24', '07:30', '18:30', '6789012345678');
INSERT INTO Boulangerie VALUES ('26262626262626', 'Pain Doré et Chaud', '232 Rue Dorée', 'Ville25', '08:00', '19:00', '7890123456789');
INSERT INTO Boulangerie VALUES ('27272727272727', 'Au Levain Gourmand', '242 Avenue Gourmand', 'Ville26', '06:30', '18:00', '8901234567890');
INSERT INTO Boulangerie VALUES ('28282828282828', 'Les Pains du Matin', '252 Boulevard du Matin', 'Ville27', '07:00', '19:00', '9012345678901');
INSERT INTO Boulangerie VALUES ('29292929292929', 'La Fournée Délicieuse', '262 Rue Délicieuse', 'Ville28', '06:00', '17:30', '1234567890123');
INSERT INTO Boulangerie VALUES ('30303030303030', 'Croissants Magiques', '272 Avenue Magique', 'Ville29', '07:30', '18:30', '2345678901234');


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
INSERT INTO Employe VALUES ('12345678901234', 'Anderson', 'Michael', TO_DATE('1992-03-18', 'YYYY-MM-DD'), 'M', '11111111111111', 53000.00, TO_DATE('2022-08-25', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('23456789012345', 'Davis', 'Olivia', TO_DATE('1994-07-10', 'YYYY-MM-DD'), 'F', '22222222222222', 56000.00, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('34567890123456', 'Clark', 'Christopher', TO_DATE('1987-12-03', 'YYYY-MM-DD'), 'M', '11111111111111', 51000.00, TO_DATE('2021-12-01', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('45678901234567', 'Taylor', 'Sophia', TO_DATE('1996-09-27', 'YYYY-MM-DD'), 'F', '22222222222222', 54000.00, TO_DATE('2022-05-15', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('56789012345678', 'Moore', 'Ethan', TO_DATE('1990-04-14', 'YYYY-MM-DD'), 'M', '11111111111111', 59000.00, TO_DATE('2023-03-20', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('67890123456789', 'White', 'Isabella', TO_DATE('1993-11-08', 'YYYY-MM-DD'), 'F', '22222222222222', 50000.00, TO_DATE('2021-10-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('78901234567890', 'Hall', 'Daniel', TO_DATE('1988-06-21', 'YYYY-MM-DD'), 'M', '11111111111111', 55000.00, TO_DATE('2022-07-12', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('89012345678901', 'Baker', 'Amelia', TO_DATE('1995-02-04', 'YYYY-MM-DD'), 'F', '22222222222222', 52000.00, TO_DATE('2023-04-18', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('90123456789012', 'Fisher', 'Logan', TO_DATE('1991-09-15', 'YYYY-MM-DD'), 'M', '11111111111111', 48000.00, TO_DATE('2021-11-30', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('16161616161616', 'Barnes', 'Mia', TO_DATE('1989-05-28', 'YYYY-MM-DD'), 'F', '22222222222222', 58000.00, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('17171717171717', 'Reed', 'William', TO_DATE('1997-10-11', 'YYYY-MM-DD'), 'M', '11111111111111', 53000.00, TO_DATE('2022-09-10', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('18181818181818', 'Cole', 'Ava', TO_DATE('1994-03-24', 'YYYY-MM-DD'), 'F', '22222222222222', 56000.00, TO_DATE('2023-01-25', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('19191919191919', 'Hill', 'Jackson', TO_DATE('1986-08-07', 'YYYY-MM-DD'), 'M', '11111111111111', 51000.00, TO_DATE('2021-12-20', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('20202020202020', 'Cooper', 'Grace', TO_DATE('1993-01-30', 'YYYY-MM-DD'), 'F', '22222222222222', 54000.00, TO_DATE('2022-06-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('21212121212121', 'Stewart', 'Ella', TO_DATE('1998-05-18', 'YYYY-MM-DD'), 'F', '11111111111111', 48000.00, TO_DATE('2021-08-15', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('22222222222222', 'Lee', 'Matthew', TO_DATE('1992-10-03', 'YYYY-MM-DD'), 'M', '22222222222222', 52000.00, TO_DATE('2022-11-20', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('23232323232323', 'Foster', 'Aria', TO_DATE('1987-04-26', 'YYYY-MM-DD'), 'F', '33333333333333', 56000.00, TO_DATE('2023-01-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('24242424242424', 'Gray', 'Oliver', TO_DATE('1995-09-09', 'YYYY-MM-DD'), 'M', '44444444444444', 50000.00, TO_DATE('2021-10-10', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('25252525252525', 'Bryant', 'Lily', TO_DATE('1989-02-22', 'YYYY-MM-DD'), 'F', '55555555555555', 53000.00, TO_DATE('2022-05-25', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('26262626262626', 'Murray', 'Elijah', TO_DATE('1994-07-17', 'YYYY-MM-DD'), 'M', '66666666666666', 59000.00, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('27272727272727', 'Fleming', 'Scarlett', TO_DATE('1991-12-30', 'YYYY-MM-DD'), 'F', '77777777777777', 55000.00, TO_DATE('2022-08-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('28282828282828', 'Graham', 'Lucas', TO_DATE('1986-06-13', 'YYYY-MM-DD'), 'M', '88888888888888', 51000.00, TO_DATE('2021-12-15', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('29292929292929', 'Palmer', 'Chloe', TO_DATE('1993-11-06', 'YYYY-MM-DD'), 'F', '99999999999999', 58000.00, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('30303030303030', 'Gardner', 'James', TO_DATE('1997-04-21', 'YYYY-MM-DD'), 'M', '10101010101010', 54000.00, TO_DATE('2022-07-18', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('31313131313131', 'Riley', 'Nora', TO_DATE('1988-09-04', 'YYYY-MM-DD'), 'F', '11111111111111', 56000.00, TO_DATE('2021-09-20', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');
INSERT INTO Employe VALUES ('32323232323232', 'Woods', 'Mason', TO_DATE('1995-02-17', 'YYYY-MM-DD'), 'M', '12121212121212', 51000.00, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Assistant');
INSERT INTO Employe VALUES ('33333333333333', 'Porter', 'Zoe', TO_DATE('1990-07-02', 'YYYY-MM-DD'), 'F', '13131313131313', 59000.00, TO_DATE('2022-10-25', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Cashier');
INSERT INTO Employe VALUES ('34343434343434', 'Hudson', 'Gabriel', TO_DATE('1998-12-15', 'YYYY-MM-DD'), 'M', '14141414141414', 48000.00, TO_DATE('2021-11-30', 'YYYY-MM-DD'), 1, 'Mon-Fri', 'Baker');
INSERT INTO Employe VALUES ('35353535353535', 'Perry', 'Hannah', TO_DATE('1992-05-28', 'YYYY-MM-DD'), 'F', '15151515151515', 55000.00, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 2, 'Tue-Sat', 'Chef');

-- INSERT VENTE (y'a 9 vendeur/employe qui reviennent a chaque fois on modifiera les autres nss apres)
INSERT INTO Vente VALUES (101, TO_DATE('2022-01-15', 'YYYY-MM-DD'), '11111111111111', '12345678901234', 150.00);
INSERT INTO Vente VALUES (102, TO_DATE('2022-02-20', 'YYYY-MM-DD'), '22222222222222', '23456789012345', 120.50);
INSERT INTO Vente VALUES (103, TO_DATE('2022-03-10', 'YYYY-MM-DD'), '33333333333333', '34567890123456', 200.75);
INSERT INTO Vente VALUES (104, TO_DATE('2022-04-05', 'YYYY-MM-DD'), '44444444444444', '45678901234567', 175.25);
INSERT INTO Vente VALUES (105, TO_DATE('2022-05-12', 'YYYY-MM-DD'), '55555555555555', '56789012345678', 130.99);
INSERT INTO Vente VALUES (106, TO_DATE('2022-06-18', 'YYYY-MM-DD'), '66666666666666', '67890123456789', 180.50);
INSERT INTO Vente VALUES (107, TO_DATE('2022-07-23', 'YYYY-MM-DD'), '77777777777777', '78901234567890', 210.25);
INSERT INTO Vente VALUES (108, TO_DATE('2022-08-30', 'YYYY-MM-DD'), '88888888888888', '89012345678901', 95.99);
INSERT INTO Vente VALUES (109, TO_DATE('2022-09-05', 'YYYY-MM-DD'), '99999999999999', '90123456789012', 240.75);
INSERT INTO Vente VALUES (110, TO_DATE('2022-10-10', 'YYYY-MM-DD'), '10101010101010', '12345678901234', 155.00);
INSERT INTO Vente VALUES (111, TO_DATE('2022-11-15', 'YYYY-MM-DD'), '12121212121212', '23456789012345', 128.50);
INSERT INTO Vente VALUES (112, TO_DATE('2022-12-20', 'YYYY-MM-DD'), '13131313131313', '34567890123456', 190.75);
INSERT INTO Vente VALUES (113, TO_DATE('2023-01-25', 'YYYY-MM-DD'), '14141414141414', '45678901234567', 165.25);
INSERT INTO Vente VALUES (114, TO_DATE('2023-02-28', 'YYYY-MM-DD'), '15151515151515', '56789012345678', 120.99);
INSERT INTO Vente VALUES (115, TO_DATE('2023-03-10', 'YYYY-MM-DD'), '16161616161616', '67890123456789', 170.50);
INSERT INTO Vente VALUES (116, TO_DATE('2023-04-15', 'YYYY-MM-DD'), '17171717171717', '78901234567890', 200.25);
INSERT INTO Vente VALUES (117, TO_DATE('2023-05-20', 'YYYY-MM-DD'), '18181818181818', '89012345678901', 145.99);
INSERT INTO Vente VALUES (118, TO_DATE('2023-06-25', 'YYYY-MM-DD'), '19191919191919', '90123456789012', 220.75);
INSERT INTO Vente VALUES (119, TO_DATE('2023-07-30', 'YYYY-MM-DD'), '20202020202020', '12345678901234', 135.00);
INSERT INTO Vente VALUES (120, TO_DATE('2023-08-05', 'YYYY-MM-DD'), '21212121212121', '23456789012345', 108.50);
INSERT INTO Vente VALUES (121, TO_DATE('2023-09-10', 'YYYY-MM-DD'), '22222222222220', '34567890123456', 160.75);
INSERT INTO Vente VALUES (122, TO_DATE('2023-10-15', 'YYYY-MM-DD'), '23232323232323', '45678901234567', 135.25);
INSERT INTO Vente VALUES (123, TO_DATE('2023-11-20', 'YYYY-MM-DD'), '24242424242424', '56789012345678', 90.99);
INSERT INTO Vente VALUES (124, TO_DATE('2023-12-25', 'YYYY-MM-DD'), '25252525252525', '67890123456789', 140.50);
INSERT INTO Vente VALUES (125, TO_DATE('2024-01-30', 'YYYY-MM-DD'), '26262626262626', '78901234567890', 170.25);
INSERT INTO Vente VALUES (126, TO_DATE('2024-02-05', 'YYYY-MM-DD'), '27272727272727', '89012345678901', 115.99);
INSERT INTO Vente VALUES (127, TO_DATE('2024-03-10', 'YYYY-MM-DD'), '28282828282828', '90123456789012', 190.75);
INSERT INTO Vente VALUES (128, TO_DATE('2024-04-15', 'YYYY-MM-DD'), '29292929292929', '12345678901234', 215.00);
INSERT INTO Vente VALUES (129, TO_DATE('2024-05-20', 'YYYY-MM-DD'), '30303030303030', '23456789012345', 178.50);


--INSERT PRODUIT 
INSERT INTO Produit VALUES ('P001', 'TypeA', 12.99, TO_DATE('2022-01-15', 'YYYY-MM-DD'), '12345678901234');
INSERT INTO Produit VALUES ('P002', 'TypeB', 8.50, TO_DATE('2022-02-20', 'YYYY-MM-DD'), '23456789012345');
INSERT INTO Produit VALUES ('P003', 'TypeC', 19.99, TO_DATE('2022-03-10', 'YYYY-MM-DD'), '34567890123456');
INSERT INTO Produit VALUES ('P004', 'TypeA', 15.75, TO_DATE('2022-04-05', 'YYYY-MM-DD'), '45678901234567');
INSERT INTO Produit VALUES ('P005', 'TypeB', 10.99, TO_DATE('2022-05-12', 'YYYY-MM-DD'), '56789012345678');
INSERT INTO Produit VALUES ('P006', 'TypeC', 25.50, TO_DATE('2022-06-18', 'YYYY-MM-DD'), '67890123456789');
INSERT INTO Produit VALUES ('P007', 'TypeA', 14.25, TO_DATE('2022-07-23', 'YYYY-MM-DD'), '78901234567890');
INSERT INTO Produit VALUES ('P008', 'TypeB', 9.99, TO_DATE('2022-08-30', 'YYYY-MM-DD'), '89012345678901');
INSERT INTO Produit VALUES ('P009', 'TypeC', 18.50, TO_DATE('2022-09-05', 'YYYY-MM-DD'), '90123456789012');
INSERT INTO Produit VALUES ('P010', 'TypeA', 22.00, TO_DATE('2022-10-10', 'YYYY-MM-DD'), '12345678901234');
INSERT INTO Produit VALUES ('P011', 'TypeB', 7.75, TO_DATE('2022-11-15', 'YYYY-MM-DD'), '23456789012345');
INSERT INTO Produit VALUES ('P012', 'TypeC', 16.99, TO_DATE('2022-12-20', 'YYYY-MM-DD'), '17171717171717');
INSERT INTO Produit VALUES ('P013', 'TypeA', 11.50, TO_DATE('2023-01-25', 'YYYY-MM-DD'), '18181818181818');
INSERT INTO Produit VALUES ('P014', 'TypeB', 28.00, TO_DATE('2023-02-28', 'YYYY-MM-DD'), '19191919191919');
INSERT INTO Produit VALUES ('P015', 'TypeC', 13.25, TO_DATE('2023-03-10', 'YYYY-MM-DD'), '20202020202020');
INSERT INTO Produit VALUES ('P016', 'TypeA', 17.99, TO_DATE('2023-04-15', 'YYYY-MM-DD'), '21212121212121');
INSERT INTO Produit VALUES ('P017', 'TypeB', 9.50, TO_DATE('2023-05-20', 'YYYY-MM-DD'), '89012345678901');
INSERT INTO Produit VALUES ('P018', 'TypeC', 23.75, TO_DATE('2023-06-25', 'YYYY-MM-DD'), '90123456789012');
INSERT INTO Produit VALUES ('P019', 'TypeA', 14.99, TO_DATE('2023-07-30', 'YYYY-MM-DD'), '12345678901234');
INSERT INTO Produit VALUES ('P020', 'TypeB', 11.25, TO_DATE('2023-08-05', 'YYYY-MM-DD'), '23456789012345');
INSERT INTO Produit VALUES ('P021', 'TypeC', 20.50, TO_DATE('2023-09-10', 'YYYY-MM-DD'), '34567890123456');
INSERT INTO Produit VALUES ('P022', 'TypeA', 25.99, TO_DATE('2023-10-15', 'YYYY-MM-DD'), '30303030303030');
INSERT INTO Produit VALUES ('P023', 'TypeB', 8.75, TO_DATE('2023-11-20', 'YYYY-MM-DD'), '25252525252525');
INSERT INTO Produit VALUES ('P024', 'TypeC', 12.50, TO_DATE('2023-12-25', 'YYYY-MM-DD'), '26262626262626');
INSERT INTO Produit VALUES ('P025', 'TypeA', 19.99, TO_DATE('2024-01-30', 'YYYY-MM-DD'), '28282828282828');
INSERT INTO Produit VALUES ('P026', 'TypeB', 14.25, TO_DATE('2024-02-05', 'YYYY-MM-DD'), '89012345678901');
INSERT INTO Produit VALUES ('P027', 'TypeC', 9.50, TO_DATE('2024-03-10', 'YYYY-MM-DD'), '90123456789012');
INSERT INTO Produit VALUES ('P028', 'TypeA', 16.75, TO_DATE('2024-04-15', 'YYYY-MM-DD'), '12345678901234');
INSERT INTO Produit VALUES ('P029', 'TypeB', 22.00, TO_DATE('2024-05-20', 'YYYY-MM-DD'), '23456789012345');


-- INSERT Ligne_Vente
INSERT INTO Ligne_Vente VALUES (1, 101, TO_DATE('2022-01-15', 'YYYY-MM-DD'), '100000000000001', '11111111111111');
INSERT INTO Ligne_Vente VALUES (2, 102, TO_DATE('2022-02-20', 'YYYY-MM-DD'), '200000000000002', '22222222222222');
INSERT INTO Ligne_Vente VALUES (3, 103, TO_DATE('2022-03-10', 'YYYY-MM-DD'), '300000000000003', '33333333333333');
INSERT INTO Ligne_Vente VALUES (4, 104, TO_DATE('2022-04-05', 'YYYY-MM-DD'), '400000000000004', '44444444444444');
INSERT INTO Ligne_Vente VALUES (5, 105, TO_DATE('2022-05-12', 'YYYY-MM-DD'), '500000000000005', '55555555555555');
INSERT INTO Ligne_Vente VALUES (6, 106, TO_DATE('2022-06-18', 'YYYY-MM-DD'), '600000000000006', '66666666666666');
INSERT INTO Ligne_Vente VALUES (7, 107, TO_DATE('2022-07-23', 'YYYY-MM-DD'), '700000000000007', '77777777777777');
INSERT INTO Ligne_Vente VALUES (8, 108, TO_DATE('2022-08-30', 'YYYY-MM-DD'), '800000000000008', '88888888888888');
INSERT INTO Ligne_Vente VALUES (9, 109, TO_DATE('2022-09-05', 'YYYY-MM-DD'), '900000000000009', '99999999999999');
INSERT INTO Ligne_Vente VALUES (10, 110, TO_DATE('2022-10-10', 'YYYY-MM-DD'), '101000000000010', '10101010101010');
INSERT INTO Ligne_Vente VALUES (11, 111, TO_DATE('2022-11-15', 'YYYY-MM-DD'), '111000000000011', '12121212121212');
INSERT INTO Ligne_Vente VALUES (12, 112, TO_DATE('2022-12-20', 'YYYY-MM-DD'), '121000000000012', '13131313131313');
INSERT INTO Ligne_Vente VALUES (13, 113, TO_DATE('2023-01-25', 'YYYY-MM-DD'), '131000000000013', '14141414141414');
INSERT INTO Ligne_Vente VALUES (14, 114, TO_DATE('2023-02-28', 'YYYY-MM-DD'), '141000000000014', '15151515151515');
INSERT INTO Ligne_Vente VALUES (15, 115, TO_DATE('2023-03-10', 'YYYY-MM-DD'), '151000000000015', '16161616161616');
INSERT INTO Ligne_Vente VALUES (16, 116, TO_DATE('2023-04-15', 'YYYY-MM-DD'), '161000000000016', '17171717171717');
INSERT INTO Ligne_Vente VALUES (17, 117, TO_DATE('2023-05-20', 'YYYY-MM-DD'), '171000000000017', '18181818181818');
INSERT INTO Ligne_Vente VALUES (18, 118, TO_DATE('2023-06-25', 'YYYY-MM-DD'), '181000000000018', '19191919191919');
INSERT INTO Ligne_Vente VALUES (19, 119, TO_DATE('2023-07-30', 'YYYY-MM-DD'), '191000000000019', '20202020202020');
INSERT INTO Ligne_Vente VALUES (20, 120, TO_DATE('2023-08-05', 'YYYY-MM-DD'), '201000000000020', '21212121212121');
INSERT INTO Ligne_Vente VALUES (21, 121, TO_DATE('2023-09-10', 'YYYY-MM-DD'), '211000000000021', '22222222222220');
INSERT INTO Ligne_Vente VALUES (22, 122, TO_DATE('2023-10-15', 'YYYY-MM-DD'), '221000000000022', '23232323232323');
INSERT INTO Ligne_Vente VALUES (23, 123, TO_DATE('2023-11-20', 'YYYY-MM-DD'), '231000000000023', '24242424242424');
INSERT INTO Ligne_Vente VALUES (24, 124, TO_DATE('2023-12-25', 'YYYY-MM-DD'), '241000000000024', '25252525252525');
INSERT INTO Ligne_Vente VALUES (25, 125, TO_DATE('2024-01-30', 'YYYY-MM-DD'), '251000000000025', '26262626262626');
INSERT INTO Ligne_Vente VALUES (26, 126, TO_DATE('2024-02-05', 'YYYY-MM-DD'), '261000000000026', '27272727272727');
INSERT INTO Ligne_Vente VALUES (27, 127, TO_DATE('2024-03-10', 'YYYY-MM-DD'), '271000000000027', '28282828282828');
INSERT INTO Ligne_Vente VALUES (28, 128, TO_DATE('2024-04-15', 'YYYY-MM-DD'), '281000000000028', '29292929292929');
INSERT INTO Ligne_Vente VALUES (29, 129, TO_DATE('2024-05-20', 'YYYY-MM-DD'), '291000000000029', '30303030303030');
