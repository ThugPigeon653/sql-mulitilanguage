CREATE OR REPLACE FUNCTION GetAverageLifespan() 
RETURNS NUMERIC AS
$$
DECLARE
    avg_lifespan_value NUMERIC(4,1);
BEGIN
    SELECT AVG(avg_lifespan) INTO avg_lifespan_value
    FROM Organism;

    RETURN avg_lifespan_value;
END;
$$
LANGUAGE plpgsql;
