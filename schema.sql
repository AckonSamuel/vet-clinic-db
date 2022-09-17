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

           CREATE TABLE vets(
           id               INT GENERATED ALWAYS AS IDENTITY,
           name             VARCHAR(100),
           age              INT,
           date_of_graduation       DATE,
           PRIMARY KEY(id)
           );

           CREATE TABLE specializations(
           vet_id INT REFERENCES vets (id) ON UPDATE CASCADE ON DELETE CASCADE,
           species_id INT REFERENCES species (id) ON UPDATE CASCADE,
           CONSTRAINT pkey
           PRIMARY KEY(vet_id, species_id) -- explicit pk
           );

           CREATE TABLE visits(
           vet_id INT REFERENCES vets (id) ON UPDATE CASCADE ON DELETE CASCADE,
           animals_id INT REFERENCES animals (id) ON UPDATE CASCADE,
           CONSTRAINT pOkey
           PRIMARY KEY(vet_id, animals_id) -- explicit pk
           );