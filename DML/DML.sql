use ComputerShop;

INSERT INTO Kunde (Vorname, Nachname) VALUES ('Hans', 'Muster');
INSERT INTO Kunde (Vorname, Nachname) VALUES ('Rita', 'Supergirl');
INSERT INTO Kunde (Vorname, Nachname) VALUES ('Joggeli', 'Guggisberg');

UPDATE Kunde set Vorname = 'Jonas' WHERE Vorname = 'Joggeli';

SELECT * FROM Kunde;