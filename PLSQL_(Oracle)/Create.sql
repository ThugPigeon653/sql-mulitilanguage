BEGIN

EXECUTE IMMEDIATE 'CREATE Table Organism(
    org_id NUMBER,
    avg_lifespan NUMBER(4,1),
    species VARCHAR2(20),
    colour VARCHAR2(20),
    PRIMARY KEY(org_id)
)';

EXECUTE IMMEDIATE 'CREATE Table Animal(
    org_id NUMBER,
    food_type VARCHAR2(20),
    PRIMARY KEY(org_id),
    FOREIGN KEY(org_id) REFERENCES Organism(org_id)
)';

EXECUTE IMMEDIATE 'CREATE Table Plant(
    org_id NUMBER,
    chlorophyll_production NUMBER,
    PRIMARY KEY(org_id),
    FOREIGN KEY(org_id) REFERENCES Organism(org_id)
)';
END;
/
