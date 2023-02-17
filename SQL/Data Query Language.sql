use bibliotheque;

/*
DQL : Data Query Language
select
*/

select * from etats_livres;

select * from etats_livres where etat_livre_id = 6;

select * from etats_livres where etat_livre_id < 6 and etat_livre_id > 3;

select * from etats_livres where etat_livre_id <> 6;

select * from etats_livres where etat_livre_id in(1,2,5);
select * from etats_livres where etat_livre_id = 1 or etat_livre_id = 2 or etat_livre_id = 5;

select * from etats_livres where etat_livre_id not in(1,2,5);

select * from etats_livres where etat_livre_id between 1 and 2;

select * from etats_livres where etat_livre_nom like'%e%'; --contient la lettre e
select * from etats_livres where etat_livre_nom like'%e'; --termine pas la lettre e
select * from etats_livres where etat_livre_nom like'e%'; --commence par la lettre e