DO $$ 
DECLARE 
    v_org_id INTEGER;
BEGIN
    v_org_id := NEXTVAL('org_pk');

    INSERT INTO Organism (
        org_id,
        avg_lifespan,
        species,
        colour
    ) VALUES (
        v_org_id,
        20,
        'Felis catus',
        '0,0,0'
    );

    INSERT INTO Animal (
        org_id,
        food_type
    ) VALUES (
        v_org_id,
        'Carnivore'
    );

    PERFORM InsertOrganism(15.5, 'Morelia viridis', '0,255,0', 'Carnivore');

    v_org_id := NEXTVAL('org_pk');

    INSERT INTO Organism (
        org_id,
        avg_lifespan,
        species,
        colour
    ) VALUES (
        v_org_id,
        2,
        'Zea mays',
        '0,200,200'
    );

    INSERT INTO Plant (
        org_id,
        chlorophyll_production
    ) VALUES (
        v_org_id,
        3.2
    );

END $$;