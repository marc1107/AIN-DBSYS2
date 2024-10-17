SELECT 
    SUM(Produkt.Preis) AS "Umsatzsumme",
    NVL(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM Verkäufer.Geburtsdatum), -1) AS "Age Verkäufer",
    NVL(Zeit.Jahr, -1) AS "Verkaufsjahr",
    NVL(Produkt.Produktgruppe, -1) AS "Produktgruppe"
FROM 
    Verkauf
JOIN 
    Verkäufer ON Verkauf.VerkäuferVerkäufer_ID = Verkäufer.Verkäufer_ID
JOIN 
    Produkt ON Verkauf.ProduktProdukt_ID = Produkt.Produkt_ID
JOIN 
    Zeit ON Verkauf.ZeitZeit_ID = Zeit.Zeit_ID
JOIN
    Kunde ON Verkauf.KundeKunde_ID = Kunde.Kunde_ID
WHERE 
    Zeit.Jahr >= 2020
GROUP BY 
    CUBE(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM Verkäufer.Geburtsdatum), Zeit.Jahr, Produkt.Produktgruppe)
ORDER BY 
    "Age Verkäufer", "Verkaufsjahr", "Produktgruppe";