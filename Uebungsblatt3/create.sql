CREATE OR REPLACE TYPE PersonT AS OBJECT
(name VARCHAR2(40)) NOT FINAL;
/

CREATE OR REPLACE TYPE ProfessorT UNDER PersonT
(fachgebiet VARCHAR2(40),
buero CHAR(4)) FINAL;
/

CREATE OR REPLACE TYPE ProfessorenVA AS VARRAY(50) OF REF ProfessorT;
/

CREATE OR REPLACE TYPE FakultaetT AS OBJECT
(name VARCHAR2(20),
dekan REF ProfessorT,
professoren ProfessorenVA) FINAL;
/

CREATE OR REPLACE TYPE StudiengangT AS OBJECT
(name VARCHAR2(40),
fakultaet REF FakultaetT) FINAL;
/

CREATE OR REPLACE TYPE StudierenderT UNDER PersonT
(matrikelnummer VARCHAR(6),
studiengang REF StudiengangT,
MEMBER FUNCTION getNotenschnitt RETURN FLOAT) FINAL;
/

CREATE OR REPLACE TYPE VorlesungT AS OBJECT
(name VARCHAR2(40),
professor REF ProfessorT) FINAL;
/

CREATE TABLE ProfessorTab OF ProfessorT;

CREATE TABLE FakultaetTab OF FakultaetT
(dekan SCOPE IS ProfessorTab);

CREATE TABLE StudiengangTab OF StudiengangT
(fakultaet SCOPE IS FakultaetTab);

CREATE TABLE StudierenderTab OF StudierenderT
(studiengang SCOPE IS StudiengangTab);

CREATE TABLE VorlesungTab OF VorlesungT
(professor SCOPE IS ProfessorTab);