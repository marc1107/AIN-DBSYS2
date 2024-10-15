CREATE TABLE Zeit (
    Zeit_ID INTEGER PRIMARY KEY,
    Tag INTEGER,
    Woche INTEGER,
    Monat INTEGER,
    Quartal INTEGER,
    Jahr INTEGER
);

CREATE TABLE Produkt (
    Produkt_ID INTEGER PRIMARY KEY,
    Preis NUMBER(20, 2),
    Produktgruppe VARCHAR2(255),
    Hersteller VARCHAR2(255)
);

CREATE TABLE Kunde (
    Kunde_ID INTEGER PRIMARY KEY,
    Name VARCHAR2(255),
    Age INTEGER
);

CREATE TABLE Verkäufer (
    Verkäufer_ID INTEGER PRIMARY KEY,
    Name VARCHAR2(255),
    Fachgebiet VARCHAR2(255),
    Geburtsdatum DATE
);

CREATE TABLE Verkauf (
    Verkauf_ID INTEGER PRIMARY KEY,
    ZeitZeit_ID INTEGER,
    ProduktProdukt_ID INTEGER,
    KundeKunde_ID INTEGER,
    VerkäuferVerkäufer_ID INTEGER,
    FOREIGN KEY (ZeitZeit_ID) REFERENCES Zeit(Zeit_ID),
    FOREIGN KEY (ProduktProdukt_ID) REFERENCES Produkt(Produkt_ID),
    FOREIGN KEY (KundeKunde_ID) REFERENCES Kunde(Kunde_ID),
    FOREIGN KEY (VerkäuferVerkäufer_ID) REFERENCES Verkäufer(Verkäufer_ID)
);