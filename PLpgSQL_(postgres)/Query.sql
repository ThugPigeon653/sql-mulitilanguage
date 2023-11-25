DO $$ 
DECLARE
    v_species Organism.species%TYPE;
    v_colour Organism.colour%TYPE;
    v_avg_lifespan NUMERIC;
    
    -- Declare a record to hold the result of the cursor
    r_result RECORD;

    -- Declare a cursor that fetches species and colour for Carnivores
    CURSOR c IS 
        SELECT o.species AS s, o.colour AS c
        FROM Organism o, Animal a
        WHERE o.org_id = a.org_id AND a.food_type = 'Carnivore';
BEGIN
    -- A simple query to prove that all scripts have run correctly
    RAISE NOTICE 'Carnivores: ';
    FOR r_result IN c LOOP
        RAISE NOTICE 'Species: %', r_result.s;
        RAISE NOTICE 'Colour: %', r_result.c;
        RAISE NOTICE '---------';
    END LOOP;

    -- Call the GetAverageLifespan function
    v_avg_lifespan := GetAverageLifespan();
    RAISE NOTICE 'Average lifespan: %', v_avg_lifespan;
END $$;
