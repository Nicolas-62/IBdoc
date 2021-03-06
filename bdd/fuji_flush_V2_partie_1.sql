use fuji_flush_V2;

# ajout joueurs
insert into Joueur(nom, prenom, password) values('terrieur', 'alex', 'azerty');
insert into Joueur(nom, prenom, password) values('dupond', 'patrick', 'azerty');
insert into Joueur(nom, prenom, password) values('martin', 'jacques', 'azerty');
insert into Joueur(nom, prenom, password) values('trump', 'donald', 'azerty');

# création partie 1
insert into Partie(dateCrea, Joueur_id) values('20191028', 1);
insert into EstJoue(Partie_id, Joueur_id) values(1,1);

# ajout joueurs à la partie
insert into EstJoue(Partie_id, Joueur_id) values(1,2);
insert into EstJoue(Partie_id, Joueur_id) values(1,3);

# demarrage partie : lancement chronomètre
update Partie set dateDebut = '20191029' where Joueur_id=1 and id=1;

# demarrage partie : création des mains de chaque joueur
# Il faut d'abord initialiser un jeu (sans carte jouée), l'attribuer à un joueur, puis lier les mains à ce jeu
# le joueur d'id 1 va jouer en premier : 
insert into Jeu(id, Partie_id, EstJoue_Joueur_id, EstJoue_Partie_id) values(1,1,1,1);

# etat des mains avant que le premier joueur pose sa carte
# main du joueur 1 :
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(1,1,1,'3;2;2;5;6;13;',1,1);
# main du joueur 2 :
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(1,1,2,'8;2;2;9;10;7;',1,1);
# main du joueur 3 :
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(1,1,3,'3;5;1;6;10;11;',1,1);

# premier jeu, le joueur a posé une carte de valeur 6 :
update Jeu set carteJoue = 6 where id = 1 and Partie_id = 1;
update Main set main = '3;2;2;5;13;' where id = 1 and EstJoue_Partie_id = 1 and EstJoue_Joueur_id = 1;

# jeu n°2 le joueur suivant pose une carte de valeur 8 :
insert into Jeu(id, Partie_id, EstJoue_Joueur_id, EstJoue_Partie_id, carteJoue) values(2,1,2,1,8);
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(2,1,2,'2;2;9;10;7;',2,1);

# au jeu n°2 joueur 1 perds sa carte 6 et en prends une dans la pioche (carte 4) :
insert into Main(id, EstJoue_Partie_id, EstJoue_Joueur_id, main, Jeu_id, Jeu_Partie_id) 
values(2,1,1,'3;2;2;5;4;13;',2,1);
# joueur 2 perd sa carte 8 et n'en reprend pas (même main qu'au jeu 1 pas besoin d'effectuer un enregistrement)




