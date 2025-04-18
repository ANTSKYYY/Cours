INSERT INTO midterm_trajets (numero_velo, id_abonne, date_heure_depart, station_depart, date_heure_retour, station_retour)
VALUES 
(25874, (SELECT id_abonne FROM midterm_abonnes WHERE nom = 'Leboeuf' AND prenom = 'Simon'), 
 '2025-04-18 11:25', 13002, '2025-04-18 11:57', 13017),

(38855, (SELECT id_abonne FROM midterm_abonnes WHERE nom = 'Chauvert' AND prenom = 'Yoshi'),
 '2025-04-18 14:05', 13002, NULL, NULL),

(31456, (SELECT id_abonne FROM midterm_abonnes WHERE nom = 'Leboeuf' AND prenom = 'Simon'),
 '2025-04-18 12:33', 13017, '2025-04-18 13:45', 13002);
