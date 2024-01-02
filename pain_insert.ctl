LOAD DATA
INFILE *
APPEND
INTO TABLE Pain
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(reference_produit, nom, temperature_conservation)
BEGINDATA
'P001', 'baguette tradition', 20
'P002', 'pain de campagne', 20
'P003', 'pain nordique', 20
'P004', 'baguette tradition', 20
'P005', 'baguette', 20
'P006', 'baguette aux graines', 20
'P007', 'pain complet', 20
'P008', 'pain de mie', 20
'P009', 'pain brioche', 20
'P010', 'baguette epi', 20
'P011', 'pain de seigle', 20
'P012', 'pain marguerite', 20
'P013', 'pain aux graines', 20
'P014', 'baguette viennoise', 20
