/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, TRUE, 08.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11.00);

-- More insertions
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, FALSE, -11.00);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, TRUE, -05.70);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, TRUE, -45.00);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.40);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, TRUE, 17.00);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, TRUE, 22.00);

INSERT INTO owners(name, age)
    VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species(name)
    VALUES
    ('Pokemon'),
    ('Digimon');

UPDATE animals
    SET 
        species_id = (
        SELECT 
            species.id 
        FROM 
            species 
        WHERE 
            species.name = 'Digimon'
        )
    WHERE 
       animals.name LIKE '%mon';

UPDATE animals
    SET 
        species_id = (
            SELECT 
                species.id 
            FROM 
                species 
            WHERE 
                species.name = 'Pokemon'
        )
    WHERE 
       animals.name NOT LIKE '%mon';
    
UPDATE animals 
    SET 
        owner_id = (
            SELECT 
                owners.id
            FROM 
                owners
            WHERE 
                owners.full_name = 'Sam Smith'
        )
    WHERE 
       animals.name = 'Agumon';

UPDATE animals
    SET 
        owner_id = (
            SELECT 
                owners.id
            FROM 
                owners
            WHERE 
                owners.full_name = 'Jennifer Orwell'
        )
    WHERE 
        animals.name = 'Gabumon' 
    OR  animals.name = 'Pikachu';

 UPDATE animals
    SET 
        owner_id = (
            SELECT 
                owners.id
            FROM 
                owners
            WHERE 
                owners.full_name = 'Bob'
        )
    WHERE 
        animals.name = 'Devimon' 
    OR  animals.name = 'Plantmon';

 UPDATE animals
    SET 
        owner_id = (
            SELECT 
                owners.id
            FROM 
                owners
            WHERE 
                owners.full_name = 'Melody Pond'
        )
    WHERE 
        animals.name = 'Charmander' 
     OR animals.name = 'Squirtle'
     OR animals.name = 'Blossom';

 UPDATE animals
    SET 
        owner_id = (
            SELECT 
                owners.id
            FROM 
                owners
            WHERE 
                owners.full_name = 'Dean Winchester'
        )
    WHERE 
        animals.name = 'Angemon' 
    OR  animals.name = 'Boarmon';

    