CREATE OR REPLACE PROCEDURE InsertOrganism(
    avg_lifespan NUMBER,
    species IN VARCHAR2,
    colour IN VARCHAR2,
    food_type IN VARCHAR2
) AS
    v_org_id Organism.org_id%TYPE;
BEGIN
    v_org_id := org_pk.NEXTVAL;

    INSERT INTO Organism (org_id, avg_lifespan, species, colour)
    VALUES (v_org_id, avg_lifespan, species, colour);

    INSERT INTO Animal (org_id, food_type)
    VALUES (v_org_id, food_type);
END;
/
