CREATE OR REPLACE FUNCTION InsertOrganism(
    avg_lifespan NUMERIC,
    species VARCHAR,
    colour VARCHAR,
    food_type VARCHAR
) RETURNS VOID AS
$$
DECLARE
    v_org_id INTEGER;
BEGIN
    -- Assuming org_pk is a sequence
    SELECT NEXTVAL('org_pk') INTO v_org_id;

    -- Insert into Organism table
    INSERT INTO Organism (org_id, avg_lifespan, species, colour)
    VALUES (v_org_id, avg_lifespan, species, colour);

    -- Insert into Animal table
    INSERT INTO Animal (org_id, food_type)
    VALUES (v_org_id, food_type);
END;
$$
LANGUAGE plpgsql;
