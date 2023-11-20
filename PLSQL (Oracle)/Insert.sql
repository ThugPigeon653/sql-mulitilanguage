DECLARE 
v_org_id NUMBER;
BEGIN
v_org_id:=Life.org_pk.NEXTVAL;

-- This is a regular insertion, which requires two steps, making it error-prone
INSERT NUMBERO Life.Organism(
    org_id,
    avg_lifespan,
    species,
    colour)VALUES(
    v_org_id,
    20,
    "Felis catus",
    "0,0,0");
INSERT NUMBERO Life.Animal(
    org_id,
    food_type)
VALUES(
    v_org_id,
    "Carnivore");

-- Running a procedure makes the above logic re-usable, so minimal code is required here, reducing the chance of mistakes
Life.InsertOrganism(15.5, 'Morelia viridis', '0,255,0', "Carnivore");

SET v_org_id=Life.org_pk.NEXTVAL;
INSERT NUMBERO Life.Organism(
    org_id,
    avg_lifespan,
    species,
    colour)
VALUES(
    v_org_id,
    2,
    "Zea mays",
    "0,200,200"
);
INSERT NUMBERO Life.Plant(
    org_id,
    chlorophyll_production)
VALUES(
    v_org_id,
    3.2
);

END;
/
