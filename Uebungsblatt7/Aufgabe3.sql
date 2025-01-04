-- original
CREATE INDEX Eintrittsindex ON Pers(eindat);

SELECT UPPER(name), UPPER(beruf)
FROM pers
WHERE TO_CHAR(eindat, 'YYYY') = '1994';

-- a) Obere Query markieren und auf Explain Plan klicken --> Index wird nicht verwendet!

-- b) Folgende Query markieren und auf Explain Plan klicken --> Index wird verwendet da nicht mit TO_CHAR gearbeitet wird!
SELECT UPPER(name), UPPER(beruf)
FROM pers 
WHERE eindat BETWEEN TO_DATE('01-JAN-1994', 'DD-MON-YYYY') 
                 AND TO_DATE('31-DEC-1994', 'DD-MON-YYYY');
