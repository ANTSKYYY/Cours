INSERT INTO midterm.stations (id_station, nom_station, nombre_places)
SELECT 
    id_station,
    LOWER(nom_station) AS nom_station,  -- Normalisation en minuscules
    nombre_places
FROM velib.stations
WHERE nom_station IS NOT NULL  -- Filtrer les lignes avec des noms de station non nuls
  AND id_station IS NOT NULL;   -- Filtrer les lignes avec des IDs de station non nuls
INSERT INTO midterm.clients (id_abonne, nom_abonne, date_naissance_abonne, mail_abonne)
SELECT 
    id_abonne,
    LOWER(nom_abonne) AS nom_abonne,  -- Normalisation en minuscules
    date_naissance_abonne,
    mail_abonne
FROM velib.clients
WHERE id_abonne IS NOT NULL  -- Filtrer les lignes avec des IDs d'abonné non nuls
  AND mail_abonne IS NOT NULL;  -- Filtrer les lignes avec des mails non nuls