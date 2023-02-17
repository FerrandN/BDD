use bibliotheque;

/*
	DML : Dataa Modeling Language
	INSERT : ins�rer des donn�es dans une table
	UPDATE : modifier des donn�es existantes dans une table
	DELETE : supprimer des donn�es d'une table
	TRUNCATE : Vider une table et r�initialiser les compteurs (auto incr�ment)
*/

--truncate table editeurs;
--truncate table auteurs;

delete from editeurs;

dbcc checkident('editeurs', reseed,0);

insert into editeurs
values
('toto');

insert into editeurs
(editeur_nom)
values
('titi');

insert into auteurs
(auteur_nom, auteur_prenom)
values
('Petit','Poney');

insert into auteurs
values
('Petit','Poney');

update editeurs set editeur_nom = 'Micron' where editeur_nom = 'toto';

select * from editeurs;