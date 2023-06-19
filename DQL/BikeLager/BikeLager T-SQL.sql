--*********************************************************
-- Bikelager
--*********************************************************

-----------------------------------------------------------
-- Datenbank erstellen
-----------------------------------------------------------
use master
go
drop database if exists BikeLager; 
go
create database BikeLager;
go
use BikeLager;
go

-----------------------------------------------------------
-- Tabllen erstellen
-----------------------------------------------------------
create table Typ(
  TypId integer identity,
  Bez varchar(20),
  primary key (TypId)
);

create table Marke (
  MarkeId integer identity,
  Bez varchar(20),
  primary key (MarkeId)
);

create table Bike (
  BikeId integer identity,
  Bez varchar(20),
  Preis decimal(9, 2),  
  fk_TypId integer,
  fk_MarkeId integer,
  primary key (BikeId),
  foreign key (fk_TypId) references Typ (TypId),
  foreign key (fk_MarkeId) references Marke (MarkeId)
);
go

-----------------------------------------------------------
-- Inhalte einfügen
-----------------------------------------------------------
insert into Typ (Bez) values 
  ('Citybike'),
  ('E-Bike'),
  ('Kinderbike'),
  ('Mountainbike'),
  ('Rennvelo');

insert into Marke (Bez) values 
  ('Scott'),
  ('Trek'),
  ('Flyer'),
  ('Wheeler'),
  ('Cube');

insert into Bike (Bez, Preis) values 
  ('Travel SL', 1399),     /* Cube, Citybike */
  ('Upstreet 5', 3899),    /* Flyer, E-Bike */
  ('Uproc 3', 4599),       /* Flyer, E-Bike */
  ('C 5.1', 3199),         /* Flyer, E-Bike */
  ('Powerfly FS 7', 5399), /* Trek, E-Bike */
  ('Fuel EX 9.8', 3999),   /* Trek, Mountainbike */
  ('Scale 24', 499),       /* Scott, Kinderbike */
  ('Scale 950', 1199),     /* Scott, Mountainbike */
  ('XT EQT 24', 499),      /* Wheeler, Citybike */
  ('Protron XT-10', 999);  /* Wheeler, Mountainbike */
go

-----------------------------------------------------------
-- Typ und Marke pro Bike setzen
-----------------------------------------------------------
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'Citybike'),      fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Cube'   )  where Bike.Bez = 'Travel SL';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'E-Bike'),        fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Flyer'  )  where Bike.Bez = 'Upstreet 5';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'E-Bike'),        fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Flyer'  )  where Bike.Bez = 'Uproc 3';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'E-Bike'),        fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Flyer'  )  where Bike.Bez = 'C 5.1';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'E-Bike'),        fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Trek'   )  where Bike.Bez = 'Powerfly FS 7';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'Mountainbike'),  fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Trek'   )  where Bike.Bez = 'Fuel EX 9.8';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'Kinderbike'),    fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Scott'  )  where Bike.Bez = 'Scale 24';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'Mountainbike'),  fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Scott'  )  where Bike.Bez = 'Scale 950';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'Citybike'),      fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Wheeler')  where Bike.Bez = 'XT EQT 24';
update Bike set fk_TypId = (select TypId from Typ where Typ.Bez = 'Mountainbike'),  fk_MarkeId = (select MarkeId from Marke where Marke.Bez = 'Wheeler')  where Bike.Bez = 'Protron XT-10';


-- Aufgabe 01
USE BikeLager;

SELECT * FROM Bike;
SELECT * FROM Marke;
SELECT * FROM Typ;

-- Aufgabe 02
SELECT * FROM Bike WHERE fk_MarkeId = 3;

-- Aufgabe 03
SELECT Bez as 'Bike', Preis FROM Bike WHeRE fk_MarkeId = 1 AND fk_TypId = 4;

-- Aufgabe 04
SELECT Marke.Bez as 'Marke', Bike.Bez as 'Bike', Preis FROM Bike
join Marke on Bike.fk_MarkeId = Marke.MarkeId;

-- Aufgabe 05
SELECT Marke.Bez as 'Marke', Bike.Bez as 'Bike', Preis FROM Bike
join Marke on Bike.fk_MarkeId = Marke.MarkeId ORDER BY Preis desc;

-- Aufgabe 06
SELECT Marke.Bez as 'Bike-Marke', Bike.Bez as 'Bike-Name', Preis FROM Bike
join Marke on Bike.fk_MarkeId = Marke.MarkeId
WHERE Preis != 499 ORDER BY 'Bike-Marke', 'Bike-Name' desc;

-- Aufgabe 07
SELECT Marke.Bez as 'Bike-Marke', Bike.Bez as 'Bike-Name', Typ.Bez as 'Typ', Bike.Preis FROM Bike
join Marke on Marke.MarkeId = Bike.fk_MarkeId
join Typ on Typ.TypId = Bike.fk_TypId
WHERE Marke.Bez = 'Wheeler'
ORDER BY Preis desc;

-- Aufgabe 08
SELECT AVG(Preis) as 'Preis', Typ.Bez as 'Typ' FROM Bike
JOIN Typ on Typ.TypId = Bike.fk_TypId
WHERE fk_TypId = 2;

-- Aufgabe 09
SELECT m.Bez, COUNT(m.Bez) as Anzahl FROM Bike b
JOIN Marke m ON m.MarkeId = b.fk_MarkeId
GROUP BY m.Bez
ORDER BY COUNT(m.Bez) DESC;

-- Aufgabe 10
SELECT t.Bez FROM Bike b
RIGHT JOIN Typ t ON t.TypId = b.fk_TypId
GROUP BY t.Bez
HAVING COUNT(b.Bez) = 0;

-- Aufgabe 11
SELECT t.Bez, COUNT(t.Bez) as Anzahl FROM Bike b
LEFT JOIN Typ t ON t.TypId = b.fk_TypId
GROUP BY t.Bez
ORDER BY COUNT(t.Bez) ASC;  

-- Aufgabe 12
SELECT m.Bez, AVG(b.Preis) as Anzahl FROM Bike b
LEFT JOIN Marke m ON m.MarkeId = b.fk_MarkeId
GROUP BY m.Bez
ORDER BY AVG(b.Preis) ASC

-- Aufgabe 13
SELECT m.Bez, MIN(b.Preis) Minimum, MAX(b.Preis) Maximum, SUM(b.Preis) Gesamt FROM Marke m
LEFT JOIN Bike b ON b.fk_MarkeId =  m.MarkeId
GROUP BY m.Bez
ORDER BY m.Bez

-- Aufgabe 14
SELECT m.Bez, COUNT(b.BikeId) AS 'Preis' FROM Marke m
LEFT JOIN Bike b ON b.fk_MarkeId =  m.MarkeId
LEFT JOIN Typ t ON t.TypId = b.fk_TypId
GROUP BY  t.Bez, m.Bez
HAVING t.Bez = 'E-Bike'
ORDER BY COUNT(b.BikeId) DESC

-- Aufgabe 15
SELECT m.Bez, b.Bez, b.Preis AS 'VP inkl', b.Preis/100*(100-7.7) AS 'VP exkl', b.Preis/100*7.7 AS 'VP MWST' FROM Marke m
LEFT JOIN Bike b ON b.fk_MarkeId =  m.MarkeId

-- Aufgabe 16
SELECT SUM(b.Preis/100*15) FROM Bike b;

-- Aufgabe 17
SELECT m.Bez, b.Bez, t.Bez, b.Preis AS 'Normal-VP', b.Preis-200 AS 'Aktion-VP' FROM Bike b
LEFT JOIN Marke m ON b.fk_MarkeId =  m.MarkeId
LEFT JOIN Typ t ON t.TypId = b.fk_TypId
WHERE b.Preis >= 1000 AND NOT t.Bez = 'E-Bike'
ORDER BY t.TypId, b.Preis;