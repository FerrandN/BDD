-- s�lectionner tous les micro-processeurs tri�s par valeur commerciale (product_value).

select *
from products
order by product_value;

-- S�lectionner les CPUs dont le nom se termine par la lettre (X)

select *
from products
where product_name like '%X';

-- S�lectionner les lignes de production dont le libell� contient la chaine (PR)

select *
from production_lines
where line_label like '%PR%';

-- S�lectionnez le nom, le  prix de tous les microprocesseurs. Pour chaque CPU list�
-- on doit connaitre le libell� de la ligne de production associ�e.

select 
product_name, product_value, line_label
from products
join production_lines on production_lines.product_id = products.product_id
;

-- S�lectionner les productions termin�es dont le nombre de CPU produits d�passe 20. La requ�tte
-- doit retourner le nom du CPU, son prix, son libell� de la ligne de production et le nombre d'unit�s produites.

select 
product_name, product_value, line_label, forge_quantity
from products
join production_lines on production_lines.product_id = products.product_id
join production_done on products.product_id = production_done.product_id
where production_done.forge_quantity > 20
;

-- S�lectionner toutes les lignes de productions (identifiant, libell�) avec le nombre total d'unit�s produites
-- par ligne de production ainsi que l'identifiant du CPU associ�

select production_lines.line_id, production_lines.line_label, production_lines.product_id, sum(production_done.forge_quantity) as total_production
from production_done
full join production_lines on production_done.line_id = production_lines.line_id
group by production_lines.line_id, production_lines.product_id, production_lines.line_label
;
-- M�me requ�te que la pr�c�dente mais en ne s�lectionnant que les lignes de production qui ont produit au moin 1 unit�

select production_lines.line_id, production_lines.line_label, sum(forge_quantity) as total_production, production_done.product_id
from production_lines
join production_done on production_done.line_id = production_lines.line_id
group by production_lines.line_id, production_lines.line_label, production_done.product_id
;

-- Afficher la valeur totale de tous les CPUs d�j� produits avec le nom du CPU ayant rapport� le plus, toutes productions confondues.

select sum(product_value * forge_quantity) as prods_total_value
from products
join production_done on production_done.product_id = products.product_id
;

select top (1) 
product_name  as most_profitable_item,
(select sum(product_value * forge_quantity) as prods_total_value
from products
join production_done on production_done.product_id = products.product_id) as toto
from products
join production_done on production_done.product_id = products.product_id
group by product_name
order by product_name desc
;