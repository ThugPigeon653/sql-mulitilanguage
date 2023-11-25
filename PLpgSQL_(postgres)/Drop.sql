DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'prefixcolourtrigger') THEN
        EXECUTE 'DROP TRIGGER PrefixColourTrigger ON Organism';
    END IF;

    IF EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'getaveragelifespan') THEN
        EXECUTE 'DROP FUNCTION GetAverageLifespan()';
    END IF;

    IF EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'insertorganism') THEN
        EXECUTE 'DROP PROCEDURE InsertOrganism()';
    END IF;

    IF EXISTS (SELECT 1 FROM pg_class WHERE relname = 'org_pk') THEN
        EXECUTE 'DROP SEQUENCE org_pk';
    END IF;

    IF EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'Animal') THEN
        EXECUTE 'DROP TABLE Animal';
    END IF;

    IF EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'Plant') THEN
        EXECUTE 'DROP TABLE Plant';
    END IF;

    IF EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'Organism') THEN
        EXECUTE 'DROP TABLE Organism';
    END IF;
END $$;
