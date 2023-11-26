DO $$ 
DECLARE
    v_species Organism.species%TYPE;
    v_colour Organism.colour%TYPE;
    v_avg_lifespan NUMERIC;

    -- Declare a record to hold the result of the cursor
    r_result RECORD;

BEGIN
    -- Declare a cursor that fetches species and colour for Carnivores
    FOR r_result IN 
        SELECT o.species AS s, o.colour AS c
        FROM Organism o, Animal a
        WHERE o.org_id = a.org_id AND a.food_type = 'Carnivore'
    LOOP
        -- A simple query to prove that all scripts have run correctly
        RAISE NOTICE 'Carnivores: ';
        RAISE NOTICE 'Species: %', r_result.s;
        RAISE NOTICE 'Colour: %', r_result.c;
        RAISE NOTICE '---------';
    END LOOP;

    -- Call the GetAverageLifespan function
    SELECT GetAverageLifespan() INTO v_avg_lifespan;
    RAISE NOTICE 'Average lifespan: %', v_avg_lifespan;
END $$;