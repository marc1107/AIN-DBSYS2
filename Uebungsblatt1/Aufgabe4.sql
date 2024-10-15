SELECT 
    NVL(Kunde.Age, 0) AS "Age Kunde",
    SUM(CASE WHEN Produkt.Produktgruppe = 'Elektronik' THEN 1 ELSE 0 END) AS "Elektronik_ANZAHL",
    SUM(CASE WHEN Produkt.Produktgruppe = 'Haushalt' THEN 1 ELSE 0 END) AS "Haushalt_ANZAHL",
    SUM(CASE WHEN Produkt.Produktgruppe = 'Sport' THEN 1 ELSE 0 END) AS "Sport_ANZAHL",
    SUM(CASE WHEN Produkt.Produktgruppe = 'Küche' THEN 1 ELSE 0 END) AS "Küche_ANZAHL",
    SUM(CASE WHEN Produkt.Produktgruppe = 'Garten' THEN 1 ELSE 0 END) AS "Garten_ANZAHL",
    SUM(CASE WHEN Produkt.Produktgruppe = 'Büro' THEN 1 ELSE 0 END) AS "Büro_ANZAHL"
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
    Kunde.Age
ORDER BY 
    Kunde.Age;