CREATE TABLE Verkauf_2DC AS
SELECT 
    NVL(Kunde.Age, 0) AS "Age Kunde",
    NVL(Produkt.Produktgruppe, 'alle') AS "Produktgruppe",
    COUNT(*) AS "Häufigkeit"
FROM 
    Verkauf
JOIN 
    Kunde ON Verkauf.KundeKunde_ID = Kunde.Kunde_ID
JOIN 
    Produkt ON Verkauf.ProduktProdukt_ID = Produkt.Produkt_ID
JOIN 
    Zeit ON Verkauf.ZeitZeit_ID = Zeit.Zeit_ID
WHERE 
    Zeit.Jahr >= 2020
GROUP BY 
    CUBE(Kunde.Age, Produkt.Produktgruppe);

UPDATE Verkauf_2DC
SET "Age Kunde" = NVL("Age Kunde", 0),
    "Produktgruppe" = NVL("Produktgruppe", 'alle'),
    "Häufigkeit" = NVL("Häufigkeit", 0);