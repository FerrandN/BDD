drop table if exists cars
drop table if exists brands
drop table if exists owners


create table cars
(
	car_id int,
	owner_id int not null,
	brand_id int not null,
	car_name varchar(100) not null,
	car_registration char(9) not null unique,
	primary key (car_id)
);

create table brands
(
	brand_id int identity (1,1),
	brand_name varchar(50) not null,
	brand_slogan varchar(250),
	primary key (brand_id)
);

create table owners
(
	owner_id int identity (1,1),
	owner_lastname varchar(50) not null,
	owner_firstname varchar(50) not null,
	primary key (owner_id)
);

alter table cars
add constraint imm
check (car_registration like '[A-Z][A-Z][-][0-9][0-9][0-9][-][A-Z][A-Z]')
go

alter table cars
add constraint fk_owners
foreign key (owner_id)
references owners(owner_id),

constraint fk_brands
foreign key (brand_id)
references brands(brand_id)