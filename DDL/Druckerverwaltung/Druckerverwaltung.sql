-- Aufgabe 04

USE master;
GO

DROP DATABASE IF EXISTS Druckerverwaltung;
GO

CREATE DATABASE Druckerverwaltung;
GO

USE Druckerverwaltung;
GO

-- Aufgabe 05

CREATE TABLE Standort (
    StandortId INT identity PRIMARY KEY,
    Bezeichnung VARCHAR(20)
);
GO

CREATE TABLE Mitarbeiter (
    MitarbeiterId INT identity PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    TellIntern VARCHAR(10)
);
GO

-- Aufgabe 06

CREATE TABLE Drucker (
    Druckerid INT IDENTITY PRIMARY KEY,
    Bezeichnung VARCHAR(20),
    Typ VARCHAR(20),
    SerienNr VARCHAR(20),
    KaufDatum DATE,
    fk_MitarbeiterId INT,
    fk_StandortId INT,
    FOREIGN KEY (fk_StandortId) REFERENCES Standort(StandortId);
);
GO

/*
ALTER TABLE Drucker ADD Hersteller VARCHAR(20);
GO

ALTER TABLE Drucker DROP COLUMN Hersteller;
GO
*/

-- Aufgabe 07
ALTER TABLE Drucker ADD KaufPreis DECIMAL(9,2);

-- Aufgabe 08

ALTER TABLE Drucker ADD CONSTRAINT fk_Mitarbeiter FOREIGN KEY (fk_MitarbeiterId) REFERENCES Mitarbeiter(MitarbeiterId);
ALTER TABLE Drucker ADD CONSTRAINT fk_Standort FOREIGN KEY (fk_StandortId) REFERENCES Standort(StandortId);

-- Aufgabe 09
USE master;
GO

DROP DATABASE IF EXISTS Druckerverwaltung;
GO

CREATE DATABASE Druckerverwaltung;
GO

USE Druckerverwaltung;
GO

CREATE TABLE Standort (
    StandortId INT identity PRIMARY KEY,
    Bezeichnung VARCHAR(20)
);
GO

CREATE TABLE Mitarbeiter (
    MitarbeiterId INT identity PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    TellIntern VARCHAR(10)
);
GO

CREATE TABLE Drucker (
    Druckerid INT IDENTITY PRIMARY KEY,
    Bezeichnung VARCHAR(20),
    Typ VARCHAR(20),
    SerienNr VARCHAR(20),
    KaufDatum DATE,
    KaufPreis DECIMAL(9,2),
    fk_MitarbeiterId INT,
    fk_StandortId INT,
    FOREIGN KEY (fk_StandortId) REFERENCES Standort(StandortId),
    FOREIGN KEY (fk_MitarbeiterId) REFERENCES Mitarbeiter(MitarbeiterId)
);
GO