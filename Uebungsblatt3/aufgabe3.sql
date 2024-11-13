-- a)
CREATE OR REPLACE TYPE BODY StudierenderT AS
  MEMBER FUNCTION getNotenschnitt RETURN FLOAT IS
    v_notenschnitt FLOAT;
  BEGIN
    SELECT AVG(p.note)
    INTO v_notenschnitt
    FROM PruefungsergebnisTab p
    WHERE p.student.matrikelnummer = self.matrikelnummer;
    RETURN v_notenschnitt;
  END;
END;
/

-- b)
SELECT s.matrikelnummer, s.name, s.getNotenschnitt() AS notenschnitt
FROM StudierenderTab s;