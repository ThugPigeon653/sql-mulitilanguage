BEGIN TRANSACTION;

    DECLARE @org_id INT;

    SET @org_id=NEXT VALUE FOR Life.org_pk;
    Print(@org_id)

    -- This is a regular insertion, which requires two steps, making it error-prone
    INSERT INTO Life.Organism(
        org_id,
        avg_lifespan,
        species,
        colour)VALUES(
        @org_id,
        20,
        "Felis catus",
        "0,0,0");
    PRINT(@org_id)
    INSERT INTO Life.Animal(
        org_id,
        food_type)
    VALUES(
        @org_id,
        "Carnivore");

    -- Running a procedure makes the above logic re-usable, so minimal code is required here, reducing the chance of mistakes
    EXEC Life.InsertOrganism @avg_lifespan = 15.5, @species = 'Morelia viridis', @colour = '0,255,0', @food_type = "Carnivore";

    SET @org_id=NEXT VALUE FOR Life.org_pk;
    Print(@org_id)
    INSERT INTO Life.Organism(
        org_id,
        avg_lifespan,
        species,
        colour)
    VALUES(
        @org_id,
        2,
        "Zea mays",
        "0,200,200"
    );
    PRINT(@org_id)
    INSERT INTO Life.Plant(
        org_id,
        chlorophyll_production)
    VALUES(
        @org_id,
        3.2
    );

COMMIT;
