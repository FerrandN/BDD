use Courses_De_Chevaux;
go;

drop table if exists type_de_paris;
create table type_de_paris
(
 type_pari_id int primary key identity (1,1),
 type_pari_libelle VARCHAR(50) not null,
);

create table course_de_chevaux
(
nom_course varchar(100) primary key,
date_course date not null default current_timestamp,
);

create table paris
(
id_pari int primary key identity (1,1),
somme_pari decimal (6,2) not null,
gain_pari decimal (6,2) not null,
type_pari_id int not null,
nom_course varchar(100) not null,
constraint FK_type_pari foreign key (type_pari_id) references type_de_paris(type_pari_id),
constraint FK_nom_course foreign key (nom_course) references course_de_chevaux(nom_course),
);

create table chevaux
(
id_cheval int primary key identity(1,1),
nom_cheval VARCHAR(50) not null,
);



create table chevaux_course
(
	nom_course varchar(100) not null,
	id_cheval int not null,
	position_participant varchar(100),
	numero int not null,
	primary key (nom_course, id_cheval),
	constraint FK_cheval_course foreign key (nom_course) references course_de_chevaux(nom_course),
	constraint FK_courses_cheval foreign key (id_cheval) references chevaux (id_cheval),
);

create table pari_chevaux
(
 id_pari int not null,
 id_cheval int not null,
 position_pari int not null,
 primary key (id_pari, id_cheval),
 constraint FK_pari_chevaux foreign key (id_pari) references paris(id_pari),
 constraint FK_cheval_pari foreign key (id_cheval) references chevaux (id_cheval),
);