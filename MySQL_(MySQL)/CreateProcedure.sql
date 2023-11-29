 CREATE PROCEDURE Life.InsertOrganism
        @avg_lifespan DECIMAL(4,1),
        @species VARCHAR(20),
        @colour VARCHAR(20),
        @food_type VARCHAR(20)
    AS
    BEGIN
        DECLARE @org_id INT;

        INSERT INTO Life.Organism (avg_lifespan, species, colour)
        VALUES ( @avg_lifespan, @species, @colour);

        INSERT INTO Life.Animal (food_type)
        VALUES (@food_type);
    END;