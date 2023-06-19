--*********************************************************
-- AutoVerkauf, T-SQL
--*********************************************************

-----------------------------------------------------------
-- Datenbank erstellen
-----------------------------------------------------------
use master
go
drop database if exists AutoVerkauf; 
go
create database AutoVerkauf;
go
use AutoVerkauf;
go

-----------------------------------------------------------
-- Tabellen erstellen
-----------------------------------------------------------
create table Marke (
  MarkeId integer identity,
  Bez varchar(30),
  primary key (MarkeId)
);

create table Fahrzeug (
  FahrzeugId integer identity,
  Modell varchar(30),
  Baujahr integer,
  fk_MarkeId integer,
  primary key (FahrzeugId),
  foreign key (fk_MarkeId) references Marke (MarkeId)
);
go
