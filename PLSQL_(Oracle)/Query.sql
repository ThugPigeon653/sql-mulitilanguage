DECLARE
    v_species Organism.species%TYPE;
    v_colour Organism.colour%TYPE;
    v_avg_lifespan NUMBER;
    
    CURSOR c IS 
        SELECT o.species AS s, o.colour AS c
        FROM Organism o, Animal a
        WHERE o.org_id = a.org_id AND a.food_type = 'Carnivore';
BEGIN
    -- A simple query to prove that all scripts (except 'Drop.sql' have run correctly)
    DBMS_OUTPUT.PUT_LINE('Carnivores: ');
    FOR a IN c LOOP
        DBMS_OUTPUT.PUT_LINE('Species: ' || a.s);
        DBMS_OUTPUT.PUT_LINE('Colour: ' || a.c);
        DBMS_OUTPUT.PUT_LINE('---------');
    END LOOP;

    v_avg_lifespan := GetAverageLifespan();
    DBMS_OUTPUT.PUT_LINE('Average lifespan: ' || v_avg_lifespan);
END;
/
