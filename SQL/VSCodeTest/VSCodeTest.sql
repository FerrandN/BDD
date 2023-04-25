drop table if exists games;
drop table if exists game_type;
drop table if exists develloper;

create table games
(
	game_ID int identity,
	game_name varchar(100) not null,
	game_type_ID int not null,
	dev_ID int not null,
	primary key (game_ID),
);

create table game_type
(
	game_type_ID int identity not null,
	game_type_name varchar(100) not null,
	primary key (game_type_ID)
);

create table develloper
(
	dev_ID int identity not null,
	dev_name varchar(100) not null,
	primary key (dev_ID),
);

alter table games
	add constraint FK_game_type
	foreign key (game_type_ID)
	references game_type(game_type_ID);

alter table games
	add constraint FK_game_dev
	foreign key (dev_ID)
	references develloper(dev_ID);

insert into game_type
(game_type_name)
values
('FPS'),
('RTS'),
('RPG'),
('MOBA'),
('Puzzle'),
('aventure'),
('roguelike');

insert into develloper
(dev_name)
values
('game arts'),
('blizzard'),
('riot games'),
('sega'),
('don''t nod'),
('ubisoft'),
('edmund mcmillen');

insert into games
(game_name, game_type_ID, dev_ID)
values
('grandia',3,1),
('SC2',2,2),
('Warcraft3',2,2),
('League of legend',4,3),
('puyo puyo',5,4),
('tetris',5,4),
('remember me',6,5),
('life is strange',6,5),
('child of light',6,5),
('the binding of isaac',7,7);