
CREATE TABLE IF NOT EXISTS Life.Plant (
    org_id INT NOT NULL AUTO_INCREMENT,
    chlorophyll_production DECIMAL(4,1),
    PRIMARY KEY(org_id),
    FOREIGN KEY(org_id) REFERENCES Life.Organism(org_id)
);
