UPDATE dbsys96.girokonto SET kontostand = kontostand - 500 WHERE
    name = 'A';
    
UPDATE dbsys96.girokonto SET kontostand = kontostand + 500 WHERE
    name = 'F';
    
COMMIT;