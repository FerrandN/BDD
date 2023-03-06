-- sélectionner tous les micro-processeurs triés par valeur commerciale (product_value).

select *
from products
order by product_value;

-- Sélectionner les CPUs dont le nom se termine par la lettre (X)

select *
from products
where product_name like '%X';

-- Sélectionner les lignes de production dont le libellé contient la chaine (PR)

select *
from production_lines
where line_label like '%PR%';

-- Sélectionnez le nom, le  prix de tous les microprocesseurs. Pour chaque CPU listé
-- on doit connaitre le libellé de la ligne de production associée.

select 
product_name, product_value, line_label
from products
join production_lines on production_lines.product_id = products.product_id
;

-- Sélectionner les productions terminées dont le nombre de CPU produits dépasse 20. La requêtte
-- doit retourner le nom du CPU, son prix, son libellé de la ligne de production et le nombre d'unités produites.

select 
product_name, product_value, line_label, forge_quantity
from products
join production_lines on production_lines.product_id = products.product_id
join production_done on products.product_id = production_done.product_id
where production_done.forge_quantity > 20
;

-- Sélectionner toutes les lignes de productions (identifiant, libellé) avec le nombre total d'unités produites
-- par ligne de production ainsi que l'identifiant du CPU associé

select production_lines.line_id, production_lines.line_label, production_lines.product_id, sum(production_done.forge_quantity) as total_production
from production_done
full join production_lines on production_done.line_id = production_lines.line_id
group by production_lines.line_id, production_lines.product_id, production_lines.line_label
;
-- Même requête que la précédente mais en ne sélectionnant que les lignes de production qui ont produit au moin 1 unité

select production_lines.line_id, production_lines.line_label, sum(forge_quantity) as total_production, production_done.product_id
from production_lines
join production_done on production_done.line_id = production_lines.line_id
group by production_lines.line_id, production_lines.line_label, production_done.product_id
;

-- Afficher la valeur totale de tous les CPUs déjà produits avec le nom du CPU ayant rapporté le plus, toutes productions confondues.

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