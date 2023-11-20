BEGIN
    CREATE OR REPLACE SEQUENCE Life.org_pk
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        NO CYCLE
        NO CACHE;

    CREATE TRIGGER PrefixColourTrigger
    BEFORE INSERT ON Life.Organism
    FOR EACH ROW
    BEGIN
        :NEW.colour := 'rgb_' || :NEW.colour;
    END;
    /

    CREATE PROCEDURE Life.InsertOrganism(
        avg_lifespan IN NUMBER(4,1),
        species IN VARCHAR2(20),
        colour IN VARCHAR2(20),
        food_type IN VARCHAR2(20))

        v_org_id Life.Organism.org_id%TYPE;
    AS
        v_org_id := Life.org_pk.NEXTVAL;

        INSERT INTO Life.Organism (org_id, avg_lifespan, species, colour)
        VALUES (v_org_id, avg_lifespan, species, colour);

        INSERT Life.Animal (org_id, food_type)
        VALUES (v_org_id, food_type);
    END;

    CREATE OR REPLACE FUNCTION Life.GetAverageLifespan()
    RETURN NUMBER(4,1)
    AS
        avg_lifespan Life.Organism.avg_lifespan%TYPE;
    BEGIN
        SELECT AVG(avg_lifespan) INTO avg_lifespan
        FROM Life.Organism;

        RETURN avg_lifespan;
    END;
    /

END;
/