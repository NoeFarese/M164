-- Vorbereitung
DROP DATABASE IF EXISTS Fahrzeugpark;
GO

CREATE DATABASE Fahrzeugpark;
GO

USE Fahrzeugpark;
GO

CREATE TABLE Fahrzeug(
    FahrzeugId INT IDENTITY PRIMARY KEY,
    Marke VARCHAR(50),
    Typ VARCHAR(50),
    NeuPreis DECIMAL(9, 2),
    JAHRGANG INT,
    Occasion BIT,
    fk_MitarbeiterId INT,
    Kennzeichen VARCHAR(15),
    FOREIGN KEY (fk_MitarbeiterId) REFERENCES Mitarbeiter(MitarbeiterId)
);
GO

CREATE TABLE Mitarbeiter(
    MitarbeiterId INT IDENTITY PRIMARY KEY,
    Nachname VARCHAR(30),
    Vorname VARCHAR(30)
);
GO

-- Aufgabe 1
INSERT INTO Mitarbeiter(Nachname, Vorname) VALUES('Bühler', 'Cornelia');
INSERT INTO Mitarbeiter(Nachname, Vorname) VALUES('Holzmann', 'Dieter');
INSERT INTO Mitarbeiter(Nachname, Vorname) VALUES('Tobler','Franz');

SELECT * FROM Mitarbeiter;

-- __________________________________________________________________________________________________

INSERT INTO Fahrzeug(Marke, Typ, NeuPreis, Jahrgang, Occasion) VALUES
('Renault', 'Talisman', 45000.00, 2017, 0),
('VW', 'Golf', 12000.00 , 2014, 1),
('Mercedes','E220', 59000.00, 2017, 0),
('VW', 'Caddy', 21000.00, 2018, 0),
('VW', 'Caddy', 17000.00, 2019, 1);

SELECT * FROM Fahrzeug;

-- Aufgabe 02
UPDATE Fahrzeug SET fk_MitarbeiterId = 1 WHERE Typ = 'E220' AND Marke = 'Mercedes';
UPDATE Fahrzeug SET fk_MitarbeiterId = 2 WHERE Typ = 'Talisman' AND Marke = 'Renault';

SELECT * FROM Fahrzeug;

-- Aufgabe 03
UPDATE Fahrzeug SET fk_MitarbeiterId = 1 WHERE Typ = 'Golf' AND Marke = 'VW';

-- Aufgabe 04
INSERT INTO Fahrzeug (marke,typ,neuPreis,jahrgang,Occasion) VALUES ('Mercedes','GLA 200',39900,2013,0);
DELETE FROM Fahrzeug WHERE marke = 'Mercedes' and typ= 'E220'

-- Aufgabe 05
ALTER TABLE Fahrzeug ADD Kennzeichen VARCHAR(15);
GO
UPDATE Fahrzeug SET Kennzeichen = 'LU 134 213' WHERE marke = 'Mercedes' and typ= 'GLA 200'
UPDATE Fahrzeug SET Kennzeichen = 'LU 89 345' WHERE marke = 'VW' and typ= 'Golf'
UPDATE Fahrzeug SET Kennzeichen = 'NW 8349' WHERE marke = 'Renault' and typ= 'Talisman'

-- Aufgabe 06
DELETE FROM Mitarbeiter WHERE vorName = 'Cornelia' AND nachName = 'Bühler'

-- Aufgabe 07
ALTER TABLE Fahrzeug ADD zeitWert DECIMAL(9,2);
Go

-- Aufgabe 08 & 09
UPDATE Fahrzeug SET zeitWert = neuPreis/2 WHERE  jahrgang >= Year(GETDATE())-4;
UPDATE Fahrzeug SET zeitWert = neuPreis/100*30 WHERE jahrgang < Year(GETDATE())-4;
UPDATE Fahrzeug SET zeitWert = 1.00 WHERE  Occasion = 1 and zeitWert < 7500;

select * from Fahrzeug
select * from Mitarbeiter