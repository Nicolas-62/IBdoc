use fuji_flush;
# affichage

# affiche toute les parties dans lequelles joue ou a joué le joueur d'id 2 :
SELECT * FROM Partie p INNER JOIN EstJoue ej ON p.id = ej.Partie_id INNER JOIN Joueur j ON j.id = ej.Joueur_id WHERE j.id = 2;

# dans la partie 2 affiche les cartes jouées et le joueur qui a joué :
SELECT EstJoue_Partie_id as 'N° Partie', carteJoue, EstJoue_Joueur_id as 'N° Joueur'  FROM Jeu WHERE EstJoue_Partie_id = 2 ORDER BY id ASC;



# dans la partie 2 affiche les cartes jouées et l'état de la main du joueur d'id 3 à chaque jeu :
SELECT j.EstJoue_Partie_id as 'N° Partie', j.id as 'N° Jeu', carteJoue, j.EstJoue_Joueur_id as 'N° Joueur', main as 'Main Joueur N°3' 
FROM Jeu j 
LEFT JOIN Main m 
ON j.id = m.Jeu_id 
WHERE j.EstJoue_Partie_id = 2 and m.EstJoue_Partie_id = 2 and m.EstJoue_Joueur_id = 3
ORDER BY j.id ASC;
