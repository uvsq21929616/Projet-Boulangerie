LOAD DATA
INFILE *
APPEND
INTO TABLE Equipe
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(numero_equipe, horaire, num_siret_magasin)
BEGINDATA
1,'Matin','11111111111111'
2,'Après-midi','22222222222222'
3,'Soir','33333333333333'
4,'Nuit','44444444444444'
5,'Weekend Matin','55555555555555'
6,'Weekend Après-midi','66666666666666'
7,'Weekend Soir','77777777777777'
8,'Weekend Nuit','88888888888888'
9,'Jour','99999999999999'
10,'Nuit Tardive','10101010101010'
11,'Matin Tôt','12121212121212'
12,'Après-midi Tardif','13131313131313'
13,'Soir Tardif','14141414141414'
14,'Nuit Tôt','15151515151515'
15,'Weekend Matin Tôt','16161616161616'
16,'Weekend Après-midi Tardif','17171717171717'
17,'Weekend Soir Tardif','18181818181818'
18,'Weekend Nuit Tôt','19191919191919'
19,'Jour Tardif','20202020202020'
20,'Nuit Matin','21212121212121'
21,'Matin Weekend','22222222222222'
22,'Après-midi Weekend','23232323232323'
23,'Soir Weekend','24242424242424'
24,'Nuit Weekend','25252525252525'
25,'Weekend','26262626262626'
26,'Weekend Tardif','27272727272727'
27,'Jour Weekend','28282828282828'
28,'Nuit Weekend Tôt','29292929292929'
29,'Matin Tardif Weekend','30303030303030'

