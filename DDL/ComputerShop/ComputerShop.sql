-- Aufgabe 1 und 2
USE master;
GO

DROP DATABASE IF EXISTS ComputerShop;
GO

CREATE DATABASE ComputerShop;
GO

USE ComputerShop;
GO

CREATE TABLE Kunde(
   KundeId INT IDENTITY PRIMARY KEY,
   Nachname VARCHAR(30),
   Vorname VARCHAR(30)
);
GO

CREATE TABLE Artikel(
    Artikelid INT IDENTITY PRIMARY KEY,
    Bezeichnung VARCHAR(50),
    Preis NUMERIC(9, 2)
);
GO

CREATE TABLE Bestellung(
    BestellungId INT IDENTITY PRIMARY KEY,
    Datum DATE,
    KomplettLieferung BIT,
    fk_ArtikelId INT,
    fk_KundeId INT
);

CREATE TABLE BestehtAus(
    BestehtAusId INT IDENTITY PRIMARY KEY,
    fk_BestellungId INT,
    fk_ArtikelId INT
    FOREIGN KEY (fk_BestellungId) REFERENCES Bestellung(BestellungId),
    FOREIGN KEY (fk_ArtikelId) REFERENCES Artikel(Artikelid)
);

ALTER TABLE Bestellung DROP COLUMN fk_ArtikelId;

-- Aufgabe 3
ALTER TABLE BestehtAus ADD Anzahl INT;

-- Aufgabe 4