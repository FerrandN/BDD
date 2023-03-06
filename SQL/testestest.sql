use testestest;

drop table if exists country;
drop table if exists town;
drop table if exists personne;

create table personne
(
	prs_nm_prn varchar(50) primary key,
	prs_age int not null,
	prs_nm_cv char(15) not null,
	prs_nm_prm char (15),
	twn_id int
);

create table town
(
	twn_nm varchar(100) not null,
	twn_id int identity (1,1) primary key,
	twn_cp char (5),
	ctr_id int
);

create table country
(
	ctr_nm varchar(100),
	ctr_id int identity (1,1) primary key,
	ctr_time_zone char(5)
);

alter table personne
	add
	foreign key (twn_id) references town(twn_id)

alter table town
	add
	foreign key (ctr_id) references country(ctr_id)

insert into country
(ctr_nm, ctr_time_zone)
values
('france','gmt+1'),
('belgique','gmt+1'),
('allemagne','gmt+1'),
('biscotti','gmt+1')

insert into town
(twn_nm, twn_cp, ctr_id)
values
('eydoche',38690, 1),
('lyon',69000, 1),
('ales',38000, 1),
('paris',38840, 1),
('grenoble',38300, 1)

insert into personne
(prs_nm_prn, prs_age, prs_nm_cv, prs_nm_prm, twn_id)
values
('jacky michel', 45 , 123456789101213, 159456753852456, 1),
('victoire sauveur', 15 , 123456789101213, 159456753852456, 2),
('rady kipik', 5 , 123456789101213, 159456753852456, 3),
('ater soué', 35 , 123456789101213, 159456753852456, 4)