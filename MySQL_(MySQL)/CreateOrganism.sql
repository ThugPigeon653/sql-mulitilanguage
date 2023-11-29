CREATE TABLE IF NOT EXISTS Life.Organism (
    org_id INT NOT NULL AUTO_INCREMENT,
    avg_lifespan DECIMAL(4,1),
    species VARCHAR(20),
    colour VARCHAR(20),
    PRIMARY KEY(org_id)
);
