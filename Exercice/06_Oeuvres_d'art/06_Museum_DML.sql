insert into adresses
(adr_no_voie, adr_mltp, adr_voie, adr_cplt, adr_cp, adr_ville)
values
('a','a','a','a','a','a'),
('b','b','b','b','b','b');

insert into ttypes
(type_nom)
values
('pointillisme'), 
('cubisme'),
('rococo');

insert into oeuvres
(oeuvre_titre,oeuvre_année,oeuvre_matiere, oeuvre_dimension, oeuvre_numero, oeuvre_type, adr_id)
values
('joconde','1500','toile','150X50',null, 1,1),
('le radeau de la méduse','1550','toile', '200X100',null, 1,1);