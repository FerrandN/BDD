use museum;

drop table if exists definit;
drop table if exists caracterise;
drop table if exists courants;
drop table if exists creer;
drop table if exists inspire;
drop table if exists artistes;
drop table if exists ttypes;
drop table if exists oeuvres;
drop table if exists adresses;


create table oeuvres
(
	oeuvre_id int identity (1,1),
	oeuvre_titre varchar(50) not null,
	oeuvre_type varchar(25) not null,
	oeuvre_année date not null,
	oeuvre_matiere text not null,
	oeuvre_dimension varchar(25) not null,
	oeuvre_numero smallint,
	adr_id int,
	primary key (oeuvre_id)
);

create table artistes
(
	artiste_id int identity (1,1),
	artiste_nom varchar(25) not null,
	artiste_prenom varchar(25) not null,
	artiste_nationalite varchar(25) not null,
	artiste_date_de_naissance date not null,
	artiste_date_de_deces date,
	primary key (artiste_id)
);

create table adresses
(
	adr_id int identity(1,1),
	adr_no_voie char(5) not null,
	adr_mltp char(5),
	adr_voie varchar(25) not null,
	adr_cplt varchar(25),
	adr_cp char(5) not null,
	adr_ville varchar(25) not null,
	primary key (adr_id)
);

create table courants
(
	courant_nom varchar(25),
	courant_periode_date_debut date not null,
	courant_description text not null,
	courant_periode_date_fin date,
	primary key (courant_nom)
);

create table ttypes
(
	ttype_id int identity (1,1),
	type_nom varchar(25) not null,
	primary key (ttype_id)
);

create table creer
(
	oeuvre_id int,
	artiste_id int,
	primary key (oeuvre_id, artiste_id)
);

create table definit
(
	oeuvre_id int,
	ttype_id int,
	primary key (oeuvre_id, ttype_id)
);

create table caracterise
(
	oeuvre_id int,
	courant_nom varchar(25),
	primary key (oeuvre_id, courant_nom)
);

create table inspire
(
	artiste_id int,
	courant_nom varchar(25),
	primary key (artiste_id, courant_nom)
);

alter table oeuvres
	add
	foreign key (adr_id) references adresses(adr_id);

alter table creer
	add 
	foreign key (oeuvre_id) references oeuvres(oeuvre_id),
	foreign key (artiste_id) references artistes(artiste_id);

alter table definit
	add
	foreign key (oeuvre_id) references oeuvres(oeuvre_id),
	foreign key (ttype_id) references ttypes(ttype_id);

alter table caracterise
	add
	foreign key (oeuvre_id) references oeuvres(oeuvre_id),
	foreign key (courant_nom) references courants(courant_nom);

alter table inspire
	add 
	foreign key (courant_nom) references courants(courant_nom),
	foreign key (artiste_id) references artistes(artiste_id);