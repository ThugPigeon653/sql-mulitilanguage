CREATE Schema Life;
GO

CREATE Table Life.Organism(
    org_id INT,
    avg_lifespan DECIMAL(4,1),
    species VARCHAR(20),
    colour VARCHAR(20),
    PRIMARY KEY(org_id)
);

CREATE Table Life.Animal(
    org_id INT,
    food_type VARCHAR(20),
    PRIMARY KEY(org_id),
    FOREIGN KEY(org_id) REFERENCES Life.Organism(org_id)
);

CREATE Table Life.Plant(
    org_id INT,
    chlorophyll_production DECIMAL,
    PRIMARY KEY(org_id),
    FOREIGN KEY(org_id) REFERENCES Life.Organism(org_id)
);

