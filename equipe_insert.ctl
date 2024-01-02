LOAD DATA
INFILE *
APPEND
INTO TABLE Equipe
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(numero_equipe, horaire)
BEGINDATA
1, 'Matin'
2, 'Après-midi'
3, 'Soir'