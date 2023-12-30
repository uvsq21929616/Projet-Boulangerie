LOAD DATA
INFILE *
APPEND
INTO TABLE Patisserie
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(reference_produit, nom, temperature_conservation)
BEGINDATA
'P015', 'éclair au chocolat', 2
'P016', 'pain au chocolat', 20
'P017', 'croissant', 20
'P018', 'pain au raisin', 20
'P019', 'éclair au café', 2
'P020', 'fraisier', 4
'P021', 'paris-brest', 4
'P022', 'mille-feuille', 4
'P023', 'gland', 2
'P024', 'chouquettes', 20
'P025', 'tarte au fraises', 2
'P026', 'tarte au citron meringuée', 2
'P027', 'meringue', 20
'P028', 'religieuse café', 2
'P029', 'religieuse chocolat', 2