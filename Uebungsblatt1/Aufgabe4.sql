SELECT "AgeKunde",
       NVL(Elektronik_ANZAHL, 0) AS Elektronik_ANZAHL,
       NVL(Haushalt_ANZAHL, 0) AS Haushalt_ANZAHL,
       NVL(Sport_ANZAHL, 0) AS Sport_ANZAHL,
       NVL(Küche_ANZAHL, 0) AS Küche_ANZAHL,
       NVL(Garten_ANZAHL, 0) AS Garten_ANZAHL,
       NVL(Büro_ANZAHL, 0) AS Büro_ANZAHL
FROM (
    SELECT 
        NVL("AgeKunde", 0) AS "AgeKunde",
        "Produktgruppe",
        "Haeufigkeit"
    FROM 
        Verkauf_2DC
) 
PIVOT (
    SUM("Haeufigkeit") 
    FOR "Produktgruppe" IN ('Elektronik' AS Elektronik_ANZAHL, 
                          'Haushalt' AS Haushalt_ANZAHL, 
                          'Sport' AS Sport_ANZAHL, 
                          'Küche' AS Küche_ANZAHL, 
                          'Garten' AS Garten_ANZAHL, 
                          'Büro' AS Büro_ANZAHL)
)
ORDER BY "AgeKunde";
