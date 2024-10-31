ALTER TABLE pers
ADD accountname VARCHAR(255);

UPDATE pers
SET accountname = 'DBSYS120'
WHERE pnr = 123;


CREATE OR REPLACE VIEW myself AS
SELECT *
FROM pers
WHERE accountname = USER;


CREATE OR REPLACE VIEW mypers AS
SELECT *
FROM pers
WHERE vnr = (SELECT pnr FROM pers WHERE accountname = USER);


GRANT SELECT ON myself TO PUBLIC;
GRANT SELECT ON mypers TO PUBLIC;


GRANT UPDATE (name, jahrg, eindat, beruf) ON myself TO PUBLIC;
GRANT UPDATE (gehalt, anr, vnr) ON mypers TO PUBLIC;


SELECT * FROM myself;
SELECT * FROM mypers;


-- Warum funktioniert das immer noch? --> Vermutlich weil Revoke command nicht richtig ausgeführt wurde
UPDATE myself SET gehalt = gehalt + 1000 WHERE pnr = 123;



COMMIT;