USE DataWareHouse;





DROP TABLE IF EXISTS gold.dim_client; 

CREATE TABLE gold.dim_client (
    id_client INT IDENTITY(1,1) PRIMARY KEY,
    code_client VARCHAR(5),
    societe VARCHAR(50),
    contact VARCHAR(40),
    fonction VARCHAR(40),
    ville VARCHAR(40),
    region VARCHAR(40),
    pays VARCHAR(20)
);


INSERT INTO gold.dim_client (
    code_client,
    societe,
    contact,
    fonction,
    ville,
    region,
    pays
)
SELECT
    code_client,
    societe,
    contact,
    fonction,
    ville,
    region,
    pays
FROM silver.clients;


SELECT * FROM gold.dim_client;







DROP TABLE IF EXISTS gold.dim_produit; 


CREATE TABLE gold.dim_produit (
    id_produit INT IDENTITY(1,1) PRIMARY KEY,
    ref_produit VARCHAR(4),
    nom_produit VARCHAR(40),
    code_categorie VARCHAR(20),
    nom_categorie VARCHAR(100),
    prix_unitaire DECIMAL(19,4)
);


INSERT INTO gold.dim_produit (
    ref_produit,
    nom_produit,
    code_categorie,
    nom_categorie,
    prix_unitaire
)
SELECT
    p.ref_produit,
    p.nom_produit,
    p.code_categorie,
    c.nom_categorie,
    p.prix_unitaire
FROM silver.produits p
JOIN silver.categories c
    ON p.code_categorie = c.code_categorie;


SELECT * FROM gold.dim_produit;









DROP TABLE IF EXISTS gold.dim_temps;

CREATE TABLE gold.dim_temps (
    id_temps INT IDENTITY(1,1) PRIMARY KEY,
    date_complete DATE,
    jour INT,
    mois INT,
    nom_mois VARCHAR(20),
    trimestre INT,
    annee INT
);


INSERT INTO gold.dim_temps (
    date_complete,
    jour,
    mois,
    nom_mois,
    trimestre,
    annee
)
SELECT DISTINCT
    date_commande,
    DAY(date_commande),
    MONTH(date_commande),
    DATENAME(MONTH, date_commande),
    DATEPART(QUARTER, date_commande),
    YEAR(date_commande)
FROM silver.commandes
WHERE date_commande IS NOT NULL;


SELECT * FROM gold.dim_temps;







DROP TABLE IF EXISTS gold.fact_ventes;

CREATE TABLE gold.fact_ventes (
    id_client INT,
    id_produit INT,
    id_temps INT,
    
    quantite INT,
    remise FLOAT,
    prix_unitaire DECIMAL(19,4),
    montant_vente DECIMAL(19,4),
    port DECIMAL(19,4),

    CONSTRAINT FACT_CLIENT_FK FOREIGN KEY (id_client) REFERENCES gold.dim_client(id_client),
    CONSTRAINT FACT_PRODUIT_FK FOREIGN KEY (id_produit) REFERENCES gold.dim_produit(id_produit),
    CONSTRAINT FACT_TEMPS_FK FOREIGN KEY (id_temps) REFERENCES gold.dim_temps(id_temps)
);






INSERT INTO gold.fact_ventes (
    id_client,
    id_produit,
    id_temps,
    quantite,
    remise,
    prix_unitaire,
    montant_vente,
    port
)
SELECT
    dc.id_client,
    dp.id_produit,
    dt.id_temps,
    d.quantite,
    d.remise,
    p.prix_unitaire,
    (d.quantite * p.prix_unitaire * (1 - d.remise)) AS montant_vente,
    c.port
FROM silver.details_commande d
JOIN silver.commandes c
    ON d.num_commande = c.num_commande
JOIN silver.produits p
    ON d.ref_produit = p.ref_produit

-- dimensions
JOIN gold.dim_client dc
    ON c.code_client = dc.code_client

JOIN gold.dim_produit dp
    ON p.ref_produit = dp.ref_produit

JOIN gold.dim_temps dt
    ON c.date_commande = dt.date_complete;

SELECt * FROM gold.fact_ventes;



SELECT COUNT(*) FROM gold.fact_ventes;
SELECT COUNT(*) FROM gold.dim_client;
SELECT COUNT(*) FROM gold.dim_produit;
SELECT COUNT(*) FROM gold.dim_temps;


SELECT * FROM gold.dim_client;
SELECT * FROM gold.dim_produit;
SELECT * FROM gold.dim_temps;
SELECT * FROM gold.fact_ventes;