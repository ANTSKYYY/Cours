CREATE VIEW v_encours AS
SELECT
    velos.id_velo AS numero_velo,
    emprunts.id_emprunt AS numero_trajet,
    ROUND((strftime('%s', 'now') - strftime('%s', emprunts.date_heure_depart)) / 60.0) AS duree_trajet,
    abonnes.nom_abonne AS nom,
    abonnes.prenom_abonne AS prenom,
    abonnes.date_naissance_abonne AS date_naissance,
    stations.id_station AS numero_station_depart,
    stations.nom_station AS nom_station_depart
FROM
    midterm_.emprunts AS emprunts
JOIN midterm_.velos AS velos ON emprunts.id_velo = velos.id_velo
JOIN midterm_.abonnes AS abonnes ON emprunts.id_abonne = abonnes.id_abonne
JOIN midterm_.stations AS stations ON emprunts.station_depart = stations.id_station
WHERE
    emprunts.date_heure_arrivee IS NULL;

-- Vue des statistiques d’utilisation par abonné (v_stats_abo)
CREATE VIEW v_stats_abo AS
SELECT
    abonnes.nom_abonne AS nom,
    abonnes.prenom_abonne AS prenom,
    COUNT(emprunts.id_emprunt) AS nb_trajets,
    ROUND(SUM((strftime('%s', emprunts.date_heure_arrivee) - strftime('%s', emprunts.date_heure_depart)) / 60.0)) AS duree_totale,
    COUNT(CASE WHEN (strftime('%s', emprunts.date_heure_arrivee) - strftime('%s', emprunts.date_heure_depart)) / 60.0 > 60 THEN 1 END) AS nb_trajets_longs
FROM
    midterm_.emprunts AS emprunts
JOIN midterm_.abonnes AS abonnes ON emprunts.id_abonne = abonnes.id_abonne
WHERE
    emprunts.date_heure_arrivee IS NOT NULL
GROUP BY
    abonnes.id_abonne;