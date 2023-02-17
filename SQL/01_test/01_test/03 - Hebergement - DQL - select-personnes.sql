-- use hebergement;
select * from Personnes
select personne_nom, personne_prenom from personnes;

select
personne_id as 'identifiant',
personne_prenom as 'waifu''s name',
personne_nom as 'waifu''s surname'
from personnes ;

select * from personnes order by personne_nom;

select * from personnes
where personne_ddn >= '2005' and personne_ddn <= '2005-12-31';

-- select * from personnes where personne_ddn between '200-01-01' and '2005-12-31';

-- select * from personnes where personne_ddn like '%-4-%'

select * from personnes
where month (personne_ddn) = '11';

select personne_id, personne_prenom as 'prénom'
from personnes where personne_id > 5
order by personne_nom desc;

select * from personnes, roles
where personne_id = 4
and personnes.role_id = roles.role_id
order by personne_id;

select * from personnes
join roles on personnes.role_id = roles.role_id
where personne_id = 4;
/*
select * from personnes
natural join roles
where personne_id = 4;
*/