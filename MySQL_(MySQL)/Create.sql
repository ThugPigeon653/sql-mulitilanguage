START TRANSACTION;
    CREATE TABLE Life.Organism (
        org_id INT,
        avg_lifespan DECIMAL(4,1),
        species VARCHAR(20),
        colour VARCHAR(20),
        PRIMARY KEY(org_id)
    );

    CREATE TABLE Life.Animal (
        org_id INT,
        food_type VARCHAR(20),
        PRIMARY KEY(org_id),
        FOREIGN KEY(org_id) REFERENCES Life.Organism(org_id)
    );

    CREATE TABLE Life.Plant (
        org_id INT,
        chlorophyll_production DECIMAL(4,1),
        PRIMARY KEY(org_id),
        FOREIGN KEY(org_id) REFERENCES Life.Organism(org_id)
    );
COMMIT;
