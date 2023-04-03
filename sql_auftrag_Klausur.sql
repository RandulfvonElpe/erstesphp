SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Erstellen der Datenbank `sql_auftrag_innodb`
-- !!!! innodb !!!!
--

CREATE OR
REPLACE DATABASE `sql_auftrag_klausur`;

--
-- Erstellte Datenbank auswählen
--
USE `sql_auftrag_klausur`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden`
--
CREATE TABLE kunden (
 idKu INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
 KuFirma VARCHAR(50) NULL,
 KuGeschlecht ENUM('m', 'w') NULL,
 KuName VARCHAR(50) NULL,
 KuVorname VARCHAR(50) NULL,
 KuStrasse VARCHAR(50) NULL,
 KuHNr CHAR(10) NULL,
 KuPLZ CHAR(5) NULL,
 KuOrt VARCHAR(50) NULL,
 KuGebDatum DATE NULL,
 KuVorwahl CHAR(8) NULL,
 KuTel VARCHAR(20) NULL
) ENGINE = innodb;

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--
CREATE TABLE mitarbeiter (
 idMA INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
 MAName VARCHAR(50) NULL,
 MAVorname VARCHAR(50) NULL,
 MAGebDatum DATE NULL
) ENGINE = innodb;

--
-- Tabellenstruktur für Tabelle `auftraege`
--
CREATE OR REPLACE TABLE auftraege (
 idAuftrag INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
 idKu INT UNSIGNED NOT NULL,
 idMA INT UNSIGNED NOT NULL,
 AuftrNr VARCHAR(10) NULL,
 DatumAuftr DATE NULL,
 DatumLieferung DATE NULL,
 DatumRechnung DATE NULL,
 DatumMahnung DATE NULL,
 DatumZahlung DATE NULL, KEY idKu_idx(idKu), KEY idMA_idx(idMA)
) ENGINE=innodb;

# Fremdschlüsselbedingungen für Tabelle 'auftraege'
ALTER TABLE auftraege ADD CONSTRAINT idKu_FK FOREIGN KEY (idKu) REFERENCES kunden(idKu) ON
DELETE RESTRICT ON
UPDATE RESTRICT, ADD CONSTRAINT idMA_FK FOREIGN KEY (idMA) REFERENCES mitarbeiter(idMA) ON
DELETE RESTRICT ON
UPDATE RESTRICT;

#######################################################################
# Stammdaten

# Tabele 'kunden'
INSERT INTO kunden 
(idKu, KuFirma, KuGeschlecht, KuName, KuVorname, KuStrasse, 
 KuHNr, KuPLZ, KuOrt, KuGebDatum, KuVorwahl, KuTel) VALUES
(1, '', 'w', 'Schade', 'Christiane', 'Lange Str.', '234', 
 '06108', 'Halle', '1970-07-11', '0345', '88147'),
(2, '', 'm', 'Ohde', 'Rainer', 'Bahnhofsstr.', 
 '13', '06116', 'Halle', '1981-10-03', '0345', '33895'),
(3, 'Bau GmbH', 'm', 'Augustin', 'Detlef', 'Ringstr.', 
 '58', '06114', 'Halle', '1959-05-17', '0345', '44755'),
(4, 'Systemhaus Halle GmbH', 'm', 'Kramer', 'Harry', 'Lange Str.', 
 '105', '06112', 'Halle', '1976-11-15', '0345', '22454'),
(5, '', 'm', 'Timm', 'Volker', 'Kirchgasse', 
 '7', '06108', 'Halle', '1981-09-30', '0345', '65544');

# Tabelle 'mitarbeiter'
INSERT INTO mitarbeiter 
(idMA, MAName, MAVorname, MAGebDatum) VALUES
(1, 'Lange', 'Stefan', '1969-02-15'),
(2, 'Kurz', 'Anabell', '1974-06-30'),
(3, 'Winter', 'Carmen', '1985-10-03');



#########################################################################
# Bewegungsdaten

# Auftrag 1: Auftrag erfassen
INSERT INTO auftraege
(idKu, idMA, AuftrNr, DatumAuftr, DatumLieferung) VALUES
(3, 2, '1001', '2019-06-03', '2019-07-03');


# Auftrag 2: Auftrag erfassen
INSERT INTO auftraege
(idKu, idMA, AuftrNr, DatumAuftr) VALUES
(2, 1, '1002', '2019-06-27');

# Auftrag 3: Auftrag erfassen
INSERT INTO auftraege
(idKu, idMA, AuftrNr, DatumAuftr) VALUES
(4, 3, '1003', '2019-07-07');
