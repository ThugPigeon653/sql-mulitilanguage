BEGIN TRANSACTION
    -- A simple query to prove that all scripts (except 'Drop.sql' have run correctly)
    SELECT o.species, o.colour
    FROM Life.Organism AS o, Life.Animal AS a
    WHERE o.org_id=a.org_id AND a.food_type="Carnivore";

    -- Proving the functionality of the FUNCTION (see 'Setup.sql')
    DECLARE @averageLifespan DECIMAL(4,1);
    SET @averageLifespan = Life.GetAverageLifespan();
    SELECT 'Average Lifespan (all organisms): ', @averageLifespan AS 'AverageLifespan';
COMMIT;