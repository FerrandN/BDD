use hebergement;

insert into roles
(role_nom)

values
('Admin'),
('Directeur'),
('Médecin'),
('educateur'),
('resident');

insert into personnes
(
personne_nom, personne_prenom, personne_ddn, role_id
)

values
('peti','poney','1992-05-14',1),
('tichaud','canard','1992-05-14',1),
('nguyen','caitlin','2004-04-23',99);

select * from roles;
select * from personnes;