


-- SELECT The DataBase
USE ComptoireDB;
GO





-- DELETE Record FROM Child tables first
DELETE FROM ComptoireDB.dbo.details_commande;
GO


-- DELETE Record FROM Parent tables
DELETE FROM ComptoireDB.dbo.commandes;
DELETE FROM ComptoireDB.dbo.produits;
GO


DELETE FROM ComptoireDB.dbo.categories;
DELETE FROM ComptoireDB.dbo.clients;
GO





PRINT('==========================================================================')
PRINT('Insertion Complete For Table categories')
PRINT('==========================================================================')
INSERT INTO ComptoireDB.dbo.categories (code_categorie, nom_categorie, description) 
VALUES
('CAT01', 'Boissons', 'Sodas, cafés, thés'), -- Valid record
('CAT02', ' BOISSONS', 'Duplicate of CAT01: Leading space and case mismatch'),
('CAT03', 'Condiments', NULL), -- Valid record (Optional description)
('CAT04', 'Produits laitiers', 'Fromages, yaourts et laitages'), -- Valid record
('CAT05', 'PRODUITS LAITIERS_', 'Semantic Duplicate: Same name as CAT04 in uppercase'), 
('CAT06', 'Grains/Céréales', 'Riz, blé, pâtes...'), -- Valid record
('CAT07', 'Confitures & Sirops', 'Special characters: Ampersand might need encoding handling'), 
('CAT08', '  Viandes  ', 'Data Padding: Trailing and leading spaces in name'), 
('CAT_ERR', 'Test Error', 'Trash Data: Technical test record to be filtered out'),
('CAT09', 'Boisson_  ', 'Trailing space in name'),
('CAT10', 'boissons__', 'Lowercase duplicate of CAT01'),
('CAT11', 'Snacks', ''),
('CAT12', 'Sn@cks', 'Invalid character @'),
('CAT13', NULL, 'Missing category name'),
('CAT14', 'Viandes', 'Same semantic as CAT08 but different naming'),
('CAT15', 'Viandes!', 'Punctuation noise'),
('CAT16', '12345', 'Numeric category name'),
('CAT17', 'Fruits & légumes', 'Special character &'),
('CAT18', 'Fruits et legumes', 'Same as CAT17 without accents'),
('CAT19', 'Boissons_sans_sucre', 'Boissons light ou zero'),
('CAT20', 'Produits_bio', 'Produits issus de l agriculture biologique'),
('CAT21', 'Plats_prepares', 'Plats prêts à consommer'),
('CAT22', 'Produits_surgeles', 'Produits congelés'),
('CAT23', 'Epicerie_salee', 'Conserves, sauces, épices'),
('CAT24', 'Epicerie_sucree', 'Biscuits, chocolat, confiseries'),
('CAT25', 'Produits_importes', 'Produits venant de l etranger'),
('CAT26', 'Produits_locaux', 'Production locale'),
('CAT27', 'Autres_produits', NULL),
('CAT_TEST', 'Categorie_temporaire', 'Catégorie de test à exclure');






PRINT('==========================================================================')
PRINT('Insertion Complete For Table clients')
PRINT('==========================================================================')
INSERT INTO ComptoireDB.dbo.clients (code_client, societe, contact, fonction, adresse, ville, region, code_postale, pays, telephone, fax) 
VALUES
('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Manager', 'Obere Str. 57', 'Berlin', 'Berlin', '12209', 'Germany', '030-0074321', NULL),
('ANATR', 'Ana Trujillo Emparedados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', 'Distrito Federal', '05021', 'Mexico', '(5) 555-4729', NULL),
('ALFK2', 'Alfreds Futterkiste ', 'M. Anders', 'Sales Rep', 'Obere Str. 57', 'berlin', 'BERLIN', '12209', 'GERMANY', '0300074321', ''),
('DUMMY', '   Société Test   ', NULL, NULL, 'Adresse inconnue', 'Paris', 'Île-de-France', '75000', 'france', 'not-a-phone', NULL),
('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Purchasing Manager', 'C/ Araquil 67', 'Madrid', 'Madrid', '28023', 'Spain', '(91) 555 22 82', NULL),
('BOLI2', 'Bolido Comidas', 'M. Sommer', 'Buyer', 'Calle Araquil 67', 'madrid', 'MADRID', '28023', 'Espagne', '915552282', ''),
('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Owner', 'Kirchgasse 6', 'Graz', 'Styria', '8010', 'Austria', '7675-3425', NULL),
('ERNS2', 'Ernst Handel Inc.', 'Roland Mendel', 'CEO', 'Kirchgasse 6', 'GRAZ', 'STYRIA', '8010', 'Autriche', '76753425', NULL),
('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Manager', 'Taucherstraße 10', 'Cunewalde', 'Saxony', '01307', 'Germany', '0372-035188', NULL),
('NULL1', 'Société Inconnue', NULL, NULL, 'Adresse inconnue', 'Paris', 'Île-de-France', '75000', 'France', '01-02-03-04-05', NULL),
('GHOST', '  ', '', NULL, '', 'Londres', 'London', 'SW1A', 'UK', '12345', ''),
('LONGT', 'UneSociété avecunnom beaucoup trop long', 'Jean Bon', 'Director', '12 rue très très longue', 'Lyon', 'Auvergne-Rhône-Alpes', '69000', 'France', '0400000000', NULL),
('MAROC', 'Sidi Ali Store', 'Casablanca', 'Owner', 'Centre Ville', 'Casablanca', 'Souss-Massa', '20000', 'Morocco', '0600000000', NULL),
('MARO2', 'Sidi Ali Store', 'CASABLANCA', 'OWNER', 'Centre-ville', 'Casablanca', 'Souss Massa', '20 000', 'Maroc', '06 00 00 00 00', ''),
('USA01', 'NYC Tech', 'New York', 'IT Manager', '5th Avenue', 'New York', 'NY', '10001', 'USA', '2125550000', NULL),
('USA02', 'LA Goods', 'Los Angeles', 'Sales', 'Sunset Blvd', 'Los Angeles', 'California', 'CA-90001', 'United States', '3235550000', NULL),
('FRA01', 'Lille Shop', 'Lille', 'Store Manager', 'Grand Place', 'Lille', 'Hauts-de-france', '59000', 'France', '0320000000', NULL),
('FRA02', 'Lyon Shop', 'Lyon', 'Manager', 'Rue de Lyon', 'Lyon', NULL, '69', 'France', '0470000000', NULL),
('CL009', 'Alpha Market', 'Youssef Amrani', 'Owner', 'Avenue Mohammed V', 'Rabat', 'Rabat-Salé', '10000', 'Morocco', '0611111111', NULL),
('CL010', 'alpha market ', 'Y. Amrani', 'OWNER', 'Av. Mohammed V', 'rabat', 'RABAT', '10000', 'MAROC', '06 11 11 11 11', ''),
('CL011', 'Beta Shop', 'Claire Martin', 'Sales Manager', 'Rue Massena', 'Nice', 'PACA', '06000', 'France', '+33-4-00-00-00-00', NULL),
('CL012', 'Gamma Store', NULL, NULL, 'Adresse inconnue', 'Toulouse', 'Occitanie', '31000', 'France', '0400000001', NULL),
('CL013', 'Delta-Shop', 'Jean Dupont', 'Director', 'Centre Ville', 'TOULOUSE', 'OCCITANIE', '31000', 'FR', '04 00 00 00 02', NULL),
('CL014', 'Epsilon', 'Unknown', NULL, 'Unknown', 'Unknown', 'Unknown', NULL, 'Unknown', 'N/A', NULL),
('CL015', 'Zeta Commerce', 'Ali Hassan', 'Owner', 'Rue Hassan II', 'Fes', 'Fès-Meknès', '30000', 'Morocco', '0600000002', NULL),
('CL016', 'Zeta-Commerce', 'A. Hassan', 'OWNER', 'Rue Hassan II', 'FÈS', 'FES-MEKNES', '30000', 'Maroc', '06-00-00-00-02', '');





PRINT('==========================================================================')
PRINT('Insertion Complete For Table produits')
PRINT('==========================================================================')
INSERT INTO ComptoireDB.dbo.produits (ref_produit, nom_produit, code_categorie, quantite_unite, prix_unitaire, unite_stock, unites_commandees, niveau_reapro, indisponsible) 
VALUES
('P001', 'Chai', 'CAT01', '10 boxes x 20 bags', 18.00, 39, 10, 15, 0),
('P002', 'chai', 'CAT01', '10 boxes x 20 bags', 18.00, 39, 5, 15, 0),
('P003', 'Chang', 'CAT01', '24 - 12 oz bottles', -5.00, 17, 0, 10, 0),
('P004', 'Aniseed Syrup', 'CAT03', '12 - 550 ml bottles', 1000000.00, 13, 2, 5, 0),
('P005', 'Chef Antons Gumbo', 'CAT01', '36 boxes', 21.35, NULL, 4, 20, 0),
('P006', 'Mishi Kobe Niku', 'CAT08', '18 - 500 g pkgs.', 97.00, 29, 1, 5, 0),
('P007', 'Alice Mutton', 'CAT08', '20 - 1 kg tins', 39.00, 0, 10, 10, 1),
('P008', 'Produit Sans Catégorie', NULL, 'Unknown', 15.50, 10, 0, 5, 0),
('P009', 'Erreur de Prix', 'CAT04', '12 units', -10.00, 5, 1, 10, 0),
('P010', 'Produit Gratuit', 'CAT06', '100 units', 0.00, 100, 50, 20, 0),
('P011', 'Laitue', 'CAT04', 'bulk', 2.50, -50, 0, 30, 1),
('P012', 'Test doublon', 'CAT01', '10 units', 10.00, 10, 2, 5, 0),
('P013', 'Test doublon', 'CAT01', '10 units', 10.00, 10, 3, 5, 0),
('P014', 'Sirop d''érable', 'CAT07', '12 bouteilles', 25.00, 50, 5, 10, 0),
('P015', 'Maple Syrup', 'CAT07', '12 bottles x 500ml', 25.00, 45, 3, 10, 0),
('P016', 'Pâte de thon', 'CAT01', '10 kg', 15.50, 10, 1, 5, 0),
('P017', 'Thon en boîte', 'CAT01', '10000 gr', 15.50, 10, 2, 5, 0),
('P018', 'Produit <script>alert("hack")</script>', 'CAT01', '1 unit', 1.00, 1, 0, 1, 0),
('P019', 'Café Noir', 'CAT01', 'Paquet de 5', 20.00, NULL, 10, 15, 0),
('P020', 'Eau Minérale', 'CAT01', '6 x 1.5L', 3.50, 200, 20, 50, 0),
('P021', 'eau minerale', 'CAT01', '6x1500ml', 3.50, 200, 25, 50, 0),
('P022', 'Eau Minérale ', 'CAT01', '1.5 L', 3500, 200, 1, 50, 0),
('P023', 'Fromage', 'CAT04', '1 kg', 0.50, 1000, 100, 200, 0),
('P024', 'Fromage', 'CAT04', '1000 gr', 0.50, 1000, 150, 200, 0),
('P025', 'Test Produit', 'CAT_ERR', '1 unit', 10.00, 10, 0, 5, 0),
('P026', 'Produit NULL', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('P027', '<b>Lait</b>', 'CAT04', '1L', 1.20, 50, 5, 20, 0),
('P028', 'Pain', 'CAT06', '1 piece', -1.00, 100, 10, 30, 0),
('P029', 'Pain', 'CAT06', '1 piece', 1.00, -100, 0, 30, 1),
('P030', 'Jus d orange', 'CAT19', '6 x 1L', 12.00, 120, 15, 40, 0),
('P031', 'Jus d’orange', 'CAT19', '6000 ml', 12.00, 120, 20, 40, 0),
('P032', 'Pizza Surgelée', 'CAT22', '1 piece', 3.50, 500, 50, 100, 0),
('P033', 'Pizza surgellee', 'CAT22', '1 unité', 3.50, 480, 60, 100, 0),
('P034', 'Pâtes Bio', 'CAT20', '500 g', 1.20, 1000, 200, 300, 0),
('P035', 'Pates BIO', 'CAT20', '0.5 kg', 1.20, 950, 180, 300, 0),
('P036', 'Plat préparé', 'CAT21', '1 barquette', 4.00, NULL, 30, 50, 0),
('P037', 'Plat prepare', 'CAT21', '1 barq.', -4.00, 200, 0, 50, 1),
('P038', 'Produit Importé', 'CAT25', '12 units', 1000.00, 5, 1, 2, 0),
('P039', 'Produit local', 'CAT26', '12 unités', 1.00, -20, 0, 10, 1);





PRINT('==========================================================================')
PRINT('Insertion Complete For Table commandes')
PRINT('==========================================================================')
INSERT INTO ComptoireDB.dbo.commandes 
(num_commande, code_client, date_commande, date_livraison, date_envoi, port, destination, adresse_livraison, ville_livraison, region_livraison, code_postale_livraison, pays_livraison) 
VALUES
('C1001', 'ALFKI', '2023-01-01', NULL, '2023-01-02', 0, 'Europe', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
('C1002', 'ANATR', '1900-01-01', NULL, NULL, 0, 'North America', 'Av. Insurgentes Sur 1602', 'Mexico City', NULL, '03940', 'mexico'),
('C1003', 'ALFKI', '2025-12-25', NULL, NULL, 0, 'Europe', 'Obere Str. 57', 'Berlin', NULL, '12209', 'GERMANY '),
('C1004', 'DUMMY', '2023-05-10', NULL, '2023-05-11', 0, 'Europe', '10 Rue de Test', 'Paris', 'Île-de-France', '75000', 'Fr'),
('C1005', 'BOLID', '2023-10-01', '2023-10-05', '2023-10-02', 10, 'Europe', 'Calle del Prado 12', 'Madrid', 'Madrid', '28014', 'Spain'),
('C1006', 'ERNSH', '2023-12-01', '2023-11-01', '2023-12-02', 15, 'Europe', 'Herrengasse 1', 'Graz', 'Styria', '8010', 'Austria'),
('C1007', 'QUICK', '2024-01-15', NULL, '2024-01-16', 20, 'Europe', 'Taucherstraße 10', 'Cunewalde', NULL, '02733', 'Germany'),
('C1008', 'BOLI2', '2023-10-01', '2023-10-05', '2023-10-02', 10, 'Europe', 'Calle Mayor 1', 'madrid', 'Madrid', '28013', 'Espagne'),
('C1009', 'GHOST', '1900-01-01', '1900-01-01', NULL, 0, 'Europe', 'Unknown', 'Londres', NULL, '00000', 'UK'),
('C1010', 'ALFKI', '2023-05-20', '2023-05-25', '2023-05-21', 45, 'North America', 'Obere Str. 57', 'Berlin', NULL, '12209', 'États-Unis'),
('C1011', 'ALFKI', '2023-05-20', '2023-05-25', '2023-05-21', 45, 'North America', 'Obere Str. 57', 'Berlin', NULL, '12209', 'USA'),
('C1012', 'MAROC', '2023-06-01', NULL, '2023-06-02', 50, 'Africa', 'Boulevard Zerktouni', 'Casablanca', 'Casa-Settat', '20000', 'Morocco'),
('C1013', 'USA01', '2023-06-02', NULL, '2023-06-03', 5000, 'North America', '5th Avenue', 'New York', 'NY', '10001', 'USA'),
('C1014', 'FRA01', '2023-06-03', NULL, '2023-06-04', -10.5, 'Europe', '20 Rue Faidherbe', 'Lille', 'Hauts-de-France', '59000', 'France'),
('C1015', 'ALFKI', '2023-01-01', NULL, '2023-01-02', 0, 'Europe', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany'),
('C1016', 'MAROC', '2023-06-10', NULL, NULL, 25, 'Africa', 'Rue Hassan II', 'Casa', 'Casa-Settat', '20000', 'Morocco'),
('C2001', 'ALFKI', '1753-01-01', NULL, NULL, 0, 'Europe', '1 Rue Test', 'Paris', 'Île-de-France', '75001', 'France'),
('C2002', 'ANATR', '2023-02-28', NULL, NULL, 10, 'Europe', 'Quai du Port', 'Marseille', 'Provence-Alpes', '13002', 'France'),
('C2003', 'DUMMY', '2023-03-01', '2023-03-01', '2023-03-01', 0, 'Europe', 'Rue du Panier', 'Marseille', 'PACA', '13002', 'FR'),
('C2004', 'BOLID', '2023-03-05', '2024-03-05', '2023-03-06', 9999, 'Europe', 'Rue Paradis', 'Marseille', 'PACA', '13008', 'France'),
('C2005', 'ALFKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('C2006', 'MAROC', '2023-04-01', NULL, '2023-04-02', 15, 'Unknown', 'Unknown', 'Unknown', NULL, NULL, 'Unknown'),
('C3001', 'CL009', '2023-07-01', '2023-07-03', '2023-07-02', 20, 'Africa', 'Avenue Mohammed V', 'Rabat', 'Rabat-Sale', '10000', 'Morocco'),
('C3002', 'CL010', '2023-07-01', NULL, NULL, 20, 'Africa', 'Av. Mohammed V', 'rabat', 'Rabat', '10000', 'MAROC'),
('C3003', 'CL011', '1900-01-01', NULL, NULL, 0, 'Europe', 'Promenade des Anglais', 'Nice', 'Provence-Alpes', '06000', 'France'),
('C3004', 'CL012', '2024-12-31', NULL, NULL, 15, 'Europe', 'Place du Capitole', 'Toulouse', 'Occitanie', '31000', 'France'),
('C3005', 'CL013', '2023-08-15', '2023-08-10', '2023-08-16', 10, 'Europe', 'Rue Alsace Lorraine', 'Toulouse', 'Occitanie', '31000', 'FR'),
('C3006', 'CL009', '2023-09-01', NULL, NULL, 5, 'Unknown', 'Unknown', 'Unknown', NULL, NULL, 'Unknown');





PRINT('==========================================================================')
PRINT('Insertion Complete For Table details_commande')
PRINT('==========================================================================')
INSERT INTO ComptoireDB.dbo.details_commande (num_commande, ref_produit, quantite, remise) 
VALUES
('C1001', 'P001', 10, 0),
('C1001', 'P003', 1, 0),          
('C1002', 'P001', 50, 0.15),      
('C1003', 'P004', 1, 0.05),       
('C1005', 'P006', 5, 0),
('C1005', 'P007', 2, 0.1),
('C1006', 'P001', 1, 0),
('C1007', 'P008', 10, 0),         
('C1008', 'P006', 5, 0),
('C1009', 'P010', 1, 0.5),        
('C1010', 'P001', 5, 0),          
('C1011', 'P001', 1, 0.5),        
('C1012', 'P014', 5, 0),
('C2001', 'P020', 1, 0),
('C2001', 'P021', 1, 0),
('C2002', 'P022', 10, 0),         
('C2003', 'P023', 1, 0),
('C2004', 'P024', 1, 0),
('C2005', 'P026', 1, 0),          
('C2006', 'P027', 1, 0),          
('C3001', 'P030', 10, 0),
('C3001', 'P031', 10, 0),
('C3002', 'P032', 1, 0),          
('C3003', 'P033', 10, 0.2),
('C3004', 'P034', 5, 0),
('C3005', 'P035', 2, 0),
('C3006', 'P039', 1, 0);          


SELECT *
FROM ComptoireDB.dbo.categories;

SELECT *
FROM ComptoireDB.dbo.clients;

SELECT *
FROM ComptoireDB.dbo.produits;

SELECT *
FROM ComptoireDB.dbo.commandes;

SELECT *
FROM ComptoireDB.dbo.details_commande;
