USE DataWareHouse;
GO

DELETE FROM bronze.categories;
GO

BULK INSERT bronze.categories
FROM '/var/opt/mssql/categories.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);





DELETE FROM bronze.clients;
GO

BULK INSERT bronze.clients
FROM '/var/opt/mssql/clients.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);



DELETE FROM bronze.produits;
GO

BULK INSERT bronze.produits
FROM '/var/opt/mssql/produits.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


SELECT * FROM bronze.produits;




IF OBJECT_ID('#TempCommandes') IS NOT NULL
    DROP TABLE dbo.#TempCommandes;
GO

-- 1. Table temporaire avec colonnes VARCHAR
CREATE TABLE dbo.#TempCommandes (
    num_commande VARCHAR(50), code_client VARCHAR(50),
    date_commande VARCHAR(50), date_livraison VARCHAR(50), date_envoi VARCHAR(50),
    port VARCHAR(50), destination VARCHAR(100), adresse VARCHAR(255),
    ville VARCHAR(100), region VARCHAR(100), cp VARCHAR(50), pays VARCHAR(100)
);

-- 2. Importation brute
BULK INSERT dbo.#TempCommandes
FROM '/var/opt/mssql/commandes.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- 3. Insertion propre avec conversion
INSERT INTO bronze.commandes
SELECT 
    num_commande, 
    code_client,
    TRY_CAST(NULLIF(date_commande, 'NULL') AS DATETIME),
    TRY_CAST(NULLIF(date_livraison, 'NULL') AS DATETIME),
    TRY_CAST(NULLIF(date_envoi, 'NULL') AS DATETIME),
    CAST(NULLIF(port, 'NULL') AS DECIMAL(10,4)),
    destination, adresse, ville, region, cp, pays
FROM #TempCommandes;



DELETE FROM bronze.details_commande;
GO

BULK INSERT bronze.details_commande
FROM '/var/opt/mssql/details_commande.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


SELECT * FROM DataWareHouse.bronze.categories;
SELECT * FROM DataWareHouse.bronze.clients;
SELECT * FROM DataWareHouse.bronze.produits;
SELECT * FROM DataWareHouse.bronze.commandes;
SELECT * FROM DataWareHouse.bronze.details_commande;
