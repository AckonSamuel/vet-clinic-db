/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              INT GENERATED ALWAYS AS IDENTITY,
    name            varchar(250),
    date_of_birth   DATE,
    escape_attempts INT,
    neutered        BOOLEAN,
    weight_kg       DECIMAL(4,2),
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);

CREATE TABLE owners (
    id       INT GENERATED ALWAYS AS IDENTITY,
    full_name        VARCHAR(100),
    age      INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id       INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD  owner_id  INT REFERENCES owners(id);

data=# CREATE TABLE vets(
data(# id               INT GENERATED ALWAYS AS IDENTITY,
data(# name             VARCHAR(100),
data(# age              INT,
data(# date_of_graduation       DATE,
data(# PRIMARY KEY(id)
data(# );

