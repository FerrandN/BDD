 -- Obtenir l�utilisateur ayant le pr�nom �Muriel� et le mot de passe �test11�, sachant que l�encodage
 -- du mot de passe est effectu� avec l�algorithme Sha1.

select *
from client
where prenom='Muriel' 
and [password]=CONVERT(VARCHAR(255),hashbytes('SHA1','test11'),2);

--  Obtenir la liste de tous les produits qui sont pr�sent sur plusieurs commandes.selectcommande_ligne.nomfrom commande_lignejoin commande on commande.id = commande_ligne.idgroup by commande_ligne.nomhaving count(commande_ligne.commande_id) > 1;-- Obtenir la liste de tous les produits qui sont pr�sent sur plusieurs commandes et
-- y ajouter une colonne qui liste les identifiants des commandes associ�es.selectcommande_ligne.nom,string_agg(commande.id,',') as commande_idfromcommande_lignejoin commande on commande.id = commande_ligne.idgroup by commande_ligne.nomhaving count(commande.id) > 1;-- Enregistrer le prix total � l�int�rieur de chaque ligne des commandes,-- en fonction du prix unitaire et de la quantit�.updatecommande_lignesetprix_total = quantite * prix_unitaire;-- (Difficult� tr�s haute) Enregistrer le montant total de chaque-- commande dans le champ intitul� �cache_prix_total�.update commandeset cache_prix_total =	(	select sum(prix_total) as total_price	from commande_ligne	where commande_ligne.commande_id = commande.id	);select cache_prix_totalfrom commande;-- Obtenir le montant global de toutes les commandes, pour chaque mois.