LOAD DATA
INFILE *
APPEND
INTO TABLE Clients
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(numero_client, nom, prenom)
BEGINDATA
'100000000000001','Dupont','Alice'
'200000000000002','Martin','Bob'
'300000000000003','Smith','Carol'
'400000000000004','Jones','David'
'500000000000005','Miller','Emma'
'600000000000006','Wilson','Frank'
'700000000000007','Taylor','Grace'
'800000000000008','Anderson','Henry'
'900000000000009','Perez','Isabella'
'101000000000010','Garcia','Jack'
'111000000000011','Thomas','Karen'
'121000000000012','White','Liam'
'131000000000013','Harris','Olivia'
'141000000000014','Moore','Nathan'
'151000000000015','Clark','Sophia'
'161000000000016','Allen','Taylor'
'171000000000017','Lewis','Victoria'
'181000000000018','Walker','William'
'191000000000019','Hall','Zoe'
'201000000000020','Young','Andrew'
'211000000000021','Lopez','Bella'
'221000000000022','Adams','Christopher'
'231000000000023','Cook','Daisy'
'241000000000024','Evans','Ella'
'251000000000025','Green','Gabriel'
'261000000000026','King','Hailey'
'271000000000027','Morgan','Ian'
'281000000000028','Scott','Jasmine'
'291000000000029','Baker','Kevin'