use fuji_flush;
# ajout joueurs
insert into joueur(nom, prenom, password) values('lourdel', 'nicolas', 'azerty');
insert into joueur(nom, prenom, password) values('dupond', 'patrick', 'azerty');
insert into joueur(nom, prenom, password) values('martin', 'jacques', 'azerty');
# création partie
insert into partie(dateCrea, Joueur_id) values('20191028', 1);
insert into EstJoue(Partie_id, Joueur_id) values(1,1);
# ajout joueurs à la partie
insert into EstJoue(Partie_id, Joueur_id) values(1,2);
insert into EstJoue(Partie_id, Joueur_id) values(1,3);
# demarrage partie : lancement chronomètre
update partie set dateDebut = '20191029' where Joueur_id=1 and id=1;
# demarrage partie : distribution carte, création des mains de chaque joueur
# c'est la main associée au Jeu n°1, etat de la main avant que le joueur pose sa carte
# main du joueur 1 :
insert into Main(Jeu_id, Jeu_EstJoue_Partie_id, Jeu_EstJoue_Joueur_id, main) values(1,1,1,'3;2;2;5;6;13');
# main du joueur 2 :
insert into Main(Jeu_id, Jeu_EstJoue_Partie_id, Jeu_EstJoue_Joueur_id, main) values(1,1,2,'8;2;2;9;10;7');
# les joueur jouent
insert into jeu(EstJoue_Partie_id, EstJoue_Joueur_id, carteJoue) values(1,1,6);
insert into jeu(EstJoue_Partie_id, EstJoue_Joueur_id, carteJoue) values(1,2,3);
insert into jeu(EstJoue_Partie_id, EstJoue_Joueur_id, carteJoue) values(1,3,2);
# creation 2eme partie
insert into partie(dateCrea, Joueur_id) values('20191029', 2);
insert into EstJoue(Partie_id, Joueur_id) values(2,1);
# ajout joueurs à la 2eme partie
insert into EstJoue(Partie_id, Joueur_id) values(2,2);
insert into EstJoue(Partie_id, Joueur_id) values(2,3);
# demarrage 2eme  partie
update partie set dateDebut = '20191029' where Joueur_id=2 and id=2;
# les joueurs jouent
insert into jeu(EstJoue_Partie_id, EstJoue_Joueur_id, carteJoue) values(2,1,2);
insert into jeu(EstJoue_Partie_id, EstJoue_Joueur_id, carteJoue) values(2,2,4);
insert into jeu(EstJoue_Partie_id, EstJoue_Joueur_id, carteJoue) values(2,3,6);


select * from jeu;



