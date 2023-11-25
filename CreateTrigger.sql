    CREATE OR REPLACE TRIGGER PrefixColourTrigger
    BEFORE INSERT ON Organism
    FOR EACH ROW
    BEGIN
        :NEW.colour := 'rgb_' || :NEW.colour;
    END;
    /