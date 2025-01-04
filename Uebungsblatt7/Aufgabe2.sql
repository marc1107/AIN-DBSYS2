-- original
SELECT p.anr, min(p.gehalt), max(p.gehalt)
FROM Pers p INNER JOIN Abt a ON p.anr = a.anr
WHERE p.beruf = 'Programmierer'
AND p.name = 'Junghans'
AND a.ort = 'Erlangen'
GROUP BY p.anr
ORDER BY p.anr;

-- a) Index auf Attribut beruf
CREATE INDEX idx_beruf ON Pers(beruf);

-- b) Original Query markieren und F10 oder in Toolbar 2. neben Play Symbol (Explain Plan) klicken

-- c) Kann bei Queries die nicht auf den Beruf prüfen langsamer werden:
SELECT * FROM Pers WHERE gehalt > 65000;

