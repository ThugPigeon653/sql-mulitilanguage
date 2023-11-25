CREATE OR REPLACE FUNCTION GetAverageLifespan 
RETURN NUMBER IS
    avg_lifespan NUMBER(4,1);
BEGIN
    SELECT AVG(avg_lifespan) INTO avg_lifespan
    FROM Organism;

    RETURN avg_lifespan;
END;
/
