LOAD DATA
INFILE *
APPEND
INTO TABLE Commande
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(numero_ligne_vente, numero_vente, ref_produit, total_ligne, quantite)
BEGINDATA
1, 101, 'P001', 50.00, 2
2, 102, 'P002', 45.00, 1
3, 103, 'P003', 30.00, 3
4, 104, 'P004', 25.00, 1
5, 105, 'P005', 20.00, 2
6, 106, 'P006', 15.00, 1
7, 107, 'P007', 40.00, 3
8, 108, 'P008', 35.00, 1
9, 109, 'P009', 60.00, 2
10, 110, 'P010', 55.00, 1
11, 111, 'P011', 70.00, 3
12, 112, 'P012', 65.00, 1
13, 113, 'P013', 80.00, 2
14, 114, 'P014', 75.00, 1
15, 115, 'P015', 90.00, 3
16, 116, 'P016', 85.00, 1
17, 117, 'P017', 100.00, 2
18, 118, 'P018', 95.00, 1
19, 119, 'P019', 110.00, 3
20, 120, 'P020', 105.00, 1
21, 121, 'P021', 120.00, 2
22, 122, 'P022', 115.00, 1
23, 123, 'P023', 130.00, 3
24, 124, 'P024', 125.00, 1
25, 125, 'P025', 140.00, 2
26, 126, 'P026', 135.00, 1
27, 127, 'P027', 150.00, 3
28, 128, 'P028', 145.00, 1
29, 129, 'P029', 160.00, 2
30, 129, 'P029', 155.00, 1
