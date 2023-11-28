 CREATE PROCEDURE Life.InsertOrganism
        @avg_lifespan DECIMAL(4,1),
        @species VARCHAR(20),
        @colour VARCHAR(20),
        @food_type VARCHAR(20)
    AS
    BEGIN
        DECLARE @org_id INT;

        -- Generate the next value for the org_pk sequence
        SET @org_id = NEXT VALUE FOR Life.org_pk;

        INSERT INTO Life.Organism (org_id, avg_lifespan, species, colour)
        VALUES (@org_id, @avg_lifespan, @species, @colour);

        INSERT INTO Life.Animal (org_id, food_type)
        VALUES (@org_id, @food_type);
    END;