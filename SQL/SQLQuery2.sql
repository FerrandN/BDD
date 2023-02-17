Use bibliotheque;

/* 

lul

*/

-- com

go;

-- DDL : create / alter / drop (data definition language)

drop table if exists editeurs;

create table editeurs
(
	editeur_id int primary key identity(1,1),
	editeur_nom varchar(100) NOT NULL -- default 'aujourd''hui'
);

-- insert into dbo.editeurs values ('toto');

drop table if exists auteurs;

create table auteurs 
(
	auteur_id int identity(1,1),
	auteur_nom varchar(100) not null,
	auteur_prenom varchar(100) null,
	-- primary key (auteur_id)
);
/*
alter table
add column toto int
modify column auteur_id int
drop column auteur_id
*/

alter table auteurs
add primary key (auteur_id);

drop table if exists etats_livres;
create table etats_livres
(
	etat_livre_id int primary key identity (1,1),
	etat_livre_nom varchar(50)
);
drop table if exists livres;
create table livres
(
	livre_id int primary key identity (1,1),
	livre_isbn char(17) not null,
	livre_titre varchar(255) not null,
	livre_date_achat date not null default current_timestamp,
	livre_etat_commentaire varchar(1000) not null,
	etat_livre_id int not null,
	editeur_id int not null,
	-- clé étrangère
	foreign key (etat_livre_id) references etats_livres(etat_livre_id),
	constraint FK_livres_editeur foreign key (editeur_id) references editeurs(editeur_id)
);

create table livres_auteurs
(
	auteur_id int,
	livre_id int,
	primary key (auteur_id, livre_id)
);

drop table if exists emprunts;
create table emprunts
(
	emprunt_id int primary key identity(1,1),
	emprunt_date datetime2 not null default current_timestamp,
	emprunt_date_retour date null check (emprunt_date_retour > emprunt_date),
);

drop table if exists adresses;
create table adresses
(
 adresse_id int primary key identity(1,1),
 adresse_numero tinyint not null,
 adresse_extension varchar(10) null,
 adresse_voie varchar(50) not null,
 adresse_complement varchar(50) null,
 adresse_ville varchar(50) not null,
 adresse_code_postale char(5)
);

drop table if exists clients
create table client
(
client_id int primary key identity(1,1),
client_nom varchar(100) not null,
client_prenom varchar(100) not null,
client_caution decimal(5,2) not null CHECK (client_caution>0)
);

alter table livres_auteurs
	add foreign key (auteur_id) references auteurs(auteur_id),
	constraint fk_toto foreign key (livre_id) references livres(livre_id)