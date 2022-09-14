/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              INT GENERATED ALWAYS AS IDENTITY,
    name            varchar(250),
    date_of_birth   DATE,
    escape_attempts INT,
    neutered        BIT,
    weight_kg       DECIMAL(4,2),
    PRIMARY KEY(id)
);