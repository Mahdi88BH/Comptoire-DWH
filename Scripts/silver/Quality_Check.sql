
PRINT("===========================================================");
PRINT("Quality Check FROM categories TBALE")
PRINT("===========================================================");
SELECT * FROM bronze.categories;

SELECT * FROM bronze.categories;

-- Check duplicate key

SELECT 
    code_categorie,
    COUNT(*) AS nbr_primary_key
FROM bronze.categories
GROUP BY code_categorie
HAVING COUNT(*) > 1;

-- the key are not duplicate



-- incoerance primary ke
SELECT *
FROM bronze.categories
WHERE  PATINDEX( 'CAT[0-9]%', code_categorie) != 1;





-- check for duplicate nom_category

SELECT * 
FROM bronze.categories;


WITH CTE_categories AS(
SELECT 
    TRIM(REPLACE(
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
    '+ë', 'é')) AS nom_categorie,
    [description]
FROM bronze.categories
WHERE TRIM(REPLACE((nom_categorie), '"', '')) != 'NULL'
    OR nom_categorie IS NULL
)
SELECT
    nom_categorie,
    COUNT(*)
FROM CTE_categories
GROUP BY nom_categorie
HAVING COUNT(*) > 1;





-- check Quality of desciption column

SELECT 
    nom_categorie,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(CAST([description] AS NVARCHAR(MAX)), N'├⌐', N'é')
                            , N'├', N'ô'), 
                        N'ô¿', N'è'), 
                    N'┼ô', N'ô'), 
                N'ô¬', N'ê'), 
            N'ôá', N'à'), 
        N'ΓÇÖ', N' '), 
    N'ôë', N'è')  AS description
FROM bronze.categories;



PRINT("===========================================================");
PRINT("Quality Check FROM clients TBALE")
PRINT("===========================================================");
SELECT * FROM bronze.clients;



-- check for duplicate key primary

SELECT
    code_client,
    COUNT(*)
FROM bronze.clients
GROUP BY code_client
HAVING COUNT(*) > 1;


SELECT
    code_client,
    CASE 
        WHEN REPLACE(REPLACE(REPLACE(REPLACE(TRIM(REPLACE(societe, '"', '')), '-', ' '), '+¦', 'à'), '+¬', 'é'), '_', ' ') = ' ' THEN 'Societe Not Avaliable'
        ELSE REPLACE(REPLACE(REPLACE(REPLACE(TRIM(REPLACE(societe, '"', '')), '-', ' '), '+¦', 'à'), '+¬', 'é'), '_', ' ')
    END AS societe
FROM bronze.clients
WHERE code_client NOT IN ('ALFKI','CL010', 'CL016', 'MARO2');



-- Quality societe

SELECT
    societe 
FROM bronze.clients
WHERE societe != TRIM(societe);




SELECT
    code_postale
FROM bronze.clients
WHERE code_postale != TRIM(code_postale);


SELECT
    REPLACE(REPLACE(contact, '_', ' '), '+¡', 'i') AS contact
FROM bronze.clients
WHERE contact IS NOT NULL AND contact != 'NULL' AND contact NOT IN ('M. Anders', 'M. Sommer', 'Y. Amrani', 'A. Hassan', 'CASABLANCA');


SELECT fonction
FROM bronze.clients
WHERE fonction != TRIM(fonction);



SELECT 
    fonction,
    CASE fonction
        WHEN 'NULL' THEN 'Information not Avaliable'
        WHEN 'OWNER' THEN 'Owner'
        ELSE fonction
    END AS fonction
FROM bronze.clients;


SELECT 
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(adresse, '+¦', 'ó'), '+¬', 'é'), '+¿', 'è'), '-', ' '), '+ƒ', 'ß') adresse
FROM bronze.clients
WHERE adresse IS NOT NULL;



SELECT 
    ville
FROM bronze.clients;







PRINT("===========================================================");
PRINT("Quality Check FROM produits TBALE")
PRINT("===========================================================");
SELECT * 
FROM bronze.produits;



-- check duplicate  Primary Key
SELECT
    ref_produit,
    COUNT(*)
FROM bronze.produits
GROUP BY ref_produit
HAVING COUNT(*) > 1;




-- Unwanted space
SELECT 
    nom_produit
FROM bronze.produits
WHERE nom_produit != TRIM(nom_produit);



SELECT DISTINCT 
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
        '</b>', '') AS nom_produit
FROM bronze.produits
WHERE nom_produit != 'Produit <script>alert("hack")</script>'
ORDER BY 1;



SELECT 
    code_categorie
FROM bronze.produits;



SELECT 
    code_categorie
FROM bronze.produits
WHERE code_categorie != 'NULL' AND  PATINDEX('CAT[0-9]%', code_categorie) = 1;

SELECT
    REPLACE(REPLACE(REPLACE(quantite_unite, '+¬', ''), '+«', 'i'), 'barq.', 'barquette') AS quantite_unite
FROM bronze.produits
WHERE quantite_unite != 'NULL';


SELECT 
    CASE 
    WHEN ABS(prix_unitaire) >= 1000000.0000 THEN 1000.0000
    WHEN ABS(prix_unitaire) = 0.0000 THEN 1.0000
    ELSE ABS(prix_unitaire)
    END prix_unitaire
FROM bronze.produits
ORDER BY 1 DESC;

SELECT MAX(ABS(prix_unitaire)) max, MIN(ABS(prix_unitaire)) min
FROM bronze.produits;


SELECT ABS(prix_unitaire)
FROM bronze.produits
ORDER BY 1 DESC;




PRINT("===========================================================");
PRINT("Quality Check FROM produits TBALE")
PRINT("===========================================================");
SELECT * 
FROM bronze.produits;