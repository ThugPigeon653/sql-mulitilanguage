CREATE OR REPLACE FUNCTION PrefixColourFunction()
RETURNS TRIGGER AS
$$
BEGIN
    NEW.colour := 'rgb_' || NEW.colour;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER PrefixColourTrigger
BEFORE INSERT ON Organism
FOR EACH ROW
EXECUTE FUNCTION PrefixColourFunction();
