 -- Obtenir l�utilisateur ayant le pr�nom �Muriel� et le mot de passe �test11�, sachant que l�encodage
 -- du mot de passe est effectu� avec l�algorithme Sha1.

select *
from client
where prenom='Muriel' 
and [password]=CONVERT(VARCHAR(255),hashbytes('SHA1','test11'),2);

--  Obtenir la liste de tous les produits qui sont pr�sent sur plusieurs commandes.
-- y ajouter une colonne qui liste les identifiants des commandes associ�es.