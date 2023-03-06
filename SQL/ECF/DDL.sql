use ECF;

drop table if exists production_done
drop table if exists production_lines
drop table if exists products


create table products
(
	product_id int identity(1,1),
	product_name varchar(128) unique not null,
	product_value int not null,
	primary key (product_id)
);

create table production_lines
(
	line_id char(3),
	line_label varchar(50) not null,
	product_id int not null,
	primary key (line_id)
);

create table production_done
(
	forge_id int identity (3142,1),
	forge_date date not null,
	forge_quantity int not null,
	line_id char(3) not null,
	product_id int not null,
	primary key (forge_id)
);

alter table production_lines
	add
	foreign key (product_id) references products(product_id);

alter table production_done
	add
	foreign key (line_id) references production_lines(line_id),
	foreign key (product_id) references products(product_id);