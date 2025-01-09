-- a)
-- original (ineffizient da Verwendung von NOT EXISTS)
SELECT COUNT(DISTINCT pnr)
FROM Pers p
WHERE NOT EXISTS
    (SELECT * FROM pers p2
     WHERE p.anr = p2.anr AND p.pnr != p2.pnr);

-- optimiert (wird mit Aggregation ermittelt)
SELECT COUNT(*)
FROM (
    SELECT anr
    FROM Pers
    GROUP BY anr
    HAVING COUNT(*) = 1
);


-- b)
-- original (Verwendung von NOT EXISTS)
SELECT a.aname
FROM abt a
WHERE NOT EXISTS (SELECT * FROM pers p
                    WHERE p.anr = a.anr
                    AND beruf = 'Programmierer');
                    
-- optimiert (LEFT JOIN mit Filterung auf NULL)
SELECT a.aname
FROM Abt a
LEFT JOIN Pers p ON a.anr = p.anr AND p.beruf = 'Programmierer'
WHERE p.pnr IS NULL;


-- c)
-- original (Subquery in WHERE Klausel)
SELECT COUNT(DISTINCT p.pnr)
FROM pers p
WHERE p.gehalt > (SELECT AVG(gehalt)
                    FROM pers WHERE beruf = 'Programmierer');

-- optimiert (Ohne DISTINCT)
SELECT COUNT(p.pnr)
FROM pers p
WHERE p.gehalt > (SELECT AVG(gehalt)
                    FROM pers WHERE beruf = 'Programmierer');



-- d)
-- original (ineffiziente Subquery)
SELECT p.pnr, p.name
FROM Pers p, Abt a
    WHERE p.anr = a.anr
    AND a.anr = ANY(SELECT anr FROM Abt WHERE aname = 'Personal');

-- optimiert (Verwendung von JOIN mit Filter auf Abteilungsnamen)
SELECT DISTINCT p.pnr, p.name
FROM Pers p
JOIN Abt a ON p.anr = a.anr
WHERE a.aname = 'Personal';


-- e)
-- original (Mehrfache Subqueries)
SELECT DISTINCT name
FROM Pers
WHERE name != 'Junghans'
AND beruf = ANY(SELECT beruf FROM Pers
    WHERE name = 'Junghans')
AND anr = ANY(SELECT anr FROM Pers WHERE name = 'Junghans');

-- optimiert (CTE reduziert Redundanz)
WITH Junghans AS (
    SELECT anr, beruf 
    FROM Pers 
    WHERE name = 'Junghans'
)
SELECT DISTINCT p.name 
FROM Pers p, Junghans j 
    WHERE p.name != 'Junghans' 
    AND p.anr = j.anr 
    AND p.beruf = j.beruf;
    
    
-- f)
-- original (sieht relativ gut aus?)
SELECT DISTINCT p1.name
FROM Pers p1
GROUP BY p1.name
HAVING COUNT(*) = 1;

-- optimiert (Ohne DISTINCT)
SELECT p1.name
FROM Pers p1
GROUP BY p1.name


-- g)
-- original (ineffizient durch EXISTS)
SELECT DISTINCT p.name
FROM Pers p
WHERE EXISTS (SELECT * FROM Abt a
                WHERE p.name = a.aname);
                
-- optimiert (JOIN ist effizienter als EXISTS)
SELECT DISTINCT p.name 
FROM Pers p 
JOIN Abt a ON p.name = a.aname;


