CREATE OR REPLACE FUNCTION GetAverageLifespan() 
RETURNS NUMERIC AS
$$
DECLARE
    avg_lifespan NUMERIC(4,1);
BEGIN
    SELECT AVG(avg_lifespan) INTO avg_lifespan
    FROM Organism;

    RETURN avg_lifespan;
END;
$$
LANGUAGE plpgsql;
