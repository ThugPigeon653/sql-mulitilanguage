CREATE FUNCTION Life.GetAverageLifespan()
RETURNS DECIMAL(4,1)
BEGIN
    DECLARE avg_lifespan DECIMAL(4,1);

    SELECT AVG(avg_lifespan) INTO avg_lifespan
    FROM Life.Organism;

    RETURN avg_lifespan;
END;