BEGIN
    EXECUTE IMMEDIATE 'CREATE OR REPLACE SEQUENCE org_pk
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        NO CYCLE
        NO CACHE;'

    EXECUTE IMMEDIATE 'CREATE PROCEDURE InsertOrganism(
        avg_lifespan IN NUMBER(4,1),
        species IN VARCHAR2(20),
        colour IN VARCHAR2(20),
        food_type IN VARCHAR2(20))

        v_org_id Organism.org_id%TYPE;
    AS
        v_org_id := org_pk.NEXTVAL;

        INSERT INTO Organism (org_id, avg_lifespan, species, colour)
        VALUES (v_org_id, avg_lifespan, species, colour);

        INSERT Animal (org_id, food_type)
        VALUES (v_org_id, food_type);
    END;'

    EXECUTE IMMEDIATE 'CREATE OR REPLACE FUNCTION GetAverageLifespan()
    RETURN NUMBER(4,1)
    AS
        avg_lifespan Organism.avg_lifespan%TYPE;
    BEGIN
        SELECT AVG(avg_lifespan) INTO avg_lifespan
        FROM Organism;

        RETURN avg_lifespan;
    END;
    /'

END;
/