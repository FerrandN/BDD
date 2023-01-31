CREATE TABLE adresses(
   adresse_id INT IDENTITY,
   adresse_numero SMALLINT NOT NULL,
   adresse_extension VARCHAR(10),
   adresse_voie VARCHAR(50) NOT NULL,
   adresse_complement VARCHAR(50),
   adresse_ville VARCHAR(50) NOT NULL,
   adresse_code_postal CHAR(5) NOT NULL,
   PRIMARY KEY(adresse_id)
);

CREATE TABLE auteurs(
   auteur_id INT IDENTITY,
   auteur_nom VARCHAR(100) NOT NULL,
   auteur_prenom VARCHAR(100) NOT NULL,
   PRIMARY KEY(auteur_id)
);

CREATE TABLE editeurs(
   editeur_id INT IDENTITY,
   editeur_nom VARCHAR(100) NOT NULL,
   PRIMARY KEY(editeur_id)
);

CREATE TABLE etats_livres(
   etat_livre_id INT IDENTITY,
   etat_livre_nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(etat_livre_id)
);

CREATE TABLE clients(
   client_id INT IDENTITY,
   client_nom VARCHAR(100) NOT NULL,
   client_prenom VARCHAR(100) NOT NULL,
   client_caution DECIMAL(5,2) NOT NULL,
   adresse_id INT NOT NULL,
   PRIMARY KEY(client_id),
   FOREIGN KEY(adresse_id) REFERENCES adresses(adresse_id)
);

CREATE TABLE livres(
   livre_id INT IDENTITY,
   livre_isbn CHAR(17) NOT NULL,
   livre_titre VARCHAR(255) NOT NULL,
   livre_date_achat DATE NOT NULL,
   livre_etat_commentaire VARCHAR(max),
   etat_livre_id INT NOT NULL,
   editeur_id INT NOT NULL,
   PRIMARY KEY(livre_id),
   UNIQUE(livre_isbn),
   FOREIGN KEY(etat_livre_id) REFERENCES etats_livres(etat_livre_id),
   FOREIGN KEY(editeur_id) REFERENCES editeurs(editeur_id)
);

CREATE TABLE emprunts(
   emprunt_id INT IDENTITY,
   emprunt_date DATETIME2 NOT NULL,
   emprunt_date_retour DATE,
   client_id INT NOT NULL,
   livre_id INT NOT NULL,
   PRIMARY KEY(emprunt_id),
   FOREIGN KEY(client_id) REFERENCES clients(client_id),
   FOREIGN KEY(livre_id) REFERENCES livres(livre_id)
);

CREATE TABLE écrire(
   livre_id INT,
   auteur_id INT,
   PRIMARY KEY(livre_id, auteur_id),
   FOREIGN KEY(livre_id) REFERENCES livres(livre_id),
   FOREIGN KEY(auteur_id) REFERENCES auteurs(auteur_id)
);
