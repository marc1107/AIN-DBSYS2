SELECT 
    SUM(Kunde.Age * Produkt.Preis) AS "Umsatzsumme",
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM Verkäufer.Geburtsdatum) AS "Age Verkäufer",
    Zeit.Jahr AS "Verkaufsjahr",
    Produkt.Produktgruppe AS "Produktgruppe"
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