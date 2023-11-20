CREATE SEQUENCE Life.org_pk
    AS INT
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;
GO

CREATE TRIGGER PrefixColourTrigger
ON Life.Organism
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE o
    SET colour = 'rgb_' + i.colour
    FROM Life.Organism o
    JOIN inserted i ON o.org_id = i.org_id;
END;
GO

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
GO

CREATE FUNCTION Life.GetAverageLifespan()
RETURNS DECIMAL(4,1)
AS
BEGIN
    DECLARE @avg_lifespan DECIMAL(4,1);
    
    SELECT @avg_lifespan = AVG(avg_lifespan)
    FROM Life.Organism;

    RETURN @avg_lifespan;
END;
GO