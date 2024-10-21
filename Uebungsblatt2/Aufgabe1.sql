CREATE OR REPLACE VIEW myself AS
SELECT *
FROM pers
WHERE accountname = USER;


CREATE OR REPLACE VIEW mypers AS
SELECT *
FROM pers
WHERE vnr = (SELECT pnr FROM pers WHERE accountname = USER);


GRANT SELECT ON myself TO dbsys96;
GRANT SELECT ON myself TO dbsys01;
GRANT SELECT ON myself TO dbsys02;
GRANT SELECT ON myself TO dbsys03;
GRANT SELECT ON myself TO dbsys04;


GRANT SELECT, UPDATE (name, jahrg, eindat, beruf) ON myself TO dbsys96;
GRANT SELECT, UPDATE (name, jahrg, eindat, beruf) ON myself TO dbsys01;
GRANT SELECT, UPDATE (name, jahrg, eindat, beruf) ON myself TO dbsys02;
GRANT SELECT, UPDATE (name, jahrg, eindat, beruf) ON myself TO dbsys03;
GRANT SELECT, UPDATE (name, jahrg, eindat, beruf) ON myself TO dbsys04;


GRANT UPDATE (gehalt, anr, vnr) ON mypers TO dbsys96;
GRANT UPDATE (gehalt, anr, vnr) ON mypers TO dbsys01;
GRANT UPDATE (gehalt, anr, vnr) ON mypers TO dbsys02;
GRANT UPDATE (gehalt, anr, vnr) ON mypers TO dbsys03;
GRANT UPDATE (gehalt, anr, vnr) ON mypers TO dbsys04;


ALTER SESSION SET CURRENT_SCHEMA = dbsys96;


SELECT * FROM myself;
SELECT * FROM mypers;


--UPDATE myself SET gehalt = gehalt + 1000 WHERE pnr = 123;
