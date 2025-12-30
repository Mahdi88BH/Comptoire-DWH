/*
============================================================================================================

This script initializes the DDL of the ComptoireDB source database (categories, clients, produits, commandes, details_commande), 
which acts as the upstream data source for the Data Warehouse.

============================================================================================================
*/



-- Check if the database ComptoireDB already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'ComptoireDB')
BEGIN
    -- Set the database to SINGLE_USER mode
    -- This forces all active connections to close and transactoin operation to stop
    ALTER DATABASE ComptoireDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Delete the existing database
    DROP DATABASE ComptoireDB;
END;
GO

-- Create a new database named ComptoireDB
CREATE DATABASE ComptoireDB;
GO

-- Switch the context to the ComptoireDB database
USE ComptoireDB;
GO




-- Define DDL for ComptoireDB


-- Check if the table exist
IF OBJECT_ID('ComptoireDB.dbo.categories', 'U') IS NOT NULL
BEGIN
    -- Drop the Tabel
    DROP TABLE ComptoireDB.dbo.categories;
END;
GO

-- Create Categories Table
CREATE TABLE ComptoireDB.dbo.categories(
    code_categorie VARCHAR(20),
    nom_categorie VARCHAR(100),
    description NVARCHAR(MAX),
    CONSTRAINT CATEGORIES_PK PRIMARY KEY (code_categorie),
    CONSTRAINT UNIQUE_NOM_CATEGORIE UNIQUE (nom_categorie)

);




-- Check if the table exist
IF OBJECT_ID('ComptoireDB.dbo.clients', 'U') IS NOT NULL
BEGIN
    -- Drop the Tabel
    DROP TABLE CompotoireDB.dbo.clients;
END;
GO


-- CREATE Clients TABLE
CREATE TABLE ComptoireDB.dbo.clients(
    code_client VARCHAR(5),
    societe VARCHAR(40),
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






-- Check if the table exist
IF OBJECT_ID('ComptoireDB.dbo.produits', 'U') IS NOT NULL
BEGIN
    -- Drop the Tabel
    DROP TABLE ComptoireDB.dbo.produits;
END;
GO

-- CREATE Produits TABLE
CREATE TABLE ComptoireDB.dbo.produits(
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
        REFERENCES ComptoireDB.dbo.categories(code_categorie)
);








-- Check if the table exist
IF OBJECT_ID('ComptoireDB.dbo.commandes', 'U') IS NOT NULL
BEGIN
    -- Drop the Tabel
    DROP TABLE ComptoireDB.dbo.commandes;
END;
GO



-- CREATE Commmnades TABLE
CREATE TABLE ComptoireDB.dbo.commandes(
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
        REFERENCES ComptoireDB.dbo.clients(code_client)
);






-- Check if the table exist
IF OBJECT_ID('ComptoireDB.dbo.details_commande', 'U') IS NOT NULL
BEGIN
    -- Drop the Tabel
    DROP TABLE ComptoireDB.dbo.details_commande;
END;
GO


-- CREATE Details_Commandes
CREATE TABLE ComptoireDB.dbo.details_commande(
    num_commande VARCHAR(6) NOT NULL,
    ref_produit VARCHAR(4) NOT NULL,
    quantite INT NOT NULL DEFAULT 1,
    remise FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT DETAILS_COMMANDE_FK1 FOREIGN KEY (ref_produit)
        REFERENCES ComptoireDb.dbo.produits(ref_produit),
    CONSTRAINT DETAILS_COMMANDE_FK2 FOREIGN KEY (num_commande)
        REFERENCES ComptoireDb.dbo.commandes(num_commande)
);



-- ADD The Indexs To Produit Table
IF EXISTS (
    SELECT 1 
    FROM sys.indexes 
    WHERE name = 'PRODUITS_INDEX1' 
        AND object_id = OBJECT_ID('ComptoireDB.dbo.produits')
)
BEGIN
    DROP INDEX PRODUITS_INDEX1 ON ComptoireDB.dbo.produits ;
END;
CREATE INDEX PRODUITS_INDEX1 ON ComptoireDB.dbo.produits(code_categorie);
GO

IF EXISTS (
    SELECt 1 
    FROM sys.indexes 
    WHERE name = 'PRODUITS_INDEX2' 
        AND object_id = OBJECT_ID('ComptoireDB.dbo.produits')
)
BEGIN
    DROP INDEX PRODUITS_INDEX2 ON ComptoireDB.dbo.produits;  
END;
CREATE INDEX PRODUITS_INDEX2 ON ComptoireDB.dbo.produits(nom_produit);
GO



-- Add The Index To Commandes Table
DROP INDEX IF EXISTS COMMANDES_INDEX1 ON ComptoireDB.dbo.commandes; 
CREATE INDEX COMMANDES_INDEX1 ON ComptoireDB.dbo.commandes(code_postale_livraison);
GO

DROP INDEX IF EXISTS COMMANDES_INDEX2 ON ComptoireDB.dbo.commandes;
CREATE INDEX COMMANDES_INDEX2 ON ComptoireDB.dbo.commandes(date_commande);
GO

DROP INDEX IF EXISTS COMMANDES_INDEX3 ON ComptoireDB.dbo.commandes;
CREATE INDEX COMMANDES_INDEX3 ON ComptoireDB.dbo.commandes(date_envoi);
GO




-- Description of Tables
EXEC sp_help 'ComptoireDB.dbo.categories';
EXEC sp_help 'ComptoireDB.dbo.clients';
EXEC sp_help 'ComptoireDB.dbo.commandes';
EXEC sp_help 'ComptoireDB.dbo.produits';
EXEC sp_help 'ComptoireDB.dbo.details_commande';



-- Indexs
EXEC sp_helpindex 'ComptoireDB.dbo.commandes';
EXEC sp_helpindex 'ComptoireDB.dbo.produits';

