use fuji_flush_V2;
# affichage

# affiche toute les parties dans lequelles joue ou a joué le joueur d'id 2 :
SELECT p.id as 'N° Partie', dateDebut, nom, prenom  FROM Partie p INNER JOIN EstJoue ej ON p.id = ej.Partie_id INNER JOIN Joueur j ON j.id = ej.Joueur_id WHERE j.id = 2;

# dans la partie 2 affiche les cartes jouées et le joueur qui a joué :
SELECT Partie_id as 'N° Partie', id as 'N° Jeu', carteJoue, EstJoue_Joueur_id as 'N° Joueur'  FROM Jeu WHERE Partie_id = 2 ORDER BY id ASC;

# PB sur cette requète : malgré le 'left join' je n'ai pas de ligne 'N° Jeu = 2' avec 'Main Joueur n°3 = NULL',
# dans la partie 2 affiche tout les jeux et l'état de la main du joueur d'id 3 à chaque jeu :
SELECT j.Partie_id as 'N° Partie', j.id as 'N° Jeu', carteJoue, j.EstJoue_Joueur_id as 'N° Joueur', main as 'Main Joueur N°3' 
FROM Jeu j 
LEFT JOIN Main m 
ON j.id = m.Jeu_id and j.Partie_id = m.Jeu_Partie_id
WHERE j.Partie_id = 2 and m.EstJoue_Joueur_id = 3
ORDER BY j.id ASC;
