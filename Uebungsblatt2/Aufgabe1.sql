ALTER TABLE pers
ADD accountname VARCHAR(255);

UPDATE pers
SET accountname = 'DBSYS96'
WHERE pnr = 123;


CREATE OR REPLACE VIEW myself AS
SELECT *
FROM pers
WHERE accountname = USER;


CREATE OR REPLACE VIEW mypers AS
SELECT *
FROM pers
WHERE vnr = (SELECT pnr FROM pers WHERE accountname = USER);


GRANT SELECT ON myself TO dbsys96;
GRANT SELECT ON mypers TO dbsys96;


GRANT UPDATE (name, jahrg, eindat, beruf) ON myself TO dbsys96;
GRANT UPDATE (gehalt, anr, vnr) ON mypers TO dbsys96;


-- Error wenn Revoke auf den eigenen User ausgeführt wird???
REVOKE UPDATE ON mypers FROM dbsys96;
REVOKE UPDATE ON myself FROM dbsys96;
REVOKE SELECT ON myself FROM dbsys96;


SELECT * FROM myself;
SELECT * FROM mypers;


-- Warum funktioniert das immer noch? --> Vermutlich weil Revoke command nicht richtig ausgeführt wurde
--UPDATE myself SET gehalt = gehalt + 1000 WHERE pnr = 123;


COMMIT;