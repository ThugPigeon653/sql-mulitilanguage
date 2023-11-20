DECLARE
    v_avg_lifespan Life.Organism.avg_lifespan%TYPE;
BEGIN
    -- A simple query to prove that all scripts (except 'Drop.sql' have run correctly)
    SELECT o.species, o.colour
    FROM Life.Organism AS o, Life.Animal AS a
    WHERE o.org_id=a.org_id AND a.food_type="Carnivore";

    v_avg_lifespan:=Life.GetAverageLifespan();
    dbms_output.put_line('Average lifespan: '||v_avg_lifespan);
END;
/