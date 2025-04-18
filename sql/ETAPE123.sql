CREATE TABLE midterm_velos (
    numero INT PRIMARY KEY,
    type VARCHAR(20) CHECK (type IN ('mecanique', 'electrique')),
    date_mise_en_service DATE
);

CREATE TABLE midterm_abonnes (
    id_abonne SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE,
    email VARCHAR(100)
);

CREATE TABLE midterm_identifications (
    id_identification SERIAL PRIMARY KEY,
    id_abonne INT REFERENCES midterm_abonnes(id_abonne),
    type_identification VARCHAR(30) CHECK (type_identification IN ('code', 'navigo', 'carte_magnetique', 'smartphone')),
    valeur VARCHAR(50)
);

CREATE TABLE midterm_stations (
    numero_station INT PRIMARY KEY,
    nom VARCHAR(100),
    nb_places INT
);

CREATE TABLE midterm_emprunts (
    numero_trajet SERIAL PRIMARY KEY,
    numero_velo INT REFERENCES midterm_velos(numero),
    id_abonne INT REFERENCES midterm_abonnes(id_abonne),
    date_heure_depart TIMESTAMP,
    station_depart INT REFERENCES midterm_stations(numero_station),
    date_heure_retour TIMESTAMP,
    station_retour INT REFERENCES midterm_stations(numero_station)
);
