
USE DataWareHouse;

DROP TABLE IF EXISTS DataWareHouse.bronze.categories;

CREATE TABLE bronze.categories(
    code_categorie VARCHAR(20),
    nom_categorie VARCHAR(100),
    description NVARCHAR(MAX),
    CONSTRAINT CATEGORIES_PK PRIMARY KEY (code_categorie),
    CONSTRAINT UNIQUE_NOM_CATEGORIE UNIQUE (nom_categorie)

);



IF OBJECT_ID('DataWareHouse.bronze.clients', 'U') IS NOT NULL
BEGIN
    DROP TABLE DataWareHouse.bronze.clients;
END;

CREATE TABLE bronze.clients(
    code_client VARCHAR(5),
    societe VARCHAR(50),
    contact VARCHAR(40),
    fonction VARCHAR(40),
    adresse VARCHAR(60),
    ville VARCHAR(40),
    region VARCHAR(40),
    code_postale VARCHAR(40),
    pays VARCHAR(20),
    telephone VARCHAR(20),
    fax VARCHAR(20),
    CONSTRAINT CLIENT_PK PRIMARY KEY (code_client)
);



DROP TABLE IF EXISTS DataWareHouse.bronze.produits;

CREATE TABLE bronze.produits(
    ref_produit VARCHAR(4),
    nom_produit VARCHAR(40),
    code_categorie VARCHAR(20),
    quantite_unite VARCHAR(30),
    prix_unitaire DECIMAL(19,4) DEFAULT 0,
    unite_stock INT DEFAULT 0,
    unites_commandees INT DEFAULT 0,
    niveau_reapro INT DEFAULT 0,
    indisponsible INT DEFAULT 0,
    CONSTRAINT PRODUITS_PK PRIMARY KEY (ref_produit),
    CONSTRAINT PRODUITS_FK FOREIGN KEY (code_categorie) 
        REFERENCES bronze.categories(code_categorie)
);



DROP TABLE IF EXISTS DataWareHouse.bronze.commandes;

CREATE TABLE bronze.commandes(
    num_commande VARCHAR(6),
    code_client VARCHAR(5),
    date_commande DATETIME,
    date_livraison DATETIME,
    date_envoi DATETIME,
    port DECIMAl(19,4),
    destination VARCHAR(40),
    adresse_livraison VARCHAR(60),
    ville_livraison  VARCHAR(15),
    region_livraison VARCHAR(15),
    code_postale_livraison VARCHAR(10),
    pays_livraison VARCHAR(15),
    CONSTRAINT COMMANDES_PK PRIMARY KEY (num_commande),
    CONSTRAINT COMMANDES_FK1 FOREIGN KEY (code_client)
        REFERENCES bronze.clients(code_client)
);





DROP TABLE IF EXISTS DataWareHouse.bronze.details_commande;

CREATE TABLE bronze.details_commande(
    num_commande VARCHAR(6) NOT NULL,
    ref_produit VARCHAR(4) NOT NULL,
    quantite INT NOT NULL DEFAULT 1,
    remise FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT DETAILS_COMMANDE_FK1 FOREIGN KEY (ref_produit)
        REFERENCES bronze.produits(ref_produit),
    CONSTRAINT DETAILS_COMMANDE_FK2 FOREIGN KEY (num_commande)
        REFERENCES bronze.commandes(num_commande)
);


SELECT *
FROM bronze.categories;

SELECT *
FROM bronze.clients;

SELECT *
FROM bronze.produits;

SELECT *
FROM bronze.commandes;

SELECT *
FROM bronze.details_commande;
