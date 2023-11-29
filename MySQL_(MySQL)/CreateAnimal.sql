CREATE TABLE IF NOT EXISTS Life.Animal (
    org_id INT NOT NULL AUTO_INCREMENT,
    food_type VARCHAR(20),
    PRIMARY KEY(org_id),
    FOREIGN KEY(org_id) REFERENCES Life.Organism(org_id)
);
