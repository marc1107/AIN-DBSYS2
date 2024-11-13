SELECT * FROM pruefungsergebnistab;

-- a)
SELECT s.matrikelnummer, s.name, p.note FROM PruefungsergebnisTab p
    JOIN StudierenderTab s ON p.student = REF(s)
    JOIN VorlesungTab v ON p.vorlesung = REF(v)
    WHERE v.name = 'Datenbanksysteme'
    AND p.note < 2.0;
  
-- b)
SELECT s.name AS student_name, sg.name as studiengang FROM StudierenderTab s
    JOIN StudiengangTab sg ON s.studiengang = REF(sg)
    JOIN FakultaetTab f ON sg.fakultaet = REF(f)
    JOIN ProfessorTab p ON f.dekan = REF(p)
    WHERE p.name = 'Langweg';
    
-- c)    
SELECT *
    FROM TABLE (SELECT f.professoren FROM FakultaetTab f WHERE f.name = 'Informatik');