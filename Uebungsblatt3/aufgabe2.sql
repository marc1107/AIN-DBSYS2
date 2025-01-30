SELECT * FROM pruefungsergebnistab;

-- a) Ermitteln Sie die Namen aller Studierenderen die in Datenbanksysteme eine Note besser als 2.0 erzielt haben.
SELECT DISTINCT p.studierender.name, p.note FROM PruefungsergebnisTab p
    WHERE p.vorlesung.name = 'Datenbanksysteme'
    AND p.note < 2.0;
  
-- b) Ermitteln Sie die Namen der Studierenderen derjenigen Fakultät, deren Dekan Langweg heisst.  
SELECT s.name
    FROM Studierendertab s
    WHERE s.studiengang.fakultaet.dekan.name = 'Langweg';
    
-- c) Ermitteln Sie die Namen der Professoren der Fakultät Informatik.
SELECT p.column_value.name
    FROM TABLE (SELECT f.professoren FROM FakultaetTab f WHERE f.name = 'Informatik') p;