/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.40 AND weight_kg <= 17.30;

-- first transaction
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- second transaction
BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';

COMMIT;

SELECT * FROM animals;

-- third transaction
BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;

-- fourth transaction

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT del2022;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT del2022;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;

-- other queries
SELECT COUNT(*) FROM animals;

SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) AS max_esc FROM animals GROUP BY neutered;

SELECT species, 
    MIN(weight_kg) AS min_weight, 
    MAX(weight_kg) AS max_weight
FROM animals GROUP BY species;

SELECT species,
    AVG(escape_attempts) as average_escape
    FROM animals
    WHERE date_of_birth BETWEEN '1990-01-01' AND '2022-12-31'
    GROUP BY species;

SELECT 
    owners.full_name,
    animals.name animals
    FROM 
        animals
            JOIN 
                owners 
            ON 
                animals.owner_id = owners.id  
            WHERE 
                owners.full_name = 'Melody Pond';

SELECT 
    species.name type,
    animals.name animal
    FROM 
        animals
            JOIN 
                species 
            ON 
                animals.species_id = species.id
            WHERE 
                species.name = 'Pokemon';

SELECT 
    animals.name animal, 
    owners.full_name owner
    FROM 
        animals
            JOIN 
                owners 
            ON 
                animals.owner_id = owners.id;

SELECT 
    species.name specie,
        COUNT(animals.name) number
            FROM 
                animals
                JOIN 
                    species 
                ON 
                    animals.species_id = species.id
                GROUP BY 
                    species.name;

SELECT 
    animals.name animal
        FROM animals
            JOIN 
                owners 
            ON 
                animals.owner_id = owners.id
            JOIN 
                species 
            ON 
                species.id = animals.species_id
            WHERE 
                owners.full_name = 'Jennifer Orwell'
            AND 
                species.name = 'Digimon';

SELECT 
    animals.name animal
        FROM 
            animals
                JOIN 
                    owners 
                ON 
                    animals.owner_id = owners.id
                WHERE 
                    owners.full_name = 'Dean Winchester'
                 AND 
                    animals.escape_attempts = 0;

SELECT 
    owners.full_name
    owners, COUNT(animals.name)
        FROM 
            owners
                JOIN 
                    animals 
                ON 
                    animals.owner_id = owners.id
        GROUP BY 
            owners.full_name
        ORDER BY
            COUNT(animals.name)
        DESC LIMIT 1;