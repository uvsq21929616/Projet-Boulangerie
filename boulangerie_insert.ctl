LOAD DATA
INFILE *
APPEND
INTO TABLE Boulangerie
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(numero_siret, nom_boulangerie, adresse, ville, heure_ouverture, heure_fermeture, nss_responsable)
BEGINDATA
'11111111111111','Le Pain Doré','123 Rue de la Boulangerie','Ville1','07:00','18:00','1234567890123'
'22222222222222','Au Levain Magique','456 Avenue du Croissant','Ville2','06:30','17:30','2345678901234'
'33333333333333','La Baguette Gourmande','789 Boulevard de la Baguette','Ville3','06:00','18:30','3456789012345'
'44444444444444','Les Délices du Four','101 Rue des Pains','Ville4','08:00','19:00','4567890123456'
'55555555555555','Croissants et Compagnie','202 Avenue des Croissants','Ville5','07:30','18:30','5678901234567'
'66666666666666','La Fournée Croustillante','303 Boulevard de la Fournée','Ville6','06:30','18:00','6789012345678'
'77777777777777','Pains et Délices','404 Rue des Délices','Ville7','07:00','19:00','7890123456789'
'88888888888888','Le Petit Pain','505 Avenue du Petit Pain','Ville8','06:00','17:30','8901234567890'
'99999999999999','La Mie Dorée','606 Boulevard de la Mie','Ville9','07:30','18:30','9012345678901'
'10101010101010','Les Pains du Coin','707 Rue du Coin','Ville10','08:00','19:00','1234567890123'
'12121212121212','La Boulangerie Gourmande','808 Avenue Gourmande','Ville11','06:30','18:00','2345678901234'
'13131313131313','Au Pain Frais','909 Boulevard du Pain','Ville12','07:00','18:30','3456789012345'
'14141414141414','Le Pain Chaud','111 Rue Chaud','Ville13','06:00','19:00','4567890123456'
'15151515151515','Les Saveurs du Four','121 Avenue des Saveurs','Ville14','07:30','18:30','5678901234567'
'16161616161616','La Baguette Royale','131 Boulevard Royal','Ville15','08:00','19:00','6789012345678'
'17171717171717','Le Pain Croustillant','141 Rue Croustillant','Ville16','06:30','18:00','7890123456789'
'18181818181818','Croissants Gourmets','151 Avenue Gourmets','Ville17','07:00','19:00','8901234567890'
'19191919191919','Délices du Matin','161 Boulevard du Matin','Ville18','06:00','17:30','9012345678901'
'20202020202020','Pains Chauds et Dorés','171 Rue Dorée','Ville19','07:30','18:30','1234567890123'
'21212121212121','Le Four Créatif','181 Avenue Créatif','Ville20','08:00','19:00','2345678901234'
'22222222222220','La Mie Gourmande','191 Boulevard Gourmande','Ville21','06:30','18:00','3456789012345'
'23232323232323','Au Pain Chaud','202 Rue Chaud','Ville22','07:00','18:30','4567890123456'
'24242424242424','Délices et Saveurs','212 Avenue Saveurs','Ville23','06:00','19:00','5678901234567'
'25252525252525','La Baguette Croustillante','222 Boulevard Croustillante','Ville24','07:30','18:30','6789012345678'
'26262626262626','Pain Doré et Chaud','232 Rue Dorée','Ville25','08:00','19:00','7890123456789'
'27272727272727','Au Levain Gourmand','242 Avenue Gourmand','Ville26','06:30','18:00','8901234567890'
'28282828282828','Les Pains du Matin','252 Boulevard du Matin','Ville27','07:00','19:00','9012345678901'
'29292929292929','La Fournée Délicieuse','262 Rue Délicieuse','Ville28','06:00','17:30','1234567890123'
'30303030303030','Croissants Magiques','272 Avenue Magique','Ville29','07:30','18:30','2345678901234'

