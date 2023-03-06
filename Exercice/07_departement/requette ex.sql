-- obtenir les 10 villes les plus peupl�es en 2012

select top (10) [ville_nom_simple]
from villes_france_free
order by ville_population_2012 desc;

-- Obtenir la liste des 50 villes ayant la plus faible superficie

select top (50) [ville_nom_simple]
from villes_france_free
order by ville_surface desc;

-- Obtenir la liste des d�partements d�outres-mer,
-- c�est-�-dire ceux dont le num�ro de d�partement commencent par �97�

select ville_code_commune
from villes_france_free
where ville_code_commune like '97%';

-- Obtenir le nom des 10 villes les plus peupl�es en 2012, ainsi que le nom du d�partement associ�

select top (10) 
ville_population_2012,
departement_nom
from villes_france_free
join departement on villes_france_free.ville_departement = departement.departement_code
order by ville_population_2012 desc;

-- Obtenir la liste du nom de chaque d�partement, associ� � son code et du nombre de commune au sein de ces
-- d�partement, en triant afin d�obtenir en priorit� les d�partements qui poss�dent le plus de communes

select
departement_nom,
departement_code,
count (case when departement.departement_code = villes_france_free.ville_departement then 1 else null end) as number_of_town
from departement
join villes_france_free on departement.departement_code = villes_france_free.ville_departement
group by  departement.departement_nom, departement.departement_code
order by number_of_town desc
;

--  Obtenir la liste des 10 plus grands d�partements, en termes de superficie

select top (10)
departement_code,
sum(ville_surface) as total_surface
from villes_france_free
join departement on departement.departement_code = villes_france_free.ville_departement
group by departement_code
order by total_surface desc
;

-- Compter le nombre de villes dont le nom commence par �Saint�selectcount (villes_france_free.ville_nom) from villes_france_freewhere ville_nom like 'Saint%';-- Obtenir la liste des villes qui ont un nom existants plusieurs fois,-- et trier afin d�obtenir en premier celles dont le nom est le plus souvent utilis� par plusieurs communesselectvilles_france_free.ville_nom,count(ville_nom) as same_name_townfromvilles_france_freegroup by villes_france_free.ville_nomorder by same_name_town desc;-- Obtenir en une seule requ�te SQL la liste des villes dont la-- superficie est sup�rieur � la superficie moyenneselectvilles_france_free.ville_nom,ville_surfacefromvilles_france_freewhere ville_surface > (select avg(ville_surface)from villes_france_free)group by ville_nom, ville_surfaceorder by ville_surface desc;-- Obtenir la liste des d�partements qui poss�dent plus de 2 millions d�habitantsselectdepartement.departement_nomfrom departementjoin villes_france_free on departement.departement_code = villes_france_free.ville_departementgroup by departement_nomhaving SUM(villes_france_free.ville_population_2012) > 2000000;-- Remplacez les tirets par un espace vide, pour toutes les villes commen�ant par �SAINT-�
-- (dans la colonne qui contient les noms en majuscule)

select
replace (ville_nom,'-',' ')
from
villes_france_free
where ville_nom like 'SAINT-%'