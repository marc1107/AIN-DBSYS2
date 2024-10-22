drop table pers;
drop table abt;

/* DDL fuer Oracle */

CREATE TABLE abt
( anr               char(3) PRIMARY KEY,
  aname             varchar2(20) NOT NULL,
  ort               varchar2(20) NOT NULL );

CREATE TABLE pers
( pnr               integer NOT NULL,
  name              varchar2(20) NOT NULL,
  jahrg             integer,
  eindat            date,
  gehalt            integer NOT NULL,
  beruf             varchar2(20),
  anr               char(3) NOT NULL,
  vnr               integer,
  CONSTRAINT pers_pk PRIMARY KEY(pnr),
  CONSTRAINT pers_fk1 FOREIGN KEY (anr) REFERENCES abt(anr),
  CONSTRAINT pers_fk2 FOREIGN KEY (vnr) REFERENCES pers(pnr),
  CONSTRAINT persGehalt CHECK (gehalt > 0),
  CONSTRAINT persjahrgang CHECK (jahrg > 1900 AND jahrg < 2100)
);


/* DML */

INSERT INTO abt(anr, aname, ort) VALUES ('K51', 'Entwicklung', 'Erlangen');
INSERT INTO abt(anr, aname, ort) VALUES ('K53', 'Buchhaltung', 'Nuernberg');
INSERT INTO abt(anr, aname, ort) VALUES ('K55', 'Personal',    'Nuernberg');

INSERT INTO pers VALUES
(123, 'Mueller', 1958, TO_DATE('01.09.1980', 'DD.MM.YYYY'), 68000, 'Programmierer', 'K51', NULL );

INSERT INTO pers VALUES
(406, 'Coy', 1950, TO_DATE('01.03.1986', 'DD.MM.YYYY'), 80000, 'Kaufmann', 'K55', 123);

INSERT INTO pers VALUES
(829, 'Schmidt', 1960, TO_DATE('01.06.1990', 'DD.MM.YYYY'), 74000, 'Kaufmann', 'K53', 123);

INSERT INTO pers VALUES
(874, 'Abel', NULL, TO_DATE('01.05.1994', 'DD.MM.YYYY'), 62000, 'Software Entwickler', 'K55', 829); 

INSERT INTO pers VALUES
(503, 'Junghans', 1975, NULL, 55000, 'Programmierer', 'K51', 123);

commit;