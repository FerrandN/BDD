use bibliotheque;

/*
	DML : Dataa Modeling Language
	INSERT : insérer des données dans une table
	UPDATE : modifier des données existantes dans une table
	DELETE : supprimer des données d'une table
	TRUNCATE : Vider une table et réinitialiser les compteurs (auto incrément)
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