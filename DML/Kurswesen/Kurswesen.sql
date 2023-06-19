-- Aufgabe01
use master;
GO

DROP DATABASE IF EXISTS Kurswesen;
GO

CREATE DATABASE Kurswesen;
GO

use Kurswesen;
GO

CREATE TABLE Kurs(
    KursId INT IDENTITY(1,1) PRIMARY KEY,
    Bez VARCHAR,
    MaxTeilnehmer INT,
    Kosten INT,
    StartDatum DATE,
    Dauer DECIMAL(9, 2) 
);
GO

INSERT INTO Kurs (Bez, Kosten, Dauer, MaxTeilnehmer, StartDatum) VALUES ('Windows 11', 450, 2.5, 10, '2022-06-03');
INSERT INTO Kurs (Bez, StartDatum, MaxTeilnehmer, Kosten) VALUES ('Word 2019', '2022-04-20', 5, 250);
INSERT INTO Kurs (Bez, Kosten, MaxTeilnehmer, Dauer, StartDatum) VALUES ('Windows 11 Neuheiten', 150, 15, 0.5, '2022-05-17');

SELECT * FROM Kurs;
DELETE FROM Kurs WHERE KursId = 2;

-- Aufgabe 02
UPDATE Kurs SET StartDatum = '2022-05-02', MaxTeilnehmer = 15 WHERE KursId = 1;

-- Aufgabe 03
INSERT INTO Kurs (Bez, StartDatum, Dauer, MaxTeilnehmer, Kosten) VALUES ('Word 365', '2022-06-15', 2, 10, 320);
INSERT INTO Kurs (Bez, StartDatum, Dauer, MaxTeilnehmer, Kosten) VALUES ('Excel 365', ' ', 2, 10, 320);

-- Aufgabe 04
SELECT * FROM Kurs;
DELETE FROM Kurs WHERE KursId = 3;

-- Aufgabe 05
UPDATE Kurs SET MaxTeilnehmer = 12 WHERE MaxTeilnehmer < 12;

-- Aufgabe 06
UPDATE Kurs SET StartDatum = '2022-05-24' WHERE StartDatum = '2022-05-17';