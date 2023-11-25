DO $$ 
BEGIN
    CREATE TABLE Organism (
        org_id SERIAL PRIMARY KEY,
        avg_lifespan NUMERIC(4,1),
        species VARCHAR(20),
        colour VARCHAR(20)
    );

    CREATE TABLE Animal (
        org_id INTEGER PRIMARY KEY,
        food_type VARCHAR(20),
        FOREIGN KEY (org_id) REFERENCES Organism (org_id)
    );

    CREATE TABLE Plant (
        org_id INTEGER PRIMARY KEY,
        chlorophyll_production NUMERIC,
        FOREIGN KEY (org_id) REFERENCES Organism (org_id)
    );
END $$;