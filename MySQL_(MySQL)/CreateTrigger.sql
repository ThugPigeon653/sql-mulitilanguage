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
