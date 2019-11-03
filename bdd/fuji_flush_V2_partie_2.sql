use fuji_flush_V2;

# ajout nouveaux joueurs
insert into Joueur(nom, prenom, password) values('trump', 'donald', 'azerty'); # 4eme joueur, id = 4, il va créer la partie

# création partie 2
insert into Partie(dateCrea, Joueur_id) values('20190901', 4); # 2eme partie donc id = 2
insert into EstJoue(Partie_id, Joueur_id) values(2,4);

# ajout joueurs à la partie
insert into EstJoue(Partie_id, Joueur_id) values(2,2);
insert into EstJoue(Partie_id, Joueur_id) values(2,3);

# demarrage partie : lancement chronomètre
update Partie set dateDebut = '20190902' where Joueur_id=4 and id=2;

# demarrage partie : création des mains de chaque joueur
# Il faut d'abord créer un jeu, l'attribuer à un joueur, puis lier les mains à ce jeu
# le joueur d'id 4 va jouer en premier : 
insert into Jeu(id, Partie_id, EstJoue_Joueur_id, EstJoue_Partie_id) values(1,2,4,2);

# etat des mains avant que le premier joueur pose sa carte
# main du joueur 1 :
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(1,2,4,'3;10;2;5;6;13;',1,2);
# main du joueur 2 :
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(1,2,2,'8;2;6;9;10;7;',1,2);
# main du joueur 3 :
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(1,2,3,'3;6;1;6;10;11;',1,2);

# premier jeu, le joueur a posé une carte de valeur 10 :
update Jeu set carteJoue = 10 where id = 1 and Partie_id = 2;
update Main set main = '3;2;5;6;13;' where id = 1 and EstJoue_Partie_id = 2 and EstJoue_Joueur_id = 4;

# jeu n°2 le joueur suivant pose une carte de valeur 6 :
insert into Jeu(id, Partie_id, EstJoue_Joueur_id, EstJoue_Partie_id, carteJoue) 
values(2,2,2,2,6);
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(2,2,2,'8;2;9;10;7;',2,2);

# jeu n°3 le joueur suivant pose une carte de valeur 6 :
insert into Jeu(id, Partie_id, EstJoue_Joueur_id, EstJoue_Partie_id, carteJoue) 
values(3,2,3,2,6);
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(2,2,3,'3;6;1;10;11;',3,2);

# au jeu n°3 seul la main du premier joueur a changé : joueur 1 perds sa carte 10 et en prend une dans la pioche
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(2,2,4,'3;4;2;5;6;13;', 3,2);
# joueur 2 perds sa carte 6 et (et n'en reprend pas)
# joueur 3 perds sa carte 6 et (et n'en reprend pas)


# jeu n°4 le joueur 3 pose une carte de valeur 1 :
insert into Jeu(id, Partie_id, EstJoue_Joueur_id, EstJoue_Partie_id, carteJoue)  values(4,2,3,2,1);
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(3,2,3,'3;6;10;11;',4,2);



