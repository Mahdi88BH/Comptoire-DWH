

SELECT * FROM bronze.categories;


WITH CTE_categorie AS(
SELECT
    code_categorie,
    TRIM(REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(nom_categorie, '"', ''),
                                '+¬', 'é'), 
                            '/', ' '),
                        '_', ' '), 
                    '+¿', 'è'), 
                '+ó', 'a'), 
            '&', 'et'), 
        '+ë', 'é'), 
    '00', '')) AS nom_categorie,
    [description]
FROM bronze.categories
WHERE  PATINDEX( 'CAT[0-9]%', code_categorie) = 1
    AND TRIM(REPLACE((nom_categorie), '"', '')) != 'NULL'
    AND [description] IS NOT NULL
), CTE1_categorie AS (
    SELECT * 
    FROM CTE_categorie
    WHERE nom_categorie NOT IN ('BOISSONS', 'PRODUITS LAITIERS', 'Boisson', 'Sn@cks', 'Viandes!', '12345', 'Fruits et légumes', 'Boissons00'
    ,'Produits laitiers10', 'Boulangerie65', 'Produits bio', 'Viandes')
), CTE2_categorie AS (
    SELECT 
        code_categorie,
        nom_categorie,
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(CAST([description] AS NVARCHAR(MAX)), N'├⌐', N'é')
                                ,   N'├', N'ô'), 
                                N'ô¿', N'è'), 
                            N'┼ô', N'ô'), 
                        N'ô¬', N'ê'), 
                    N'ôá', N'à'), 
                N'ΓÇÖ', N' '), 
            N'ôë', N'è'), 
        N'"', '')  AS description
    FROM CTE1_categorie
)
INSERT INTO silver.categories (code_categorie, nom_categorie, description)
SELECT 
    code_categorie,
    nom_categorie,
    CASE
    WHEN [description] = 'NULL' THEN 'Description not Available'
    WHEN [description] = 'NULL' THEN  'Special characters: Ampersand might need encoding handling'
    WHEN [description] = 'NULL' THEN  'Same as CAT17 without accents'
    ELSE [description]
    END AS description
FROM CTE2_categorie;


SELECT * 
FROM silver.categories;






-- Quelity Client Table

INSERT INTO silver.clients (code_client, societe, contact, fonction, adresse, ville, region, code_postale, pays, telephone, fax)
SELECT
    code_client,
    CASE 
        WHEN REPLACE(REPLACE(REPLACE(REPLACE(TRIM(REPLACE(societe, '"', '')), '-', ' '), '+¦', 'à'), '+¬', 'é'), '_', ' ') = ' ' THEN 'Societe Not Avaliable'
        ELSE REPLACE(REPLACE(REPLACE(REPLACE(TRIM(REPLACE(societe, '"', '')), '-', ' '), '+¦', 'à'), '+¬', 'é'), '_', ' ')
    END AS societe,
    REPLACE(REPLACE(contact, '_', ' '), '+¡', 'i') AS contact,
    CASE fonction
        WHEN 'NULL' THEN 'Information not Avaliable'
        WHEN 'OWNER' THEN 'Owner'
        ELSE fonction
    END AS fonction,
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(adresse, '+¦', 'ó'), '+¬', 'é'), '+¿', 'è'), '-', ' '), '+ƒ', 'ß'), '/', 'alle') adresse,
    CASE REPLACE(ville, '+¬', 'é')
        WHEN 'Unknown' THEN 'Not Avialable'
        ELSE REPLACE(ville, '+¬', 'é')
    END ville,
    REPLACE(REPLACE(REPLACE(region, '+¬', 'é'), '+¿', 'è'), '+¦', 'ô') region,
    REPLACE(REPLACE(code_postale, '-', ''), ' ', '') code_postale,
    CASE pays
        WHEN 'FR' THEN 'France'
        WHEN 'USA' THEN 'United States'
        WHEN 'UK' THEN 'United Kingdom'
        ELSE pays
    END pays,
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(telephone, '(', ''), ')', ''), '-', ''), ' ', ''), '+', '') as telephone,
    CASE fax
        WHEN 'Null' THEN 'Not Available'
        ELSE fax
    END AS fax
FROM bronze.clients
WHERE code_client NOT IN ('ALFKI','CL010', 'CL016', 'MARO2')
    AND contact IS NOT NULL AND contact != 'NULL' AND contact NOT IN ('M. Anders', 'M. Sommer', 'Y. Amrani', 'A. Hassan', 'CASABLANCA')
    AND adresse IS NOT NULL;



SELECT * 
FROM silver.clients;










INSERT INTO silver.produits (ref_produit, nom_produit, code_categorie, quantite_unite, prix_unitaire, unite_stock, unites_commandees, niveau_reapro, indisponsible)
SELECT 
    ref_produit,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(nom_produit, '+¬', 'è'),
                                    '+ó', 'â'), 
                                '+«', 'i'), 
                            'GÇÖ', ' '), 
                        '+ô', 'œ'), 
                    '+¿', 'è'), 
                '+¦', 'ô'), 
            '<b>', ''), 
        '</b>', '') AS nom_produit,
        code_categorie,
        REPLACE(REPLACE(REPLACE(REPLACE(quantite_unite, '+¬', ''), '+«', 'i'), 'barq.', 'barquette'), 'oz', 'ml') AS quantite_unite,
        CASE 
            WHEN ABS(prix_unitaire) >= 1000000.0000 THEN 1000.0000
            WHEN ABS(prix_unitaire) = 0.0000 THEN 1.0000
        ELSE ABS(prix_unitaire)
        END prix_unitaire,
        ABS(unite_stock) unite_stock,
        ABS(unites_commandees) unites_commandees,
        ABS(niveau_reapro) niveau_reapro,
        ABS(indisponsible) indisponsible
FROM bronze.produits
WHERE nom_produit != 'Produit <script>alert("hack")</script>'
    AND code_categorie != 'NULL' AND  PATINDEX('CAT[0-9]%', code_categorie) = 1
    AND quantite_unite != 'NULL';

  
SELECT * FROM silver.produits;