use hebergement;

drop table if exists etats;
drop table if exists personnes;
drop table if exists roles;

create table roles
(
	role_id int identity (1,1) primary key,
	role_nom varchar(25) not null unique,

);

create table personnes
(
	personne_id int identity (1,1),
	personne_nom varchar(50) not null,
	personne_prenom varchar(50) not null,
	personne_ddn date not null,
	role_id int not null,
	primary key (personne_id)
);

create table etats
(
	etat_id int identity (1,1),
	etat_intitule varchar(25),
);

alter table etats add primary key (etat_id);
-- alter table etats add contraint PK_etats primary key (etat_id);
--alter table etats drop constraint PK_etats;

alter table personnes add foreign key (role_id) references roles(role_id);