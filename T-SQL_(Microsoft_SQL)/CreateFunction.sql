CREATE FUNCTION Life.GetAverageLifespan()
RETURNS DECIMAL(4,1)
AS
BEGIN
    DECLARE @avg_lifespan DECIMAL(4,1);
    
    SELECT @avg_lifespan = AVG(avg_lifespan)
    FROM Life.Organism;

    RETURN @avg_lifespan;
END;