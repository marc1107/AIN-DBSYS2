-- a) PrüfungsergebnisT als Typ
CREATE OR REPLACE TYPE PruefungsergebnisT AS OBJECT
(
    pruefungsDatum DATE,
    vorlesung      REF VorlesungT,
    student        REF StudierenderT,
    note           FLOAT
);
/

-- b) Tabelle mit Constraint für Prüfungsergebis
CREATE TABLE PruefungsergebnisTab OF PruefungsergebnisT (
    CONSTRAINT check_note CHECK (note IN (1.0, 1.3, 1.7, 2.0, 2.3, 2.7, 3.0, 3.3, 3.7, 4.0, 5.0))
);

-- c)
-- 4 Professoren
INSERT INTO ProfessorTab VALUES (
    ProfessorT('Langweg', 'Informatik', 'O108')
);

INSERT INTO ProfessorTab VALUES (
    ProfessorT('Eck', 'Informatik', 'B102')
);

INSERT INTO ProfessorTab VALUES (
    ProfessorT('Drachenfels', 'Informatik', 'A101')
);

INSERT INTO ProfessorTab VALUES (
    ProfessorT('Musterarchitekt', 'Architektur', 'C303')
);

-- 2 Fakultaeten
INSERT INTO FakultaetTab VALUES (
    FakultaetT('Informatik',
        (SELECT REF(tab) FROM ProfessorTAB tab WHERE tab.name = 'Langweg'),
        ProfessorenVA((SELECT REF(tab) FROM ProfessorTAB tab WHERE tab.name = 'Langweg'),
                                 (SELECT REF(tab) FROM ProfessorTAB tab WHERE tab.name = 'Eck'),
                                 (SELECT REF(tab) FROM ProfessorTAB tab WHERE tab.name = 'Drachenfels')
    )
));

INSERT INTO FakultaetTab VALUES (
    FakultaetT('Architektur',
        (SELECT REF(tab) FROM ProfessorTAB tab WHERE tab.name = 'Musterarchitekt'),
        ProfessorenVA((SELECT REF(tab) FROM ProfessorTAB tab WHERE tab.name = 'Musterarchitekt')
    )
));

-- 3 Vorlesungen
INSERT INTO VorlesungTab VALUES (
    VorlesungT('IT Security',
        (SELECT REF(tab) FROM ProfessorTab tab WHERE tab.name = 'Langweg')
    )
);

INSERT INTO VorlesungTab VALUES (
    VorlesungT('Datenbanksysteme',
        (SELECT REF(tab) FROM ProfessorTab tab WHERE tab.name = 'Eck')
    )
);

INSERT INTO VorlesungTab VALUES (
    VorlesungT('Programmiertechnik',
        (SELECT REF(tab) FROM ProfessorTab tab WHERE tab.name = 'Drachenfels')
    )
);

-- Studiengang AIN
INSERT INTO StudiengangTab VALUES (
    StudiengangT('Angewandte Informatik',
        (SELECT REF(f) FROM FakultaetTab f WHERE f.name = 'Informatik')
    )
);

-- Studiengang Architektur
INSERT INTO StudiengangTab VALUES (
    StudiengangT('Architektur',
        (SELECT REF(f) FROM FakultaetTab f WHERE f.name = 'Architektur')
    )
);

-- 4 Studierende
INSERT INTO StudierenderTab VALUES (
    StudierenderT('Marc Bohner', '304086',
        (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Angewandte Informatik')
    )
);

INSERT INTO StudierenderTab VALUES (
    StudierenderT('Stefan Willmann', '304087',
        (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Angewandte Informatik')
    )
);

INSERT INTO StudierenderTab VALUES (
    StudierenderT('Phil Neuburger', '304088',
        (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Angewandte Informatik')
    )
);

INSERT INTO StudierenderTab VALUES (
    StudierenderT('Niklas Schafran', '304089',
        (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Angewandte Informatik')
    )
);

INSERT INTO StudierenderTab VALUES (
    StudierenderT('Max Musterarchitekt', '304090',
        (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Architektur')
    )
);

-- 6 Pruefungsleistungen
INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-05', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'IT Security'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.matrikelnummer = '304086'),
        2.0)
);

INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-10', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'Datenbanksysteme'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.matrikelnummer = '304087'),
        1.7)
);

INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-15', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'Programmiertechnik'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.matrikelnummer = '304088'),
        3.3)
);

INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-18', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'IT Security'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.name = '304089'),
        2.3)
);

INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-12', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'Programmiertechnik'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.matrikelnummer = '304086'),
        1.3)
);

INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-19', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'Datenbanksysteme'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.matrikelnummer = '304087'),
        3.0)
);

INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-17', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'Mathe'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.matrikelnummer = '304090'),
        1.0)
);

INSERT INTO PruefungsergebnisTab VALUES (
    PruefungsergebnisT(TO_DATE('2024-02-11', 'YYYY-MM-DD'),
        (SELECT REF(v) FROM VorlesungTab v WHERE v.name = 'Malen'),
        (SELECT REF(s) FROM StudierenderTab s WHERE s.matrikelnummer = '304090'),
        2.3)
);


COMMIT;