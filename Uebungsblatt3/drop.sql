DROP TABLE ProfessorTab;
DROP TABLE FakultaetTab;
DROP TABLE StudiengangTab;
DROP TABLE StudierenderTab;
DROP TABLE VorlesungTab;
DROP TABLE PruefungsergebnisTab;

DROP TYPE PruefungsergebnisT force;
DROP TYPE VorlesungT force;
DROP TYPE StudierenderT force;
DROP TYPE StudiengangT force;
DROP TYPE FakultaetT force;
DROP TYPE ProfessorenVA force;
DROP TYPE ProfessorT force;
DROP TYPE PersonT force;
DROP TYPE BODY StudierenderT;

COMMIT;
