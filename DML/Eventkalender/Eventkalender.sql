-- Aufgabe 02
DROP DATABASE IF EXISTS Eventkalender;
GO

CREATE DATABASE Eventkalender;
GO

USE Eventkalender;
GO

CREATE TABLE Event (
    Datum DATE NOT NULL,
    Zeit TIME NOT NULL,
    Bezeichnung VARCHAR(255) NOT NULL,
    Kuenstler VARCHAR(255) NOT NULL,
    Lokal VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255) NOT NULL,
    PLZ VARCHAR(10) NOT NULL,
    Ort VARCHAR(255) NOT NULL,
    Kanton VARCHAR(2) NOT NULL,
    PRIMARY KEY (Datum, Zeit)
);

-- Aufgabe 03
INSERT INTO Event (Datum, Zeit, Bezeichnung, Kuenstler, Lokal, Adresse, PLZ, Ort, Kanton) VALUES 
('2023-06-30', '18:00', 'Athletissima 2023', 'Stade Olympique', 'Stade Olympique', '1018', 'Lausanne', 'VD'),
('2023-08-31', '19:00', 'Weltklasse Zürich 2023', 'Stadion Letzigrund', 'Stadion Letzigrund', 'Badenerstrasse 500', '8048', 'Zürich', 'ZH'),
('2023-12-08', '19:30', 'Zirkusvorstellung', 'Circus Knie', 'Allmend', '6000', 'Luzern', 'LU'),
('2023-12-09', '15:00', 'Zirkusvorstellung', 'Circus Knie', 'Allmend', '6000', 'Luzern', 'LU'),
('2023-12-09', '19:30', 'Zirkusvorstellung', 'Circus Knie', 'Allmend', '6000', 'Luzern', 'LU'),
('2023-12-10', '14:30', 'Zirkusvorstellung', 'Circus Knie', 'Allmend', '6000', 'Luzern', 'LU'),
('2023-12-10', '18:00', 'Zirkusvorstellung', 'Circus Knie', 'Allmend', '6000', 'Luzern', 'LU');