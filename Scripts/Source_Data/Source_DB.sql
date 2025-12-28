


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

-- Additional categories
INSERT INTO ComptoireDB.dbo.categories (code_categorie, nom_categorie, description)
VALUES
('CAT28', 'Boissons_energetiques', 'Boissons énergétiques'),
('CAT29', 'Boulangerie', 'Pains, viennoiseries'),
('CAT30', 'Hygiene', 'Soins et hygiène');

-- Bulk categories to reach 100
INSERT INTO ComptoireDB.dbo.categories (code_categorie, nom_categorie, description)
VALUES
('CAT31', 'Boissons00', 'Boissons non alcoolisées et alcoolisées'),
('CAT32', 'Produits laitiers10', 'Lait, fromage, beurre et dérivés'),
('CAT33', 'Fruits frais', 'Fruits frais de saison'),
('CAT34', 'Légumes frais', 'Légumes frais et biologiques'),
('CAT35', 'Viandes rouges', 'Bœuf, agneau et viande bovine'),
('CAT36', 'Volailles', 'Poulet, dinde et autres volailles'),
('CAT37', 'Poissons', 'Poissons frais et surgelés'),
('CAT38', 'Fruits de mer', 'Crevettes, moules, calamars'),
('CAT39', 'Produits surgelés', 'Aliments congelés prêts à l’emploi'),
('CAT40', 'Épicerie sucrée', 'Sucre, chocolat, confiseries'),
('CAT41', 'Épicerie salée', 'Pâtes, riz, conserves'),
('CAT42', 'Céréales', 'Céréales pour petit-déjeuner'),
('CAT43', 'Boulangerie65', 'Pain et produits de boulangerie'),
('CAT44', 'Pâtisserie', 'Gâteaux et desserts'),
('CAT45', 'Snacks00', 'Chips, biscuits apéritifs'),
('CAT46', 'Sauces', 'Sauces et condiments'),
('CAT47', 'Huiles alimentaires', 'Huiles végétales et olive'),
('CAT48', 'Produits bio', 'Produits issus de l’agriculture biologique'),
('CAT49', 'Produits diététiques', 'Produits faibles en sucre ou en sel'),
('CAT50', 'Alimentation bébé', 'Produits pour nourrissons'),
('CAT51', 'Produits ménagers', 'Produits de nettoyage'),
('CAT52', 'Hygiène corporelle', 'Savons, shampoings, gels'),
('CAT53', 'Cosmétiques', 'Produits de beauté'),
('CAT54', 'Parfumerie', 'Parfums et eaux de toilette'),
('CAT55', 'Papeterie', 'Articles de bureau'),
('CAT56', 'Fournitures scolaires', 'Cahiers, stylos, crayons'),
('CAT57', 'Électronique', 'Appareils électroniques'),
('CAT58', 'Petit électroménager', 'Appareils domestiques'),
('CAT59', 'Informatique', 'Ordinateurs et accessoires'),
('CAT60', 'Téléphonie', 'Téléphones et accessoires'),
('CAT61', 'Jeux vidéo', 'Consoles et jeux'),
('CAT62', 'Jouets', 'Jouets pour enfants'),
('CAT63', 'Articles de sport', 'Équipements sportifs'),
('CAT64', 'Vêtements homme', 'Habillement masculin'),
('CAT65', 'Vêtements femme', 'Habillement féminin'),
('CAT66', 'Vêtements enfant', 'Habillement enfant'),
('CAT67', 'Chaussures', 'Chaussures toutes catégories'),
('CAT68', 'Accessoires mode', 'Sacs, ceintures, bijoux'),
('CAT69', 'Montres', 'Montres et horlogerie'),
('CAT70', 'Bijouterie', 'Bijoux précieux'),
('CAT71', 'Meubles', 'Mobilier intérieur'),
('CAT72', 'Décoration', 'Objets décoratifs'),
('CAT73', 'Luminaires', 'Lampes et éclairages'),
('CAT74', 'Jardinage', 'Articles de jardin'),
('CAT75', 'Bricolage', 'Outils et matériel'),
('CAT76', 'Peinture', 'Peintures et accessoires'),
('CAT77', 'Quincaillerie', 'Visserie et fixations'),
('CAT78', 'Automobile', 'Accessoires auto'),
('CAT79', 'Moto', 'Équipements moto'),
('CAT80', 'Vélos', 'Vélos et accessoires'),
('CAT81', 'Librairie', 'Livres et manuels'),
('CAT82', 'Papier cadeau', 'Emballages et cadeaux'),
('CAT83', 'Musique', 'CD et instruments'),
('CAT84', 'Films', 'DVD et Blu-ray'),
('CAT85', 'Animaux', 'Produits pour animaux'),
('CAT86', 'Aquariophilie', 'Produits pour poissons'),
('CAT87', 'Oiseaux', 'Accessoires pour oiseaux'),
('CAT88', 'Reptiles', 'Produits pour reptiles'),
('CAT89', 'Pharmacie', 'Produits pharmaceutiques'),
('CAT90', 'Parapharmacie', 'Produits de santé'),
('CAT91', 'Compléments alimentaires', 'Vitamines et compléments'),
('CAT92', 'Fitness', 'Produits de remise en forme'),
('CAT93', 'Yoga', 'Accessoires de yoga'),
('CAT94', 'Camping', 'Matériel de camping'),
('CAT95', 'Randonnée', 'Équipement de randonnée'),
('CAT96', 'Voyage', 'Accessoires de voyage'),
('CAT97', 'Bagagerie', 'Valises et sacs'),
('CAT98', 'Sécurité', 'Équipements de sécurité'),
('CAT99', 'Bureau', 'Mobilier et accessoires bureau'),
('CAT100', 'Formation', 'Supports et matériels pédagogiques');





/*
INSERT INTO ComptoireDB.dbo.categories (code_categorie, nom_categorie, description)
VALUES
('CAT31', 'Categorie_31', 'Description de la categorie 31'),
('CAT32', 'Categorie_32', 'Description de la categorie 32'),
('CAT33', 'Categorie_33', 'Description de la categorie 33'),
('CAT34', 'Categorie_34', 'Description de la categorie 34'),
('CAT35', 'Categorie_35', 'Description de la categorie 35'),
('CAT36', 'Categorie_36', 'Description de la categorie 36'),
('CAT37', 'Categorie_37', 'Description de la categorie 37'),
('CAT38', 'Categorie_38', 'Description de la categorie 38'),
('CAT39', 'Categorie_39', 'Description de la categorie 39'),
('CAT40', 'Categorie_40', 'Description de la categorie 40'),
('CAT41', 'Categorie_41', 'Description de la categorie 41'),
('CAT42', 'Categorie_42', 'Description de la categorie 42'),
('CAT43', 'Categorie_43', 'Description de la categorie 43'),
('CAT44', 'Categorie_44', 'Description de la categorie 44'),
('CAT45', 'Categorie_45', 'Description de la categorie 45'),
('CAT46', 'Categorie_46', 'Description de la categorie 46'),
('CAT47', 'Categorie_47', 'Description de la categorie 47'),
('CAT48', 'Categorie_48', 'Description de la categorie 48'),
('CAT49', 'Categorie_49', 'Description de la categorie 49'),
('CAT50', 'Categorie_50', 'Description de la categorie 50'),
('CAT51', 'Categorie_51', 'Description de la categorie 51'),
('CAT52', 'Categorie_52', 'Description de la categorie 52'),
('CAT53', 'Categorie_53', 'Description de la categorie 53'),
('CAT54', 'Categorie_54', 'Description de la categorie 54'),
('CAT55', 'Categorie_55', 'Description de la categorie 55'),
('CAT56', 'Categorie_56', 'Description de la categorie 56'),
('CAT57', 'Categorie_57', 'Description de la categorie 57'),
('CAT58', 'Categorie_58', 'Description de la categorie 58'),
('CAT59', 'Categorie_59', 'Description de la categorie 59'),
('CAT60', 'Categorie_60', 'Description de la categorie 60'),
('CAT61', 'Categorie_61', 'Description de la categorie 61'),
('CAT62', 'Categorie_62', 'Description de la categorie 62'),
('CAT63', 'Categorie_63', 'Description de la categorie 63'),
('CAT64', 'Categorie_64', 'Description de la categorie 64'),
('CAT65', 'Categorie_65', 'Description de la categorie 65'),
('CAT66', 'Categorie_66', 'Description de la categorie 66'),
('CAT67', 'Categorie_67', 'Description de la categorie 67'),
('CAT68', 'Categorie_68', 'Description de la categorie 68'),
('CAT69', 'Categorie_69', 'Description de la categorie 69'),
('CAT70', 'Categorie_70', 'Description de la categorie 70'),
('CAT71', 'Categorie_71', 'Description de la categorie 71'),
('CAT72', 'Categorie_72', 'Description de la categorie 72'),
('CAT73', 'Categorie_73', 'Description de la categorie 73'),
('CAT74', 'Categorie_74', 'Description de la categorie 74'),
('CAT75', 'Categorie_75', 'Description de la categorie 75'),
('CAT76', 'Categorie_76', 'Description de la categorie 76'),
('CAT77', 'Categorie_77', 'Description de la categorie 77'),
('CAT78', 'Categorie_78', 'Description de la categorie 78'),
('CAT79', 'Categorie_79', 'Description de la categorie 79'),
('CAT80', 'Categorie_80', 'Description de la categorie 80'),
('CAT81', 'Categorie_81', 'Description de la categorie 81'),
('CAT82', 'Categorie_82', 'Description de la categorie 82'),
('CAT83', 'Categorie_83', 'Description de la categorie 83'),
('CAT84', 'Categorie_84', 'Description de la categorie 84'),
('CAT85', 'Categorie_85', 'Description de la categorie 85'),
('CAT86', 'Categorie_86', 'Description de la categorie 86'),
('CAT87', 'Categorie_87', 'Description de la categorie 87'),
('CAT88', 'Categorie_88', 'Description de la categorie 88'),
('CAT89', 'Categorie_89', 'Description de la categorie 89'),
('CAT90', 'Categorie_90', 'Description de la categorie 90'),
('CAT91', 'Categorie_91', 'Description de la categorie 91'),
('CAT92', 'Categorie_92', 'Description de la categorie 92'),
('CAT93', 'Categorie_93', 'Description de la categorie 93'),
('CAT94', 'Categorie_94', 'Description de la categorie 94'),
('CAT95', 'Categorie_95', 'Description de la categorie 95'),
('CAT96', 'Categorie_96', 'Description de la categorie 96'),
('CAT97', 'Categorie_97', 'Description de la categorie 97'),
('CAT98', 'Categorie_98', 'Description de la categorie 98'),
('CAT99', 'Categorie_99', 'Description de la categorie 99'),
('CAT100', 'Categorie_100', 'Description de la categorie 100');
*/





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

-- Additional clients
INSERT INTO ComptoireDB.dbo.clients (code_client, societe, contact, fonction, adresse, ville, region, code_postale, pays, telephone, fax)
VALUES
('CL017', 'Omega Retail', 'Samir Naji', 'Owner', 'Boulevard Mohammed VI', 'Marrakech', 'Marrakech-Safi', '40000', 'Morocco', '0600000003', NULL),
('CL018', 'Pacific Traders', 'Emily Chen', 'Buyer', '88 Market St', 'San Francisco', 'California', '94105', 'USA', '4155551234', NULL),
('CL019', 'Berlin Bazaar', 'Erik Vogel', 'Manager', 'Friedrichstr. 10', 'Berlin', 'Berlin', '10117', 'Germany', '0305556789', NULL),
('CL020', 'Nice Gourmand', 'Lucie Bernard', 'Sales', 'Avenue Jean Médecin', 'Nice', 'PACA', '06000', 'France', '0493000000', NULL);

-- Bulk clients to reach 100
INSERT INTO ComptoireDB.dbo.clients (code_client, societe, contact, fonction, adresse, ville, region, code_postale, pays, telephone, fax)
VALUES
('CL021', 'Client_021', 'Contact_021', 'Manager', '21 Main Street', 'Paris', 'Ile-de-France', '75001', 'France', '600000021', NULL),
('CL022', 'Client_022', 'Contact_022', 'Manager', '22 Main Street', 'Lyon', 'Auvergne-Rhone-Alpes', '69001', 'France', '600000022', NULL),
('CL023', 'Client_023', 'Contact_023', 'Manager', '23 Main Street', 'Marseille', 'PACA', '13001', 'France', '600000023', NULL),
('CL024', 'Client_024', 'Contact_024', 'Manager', '24 Main Street', 'Berlin', 'Berlin', '10115', 'Germany', '600000024', NULL),
('CL025', 'Client_025', 'Contact_025', 'Manager', '25 Main Street', 'Hamburg', 'Hamburg', '20095', 'Germany', '600000025', NULL),
('CL026', 'Client_026', 'Contact_026', 'Manager', '26 Main Street', 'Madrid', 'Madrid', '28001', 'Spain', '600000026', NULL),
('CL027', 'Client_027', 'Contact_027', 'Manager', '27 Main Street', 'Barcelona', 'Catalonia', '08001', 'Spain', '600000027', NULL),
('CL028', 'Client_028', 'Contact_028', 'Manager', '28 Main Street', 'Lisbon', 'Lisboa', '1100', 'Portugal', '600000028', NULL),
('CL029', 'Client_029', 'Contact_029', 'Manager', '29 Main Street', 'Porto', 'Porto', '4000', 'Portugal', '600000029', NULL),
('CL030', 'Client_030', 'Contact_030', 'Manager', '30 Main Street', 'Rome', 'Lazio', '00100', 'Italy', '600000030', NULL),
('CL031', 'Client_031', 'Contact_031', 'Manager', '31 Main Street', 'Milan', 'Lombardy', '20100', 'Italy', '600000031', NULL),
('CL032', 'Client_032', 'Contact_032', 'Manager', '32 Main Street', 'London', 'England', 'SW1A', 'UK', '600000032', NULL),
('CL033', 'Client_033', 'Contact_033', 'Manager', '33 Main Street', 'Manchester', 'England', 'M1', 'UK', '600000033', NULL),
('CL034', 'Client_034', 'Contact_034', 'Manager', '34 Main Street', 'Dublin', 'Leinster', 'D01', 'Ireland', '600000034', NULL),
('CL035', 'Client_035', 'Contact_035', 'Manager', '35 Main Street', 'Edinburgh', 'Scotland', 'EH1', 'UK', '600000035', NULL),
('CL036', 'Client_036', 'Contact_036', 'Manager', '36 Main Street', 'Brussels', 'Brussels', '1000', 'Belgium', '600000036', NULL),
('CL037', 'Client_037', 'Contact_037', 'Manager', '37 Main Street', 'Amsterdam', 'Noord-Holland', '1011', 'Netherlands', '600000037', NULL),
('CL038', 'Client_038', 'Contact_038', 'Manager', '38 Main Street', 'Rotterdam', 'Zuid-Holland', '3011', 'Netherlands', '600000038', NULL),
('CL039', 'Client_039', 'Contact_039', 'Manager', '39 Main Street', 'Zurich', 'Zurich', '8001', 'Switzerland', '600000039', NULL),
('CL040', 'Client_040', 'Contact_040', 'Manager', '40 Main Street', 'Geneva', 'Geneva', '1200', 'Switzerland', '600000040', NULL),
('CL041', 'Client_041', 'Contact_041', 'Manager', '41 Main Street', 'Vienna', 'Vienna', '1010', 'Austria', '600000041', NULL),
('CL042', 'Client_042', 'Contact_042', 'Manager', '42 Main Street', 'Prague', 'Prague', '11000', 'Czechia', '600000042', NULL),
('CL043', 'Client_043', 'Contact_043', 'Manager', '43 Main Street', 'Warsaw', 'Mazovia', '00-001', 'Poland', '600000043', NULL),
('CL044', 'Client_044', 'Contact_044', 'Manager', '44 Main Street', 'Budapest', 'Central Hungary', '1011', 'Hungary', '600000044', NULL),
('CL045', 'Client_045', 'Contact_045', 'Manager', '45 Main Street', 'Copenhagen', 'Hovedstaden', '1050', 'Denmark', '600000045', NULL),
('CL046', 'Client_046', 'Contact_046', 'Manager', '46 Main Street', 'Stockholm', 'Stockholm', '111 20', 'Sweden', '600000046', NULL),
('CL047', 'Client_047', 'Contact_047', 'Manager', '47 Main Street', 'Oslo', 'Oslo', '0150', 'Norway', '600000047', NULL),
('CL048', 'Client_048', 'Contact_048', 'Manager', '48 Main Street', 'Helsinki', 'Uusimaa', '00100', 'Finland', '600000048', NULL),
('CL049', 'Client_049', 'Contact_049', 'Manager', '49 Main Street', 'Athens', 'Attica', '10552', 'Greece', '600000049', NULL),
('CL050', 'Client_050', 'Contact_050', 'Manager', '50 Main Street', 'Istanbul', 'Marmara', '34110', 'Turkey', '600000050', NULL),
('CL051', 'Client_051', 'Contact_051', 'Manager', '51 Main Street', 'Paris', 'Ile-de-France', '75001', 'France', '600000051', NULL),
('CL052', 'Client_052', 'Contact_052', 'Manager', '52 Main Street', 'Lyon', 'Auvergne-Rhone-Alpes', '69001', 'France', '600000052', NULL),
('CL053', 'Client_053', 'Contact_053', 'Manager', '53 Main Street', 'Marseille', 'PACA', '13001', 'France', '600000053', NULL),
('CL054', 'Client_054', 'Contact_054', 'Manager', '54 Main Street', 'Berlin', 'Berlin', '10115', 'Germany', '600000054', NULL),
('CL055', 'Client_055', 'Contact_055', 'Manager', '55 Main Street', 'Hamburg', 'Hamburg', '20095', 'Germany', '600000055', NULL),
('CL056', 'Client_056', 'Contact_056', 'Manager', '56 Main Street', 'Madrid', 'Madrid', '28001', 'Spain', '600000056', NULL),
('CL057', 'Client_057', 'Contact_057', 'Manager', '57 Main Street', 'Barcelona', 'Catalonia', '08001', 'Spain', '600000057', NULL),
('CL058', 'Client_058', 'Contact_058', 'Manager', '58 Main Street', 'Lisbon', 'Lisboa', '1100', 'Portugal', '600000058', NULL),
('CL059', 'Client_059', 'Contact_059', 'Manager', '59 Main Street', 'Porto', 'Porto', '4000', 'Portugal', '600000059', NULL),
('CL060', 'Client_060', 'Contact_060', 'Manager', '60 Main Street', 'Rome', 'Lazio', '00100', 'Italy', '600000060', NULL),
('CL061', 'Client_061', 'Contact_061', 'Manager', '61 Main Street', 'Milan', 'Lombardy', '20100', 'Italy', '600000061', NULL),
('CL062', 'Client_062', 'Contact_062', 'Manager', '62 Main Street', 'London', 'England', 'SW1A', 'UK', '600000062', NULL),
('CL063', 'Client_063', 'Contact_063', 'Manager', '63 Main Street', 'Manchester', 'England', 'M1', 'UK', '600000063', NULL),
('CL064', 'Client_064', 'Contact_064', 'Manager', '64 Main Street', 'Dublin', 'Leinster', 'D01', 'Ireland', '600000064', NULL),
('CL065', 'Client_065', 'Contact_065', 'Manager', '65 Main Street', 'Edinburgh', 'Scotland', 'EH1', 'UK', '600000065', NULL),
('CL066', 'Client_066', 'Contact_066', 'Manager', '66 Main Street', 'Brussels', 'Brussels', '1000', 'Belgium', '600000066', NULL),
('CL067', 'Client_067', 'Contact_067', 'Manager', '67 Main Street', 'Amsterdam', 'Noord-Holland', '1011', 'Netherlands', '600000067', NULL),
('CL068', 'Client_068', 'Contact_068', 'Manager', '68 Main Street', 'Rotterdam', 'Zuid-Holland', '3011', 'Netherlands', '600000068', NULL),
('CL069', 'Client_069', 'Contact_069', 'Manager', '69 Main Street', 'Zurich', 'Zurich', '8001', 'Switzerland', '600000069', NULL),
('CL070', 'Client_070', 'Contact_070', 'Manager', '70 Main Street', 'Geneva', 'Geneva', '1200', 'Switzerland', '600000070', NULL),
('CL071', 'Client_071', 'Contact_071', 'Manager', '71 Main Street', 'Vienna', 'Vienna', '1010', 'Austria', '600000071', NULL),
('CL072', 'Client_072', 'Contact_072', 'Manager', '72 Main Street', 'Prague', 'Prague', '11000', 'Czechia', '600000072', NULL),
('CL073', 'Client_073', 'Contact_073', 'Manager', '73 Main Street', 'Warsaw', 'Mazovia', '00-001', 'Poland', '600000073', NULL),
('CL074', 'Client_074', 'Contact_074', 'Manager', '74 Main Street', 'Budapest', 'Central Hungary', '1011', 'Hungary', '600000074', NULL),
('CL075', 'Client_075', 'Contact_075', 'Manager', '75 Main Street', 'Copenhagen', 'Hovedstaden', '1050', 'Denmark', '600000075', NULL),
('CL076', 'Client_076', 'Contact_076', 'Manager', '76 Main Street', 'Stockholm', 'Stockholm', '111 20', 'Sweden', '600000076', NULL),
('CL077', 'Client_077', 'Contact_077', 'Manager', '77 Main Street', 'Oslo', 'Oslo', '0150', 'Norway', '600000077', NULL),
('CL078', 'Client_078', 'Contact_078', 'Manager', '78 Main Street', 'Helsinki', 'Uusimaa', '00100', 'Finland', '600000078', NULL),
('CL079', 'Client_079', 'Contact_079', 'Manager', '79 Main Street', 'Athens', 'Attica', '10552', 'Greece', '600000079', NULL),
('CL080', 'Client_080', 'Contact_080', 'Manager', '80 Main Street', 'Istanbul', 'Marmara', '34110', 'Turkey', '600000080', NULL),
('CL081', 'Client_081', 'Contact_081', 'Manager', '81 Main Street', 'Paris', 'Ile-de-France', '75001', 'France', '600000081', NULL),
('CL082', 'Client_082', 'Contact_082', 'Manager', '82 Main Street', 'Lyon', 'Auvergne-Rhone-Alpes', '69001', 'France', '600000082', NULL),
('CL083', 'Client_083', 'Contact_083', 'Manager', '83 Main Street', 'Marseille', 'PACA', '13001', 'France', '600000083', NULL),
('CL084', 'Client_084', 'Contact_084', 'Manager', '84 Main Street', 'Berlin', 'Berlin', '10115', 'Germany', '600000084', NULL),
('CL085', 'Client_085', 'Contact_085', 'Manager', '85 Main Street', 'Hamburg', 'Hamburg', '20095', 'Germany', '600000085', NULL),
('CL086', 'Client_086', 'Contact_086', 'Manager', '86 Main Street', 'Madrid', 'Madrid', '28001', 'Spain', '600000086', NULL),
('CL087', 'Client_087', 'Contact_087', 'Manager', '87 Main Street', 'Barcelona', 'Catalonia', '08001', 'Spain', '600000087', NULL),
('CL088', 'Client_088', 'Contact_088', 'Manager', '88 Main Street', 'Lisbon', 'Lisboa', '1100', 'Portugal', '600000088', NULL),
('CL089', 'Client_089', 'Contact_089', 'Manager', '89 Main Street', 'Porto', 'Porto', '4000', 'Portugal', '600000089', NULL),
('CL090', 'Client_090', 'Contact_090', 'Manager', '90 Main Street', 'Rome', 'Lazio', '00100', 'Italy', '600000090', NULL),
('CL091', 'Client_091', 'Contact_091', 'Manager', '91 Main Street', 'Milan', 'Lombardy', '20100', 'Italy', '600000091', NULL),
('CL092', 'Client_092', 'Contact_092', 'Manager', '92 Main Street', 'London', 'England', 'SW1A', 'UK', '600000092', NULL),
('CL093', 'Client_093', 'Contact_093', 'Manager', '93 Main Street', 'Manchester', 'England', 'M1', 'UK', '600000093', NULL),
('CL094', 'Client_094', 'Contact_094', 'Manager', '94 Main Street', 'Dublin', 'Leinster', 'D01', 'Ireland', '600000094', NULL),
('CL095', 'Client_095', 'Contact_095', 'Manager', '95 Main Street', 'Edinburgh', 'Scotland', 'EH1', 'UK', '600000095', NULL),
('CL096', 'Client_096', 'Contact_096', 'Manager', '96 Main Street', 'Brussels', 'Brussels', '1000', 'Belgium', '600000096', NULL),
('CL097', 'Client_097', 'Contact_097', 'Manager', '97 Main Street', 'Amsterdam', 'Noord-Holland', '1011', 'Netherlands', '600000097', NULL),
('CL098', 'Client_098', 'Contact_098', 'Manager', '98 Main Street', 'Rotterdam', 'Zuid-Holland', '3011', 'Netherlands', '600000098', NULL),
('CL099', 'Client_099', 'Contact_099', 'Manager', '99 Main Street', 'Zurich', 'Zurich', '8001', 'Switzerland', '600000099', NULL),
('CL100', 'Client_100', 'Contact_100', 'Manager', '100 Main Street', 'Geneva', 'Geneva', '1200', 'Switzerland', '600000100', NULL);





PRINT('==========================================================================')
PRINT('Insertion Complete For Table produits')
PRINT('==========================================================================')
INSERT INTO ComptoireDB.dbo.produits (ref_produit, nom_produit, code_categorie, quantite_unite, prix_unitaire, unite_stock, unites_commandees, niveau_reapro, indisponsible) 
VALUES
('P001', 'Chai', 'CAT01', '10 boxes x 20 bags', 18.00, 39, 10, 15, 0),
('P002', 'chai', 'CAT01', '10 boxes x 20 bags', 18.00, 39, 5, 15, 0),
('P003', 'Chang', 'CAT01', '24 - 12 oz bottles', -5.00, 17, 0, 10, 0),
('P004', 'Aniseed Syrup', 'CAT03', '12 - 550 ml bottles', 1000000.00, 13, 2, 5, 0),
('P005', 'Chef Antons Gumbo', 'CAT01', '36 boxes', 21.35, 0, 4, 20, 0),
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
('P019', 'Café Noir', 'CAT01', 'Paquet de 5', 20.00, 0, 10, 15, 0),
('P020', 'Eau Minérale', 'CAT01', '6 x 1.5L', 3.50, 200, 20, 50, 0),
('P021', 'eau minerale', 'CAT01', '6x1500ml', 3.50, 200, 25, 50, 0),
('P022', 'Eau Minérale ', 'CAT01', '1.5 L', 3500, 200, 1, 50, 0),
('P023', 'Fromage', 'CAT04', '1 kg', 0.50, 1000, 100, 200, 0),
('P024', 'Fromage', 'CAT04', '1000 gr', 0.50, 1000, 150, 200, 0),
('P025', 'Test Produit', 'CAT_ERR', '1 unit', 10.00, 10, 0, 5, 0),
('P026', 'Produit NULL', NULL, NULL, 0, 0, 0, 0, 1),
('P027', '<b>Lait</b>', 'CAT04', '1L', 1.20, 50, 5, 20, 0),
('P028', 'Pain', 'CAT06', '1 piece', -1.00, 100, 10, 30, 0),
('P029', 'Pain', 'CAT06', '1 piece', 1.00, -100, 0, 30, 1),
('P030', 'Jus d orange', 'CAT19', '6 x 1L', 12.00, 120, 15, 40, 0),
('P031', 'Jus d’orange', 'CAT19', '6000 ml', 12.00, 120, 20, 40, 0),
('P032', 'Pizza Surgelée', 'CAT22', '1 piece', 3.50, 500, 50, 100, 0),
('P033', 'Pizza surgellee', 'CAT22', '1 unité', 3.50, 480, 60, 100, 0),
('P034', 'Pâtes Bio', 'CAT20', '500 g', 1.20, 1000, 200, 300, 0),
('P035', 'Pates BIO', 'CAT20', '0.5 kg', 1.20, 950, 180, 300, 0),
('P036', 'Plat préparé', 'CAT21', '1 barquette', 4.00, 0, 30, 50, 0),
('P037', 'Plat prepare', 'CAT21', '1 barq.', -4.00, 200, 0, 50, 1),
('P038', 'Produit Importé', 'CAT25', '12 units', 1000.00, 5, 1, 2, 0),
('P039', 'Produit local', 'CAT26', '12 unités', 1.00, -20, 0, 10, 1);

-- Additional products
INSERT INTO ComptoireDB.dbo.produits (ref_produit, nom_produit, code_categorie, quantite_unite, prix_unitaire, unite_stock, unites_commandees, niveau_reapro, indisponsible)
VALUES
('P040', 'Boisson Energy', 'CAT28', '6 x 500 ml', 8.50, 150, 20, 50, 0),
('P041', 'Croissant beurre', 'CAT29', '1 piece', 1.10, 800, 100, 200, 0),
('P042', 'Pain complet', 'CAT29', '1 piece', 1.30, 600, 60, 150, 0),
('P043', 'Gel douche', 'CAT30', '250 ml', 3.20, 500, 50, 100, 0),
('P044', 'Savon liquide', 'CAT30', '500 ml', 2.80, 400, 30, 100, 0),
('P045', 'Thé vert premium', 'CAT01', '20 sachets', 4.50, 300, 40, 80, 0),
('P046', 'Café Arabica', 'CAT01', '250 g', 6.90, 350, 35, 100, 0),
('P047', 'Yaourt nature', 'CAT04', '4 x 125g', 2.40, 200, 25, 80, 0),
('P048', 'Pâte spaghetti', 'CAT20', '500 g', 1.10, 1000, 120, 300, 0),
('P049', 'Pizza Margherita', 'CAT22', '1 piece', 4.20, 450, 55, 120, 0);


INSERT INTO ComptoireDB.dbo.produits
(ref_produit, nom_produit, code_categorie, quantite_unite, prix_unitaire, unite_stock, unites_commandees, niveau_reapro, indisponsible)
VALUES
('P050', 'Eau minérale naturelle 1.5L', 'CAT31', '6 bouteilles de 1.5L', 1.50, 150, 5, 20, 0),
('P051', 'Lait demi-écrémé 1L', 'CAT32', '12 briques de 1L', 1.85, 151, 6, 21, 0),
('P052', 'Pommes Golden', 'CAT33', 'Caisse de 10 kg', 2.20, 152, 7, 22, 0),
('P053', 'Tomates fraîches', 'CAT34', 'Caisse de 8 kg', 2.55, 153, 8, 23, 0),
('P054', 'Bœuf haché frais', 'CAT35', 'Barquette de 1 kg', 2.90, 154, 9, 24, 0),
('P055', 'Filet de poulet', 'CAT36', 'Barquette de 1 kg', 3.25, 155, 10, 25, 0),
('P056', 'Saumon frais', 'CAT37', 'Filet de 500 g', 3.60, 156, 11, 26, 0),
('P057', 'Crevettes décortiquées', 'CAT38', 'Sachet de 1 kg', 3.95, 157, 12, 27, 0),
('P058', 'Pizza surgelée fromage', 'CAT39', 'Boîte de 400 g', 4.30, 158, 13, 28, 0),
('P059', 'Tablette de chocolat noir', 'CAT40', 'Lot de 10 x 100 g', 4.65, 159, 14, 29, 0),
('P060', 'Pâtes spaghetti', 'CAT41', 'Carton de 20 paquets', 5.00, 160, 15, 10, 0),
('P061', 'Céréales petit-déjeuner', 'CAT42', 'Carton de 12 boîtes', 5.35, 161, 16, 11, 0),
('P062', 'Pain de campagne', 'CAT43', 'Pain de 500 g', 5.70, 162, 17, 12, 0),
('P063', 'Gâteau au chocolat', 'CAT44', 'Boîte de 6 parts', 6.05, 163, 18, 13, 0),
('P064', 'Chips salées', 'CAT45', 'Lot de 12 sachets', 6.40, 164, 19, 14, 0),
('P065', 'Sauce tomate cuisinée', 'CAT46', 'Carton de 12 bocaux', 6.75, 165, 20, 15, 0),
('P066', 'Huile d’olive vierge', 'CAT47', 'Bidon de 5 L', 7.10, 166, 21, 16, 0),
('P067', 'Farine bio', 'CAT48', 'Sac de 5 kg', 7.45, 167, 22, 17, 0),
('P068', 'Biscuits sans sucre', 'CAT49', 'Boîte de 24 paquets', 7.80, 168, 23, 18, 0),
('P069', 'Petits pots bébé', 'CAT50', 'Carton de 24 pots', 8.15, 169, 24, 19, 0),
('P070', 'Détergent multi-usage', 'CAT51', 'Bidon de 5 L', 8.50, 170, 25, 20, 0),
('P071', 'Gel douche', 'CAT52', 'Carton de 24 flacons', 8.85, 171, 26, 21, 0),
('P072', 'Crème hydratante', 'CAT53', 'Lot de 12 tubes', 9.20, 172, 27, 22, 0),
('P073', 'Eau de toilette', 'CAT54', 'Flacon de 100 ml', 9.55, 173, 28, 23, 0),
('P074', 'Ramettes papier A4', 'CAT55', 'Carton de 5 ramettes', 9.90, 174, 29, 24, 0),
('P075', 'Cahiers scolaires', 'CAT56', 'Lot de 20 cahiers', 10.25, 175, 5, 25, 0),
('P076', 'Casque audio', 'CAT57', 'Boîte individuelle', 10.60, 176, 6, 26, 0),
('P077', 'Bouilloire électrique', 'CAT58', 'Unité', 10.95, 177, 7, 27, 0),
('P078', 'Clavier informatique', 'CAT59', 'Boîte individuelle', 11.30, 178, 8, 28, 0),
('P079', 'Chargeur smartphone', 'CAT60', 'Boîte individuelle', 11.65, 179, 9, 29, 0),
('P080', 'Jus d’orange 1L', 'CAT31', 'Pack de 12 bouteilles', 12.00, 180, 10, 10, 0),
('P081', 'Fromage emmental', 'CAT32', 'Bloc de 1 kg', 12.35, 181, 11, 11, 0),
('P082', 'Bananes', 'CAT33', 'Caisse de 15 kg', 12.70, 182, 12, 12, 0),
('P083', 'Courgettes', 'CAT34', 'Caisse de 10 kg', 13.05, 183, 13, 13, 0),
('P084', 'Côtelettes d’agneau', 'CAT35', 'Barquette de 1 kg', 13.40, 184, 14, 14, 0),
('P085', 'Escalopes de dinde', 'CAT36', 'Barquette de 1 kg', 13.75, 185, 15, 15, 0),
('P086', 'Cabillaud frais', 'CAT37', 'Filet de 1 kg', 14.10, 186, 16, 16, 0),
('P087', 'Moules fraîches', 'CAT38', 'Sac de 5 kg', 14.45, 187, 17, 17, 0),
('P088', 'Frites surgelées', 'CAT39', 'Sac de 2.5 kg', 14.80, 188, 18, 18, 0),
('P089', 'Bonbons assortis', 'CAT40', 'Sachet de 2 kg', 15.15, 189, 19, 19, 0),
('P090', 'Riz long grain', 'CAT41', 'Sac de 10 kg', 15.50, 190, 20, 20, 0),
('P091', 'Flocons d’avoine', 'CAT42', 'Sac de 5 kg', 15.85, 191, 21, 21, 0),
('P092', 'Baguettes précuites', 'CAT43', 'Lot de 20 unités', 16.20, 192, 22, 22, 0),
('P093', 'Tarte aux pommes', 'CAT44', 'Boîte de 6 parts', 16.55, 193, 23, 23, 0),
('P094', 'Biscuits apéritifs', 'CAT45', 'Lot de 24 sachets', 16.90, 194, 24, 24, 0),
('P095', 'Ketchup', 'CAT46', 'Carton de 12 bouteilles', 17.25, 195, 25, 25, 0),
('P096', 'Huile de tournesol', 'CAT47', 'Bidon de 5 L', 17.60, 196, 26, 26, 0),
('P097', 'Pâtes complètes bio', 'CAT48', 'Carton de 20 paquets', 17.95, 197, 27, 27, 0),
('P098', 'Barres céréalières', 'CAT49', 'Boîte de 48 barres', 18.30, 198, 28, 28, 0),
('P099', 'Lait infantile', 'CAT50', 'Carton de 6 boîtes', 18.65, 199, 29, 29, 0),
('P100', 'Nettoyant sol', 'CAT51', 'Bidon de 5 L', 19.00, 200, 5, 10, 0);


/*
-- Bulk products to reach 100
INSERT INTO ComptoireDB.dbo.produits (ref_produit, nom_produit, code_categorie, quantite_unite, prix_unitaire, unite_stock, unites_commandees, niveau_reapro, indisponsible)
VALUES
('P050', 'Produit_050', 'CAT31', '50 units pack', 1.50, 150, 5, 20, 0),
('P051', 'Produit_051', 'CAT32', '51 units pack', 1.85, 151, 6, 21, 0),
('P052', 'Produit_052', 'CAT33', '52 units pack', 2.20, 152, 7, 22, 0),
('P053', 'Produit_053', 'CAT34', '53 units pack', 2.55, 153, 8, 23, 0),
('P054', 'Produit_054', 'CAT35', '54 units pack', 2.90, 154, 9, 24, 0),
('P055', 'Produit_055', 'CAT36', '55 units pack', 3.25, 155, 10, 25, 0),
('P056', 'Produit_056', 'CAT37', '56 units pack', 3.60, 156, 11, 26, 0),
('P057', 'Produit_057', 'CAT38', '57 units pack', 3.95, 157, 12, 27, 0),
('P058', 'Produit_058', 'CAT39', '58 units pack', 4.30, 158, 13, 28, 0),
('P059', 'Produit_059', 'CAT40', '59 units pack', 4.65, 159, 14, 29, 0),
('P060', 'Produit_060', 'CAT41', '60 units pack', 5.00, 160, 15, 10, 0),
('P061', 'Produit_061', 'CAT42', '61 units pack', 5.35, 161, 16, 11, 0),
('P062', 'Produit_062', 'CAT43', '62 units pack', 5.70, 162, 17, 12, 0),
('P063', 'Produit_063', 'CAT44', '63 units pack', 6.05, 163, 18, 13, 0),
('P064', 'Produit_064', 'CAT45', '64 units pack', 6.40, 164, 19, 14, 0),
('P065', 'Produit_065', 'CAT46', '65 units pack', 6.75, 165, 20, 15, 0),
('P066', 'Produit_066', 'CAT47', '66 units pack', 7.10, 166, 21, 16, 0),
('P067', 'Produit_067', 'CAT48', '67 units pack', 7.45, 167, 22, 17, 0),
('P068', 'Produit_068', 'CAT49', '68 units pack', 7.80, 168, 23, 18, 0),
('P069', 'Produit_069', 'CAT50', '69 units pack', 8.15, 169, 24, 19, 0),
('P070', 'Produit_070', 'CAT51', '70 units pack', 8.50, 170, 25, 20, 0),
('P071', 'Produit_071', 'CAT52', '71 units pack', 8.85, 171, 26, 21, 0),
('P072', 'Produit_072', 'CAT53', '72 units pack', 9.20, 172, 27, 22, 0),
('P073', 'Produit_073', 'CAT54', '73 units pack', 9.55, 173, 28, 23, 0),
('P074', 'Produit_074', 'CAT55', '74 units pack', 9.90, 174, 29, 24, 0),
('P075', 'Produit_075', 'CAT56', '75 units pack', 10.25, 175, 5, 25, 0),
('P076', 'Produit_076', 'CAT57', '76 units pack', 10.60, 176, 6, 26, 0),
('P077', 'Produit_077', 'CAT58', '77 units pack', 10.95, 177, 7, 27, 0),
('P078', 'Produit_078', 'CAT59', '78 units pack', 11.30, 178, 8, 28, 0),
('P079', 'Produit_079', 'CAT60', '79 units pack', 11.65, 179, 9, 29, 0),
('P080', 'Produit_080', 'CAT31', '80 units pack', 12.00, 180, 10, 10, 0),
('P081', 'Produit_081', 'CAT32', '81 units pack', 12.35, 181, 11, 11, 0),
('P082', 'Produit_082', 'CAT33', '82 units pack', 12.70, 182, 12, 12, 0),
('P083', 'Produit_083', 'CAT34', '83 units pack', 13.05, 183, 13, 13, 0),
('P084', 'Produit_084', 'CAT35', '84 units pack', 13.40, 184, 14, 14, 0),
('P085', 'Produit_085', 'CAT36', '85 units pack', 13.75, 185, 15, 15, 0),
('P086', 'Produit_086', 'CAT37', '86 units pack', 14.10, 186, 16, 16, 0),
('P087', 'Produit_087', 'CAT38', '87 units pack', 14.45, 187, 17, 17, 0),
('P088', 'Produit_088', 'CAT39', '88 units pack', 14.80, 188, 18, 18, 0),
('P089', 'Produit_089', 'CAT40', '89 units pack', 15.15, 189, 19, 19, 0),
('P090', 'Produit_090', 'CAT41', '90 units pack', 15.50, 190, 20, 20, 0),
('P091', 'Produit_091', 'CAT42', '91 units pack', 15.85, 191, 21, 21, 0),
('P092', 'Produit_092', 'CAT43', '92 units pack', 16.20, 192, 22, 22, 0),
('P093', 'Produit_093', 'CAT44', '93 units pack', 16.55, 193, 23, 23, 0),
('P094', 'Produit_094', 'CAT45', '94 units pack', 16.90, 194, 24, 24, 0),
('P095', 'Produit_095', 'CAT46', '95 units pack', 17.25, 195, 25, 25, 0),
('P096', 'Produit_096', 'CAT47', '96 units pack', 17.60, 196, 26, 26, 0),
('P097', 'Produit_097', 'CAT48', '97 units pack', 17.95, 197, 27, 27, 0),
('P098', 'Produit_098', 'CAT49', '98 units pack', 18.30, 198, 28, 28, 0),
('P099', 'Produit_099', 'CAT50', '99 units pack', 18.65, 199, 29, 29, 0),
('P100', 'Produit_100', 'CAT51', '100 units pack', 19.00, 200, 5, 10, 0);
*/




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

-- Additional bulk orders to reach 100+
INSERT INTO ComptoireDB.dbo.commandes 
(num_commande, code_client, date_commande, date_livraison, date_envoi, port, destination, adresse_livraison, ville_livraison, region_livraison, code_postale_livraison, pays_livraison) 
VALUES
('C4001', 'ALFKI', '2024-01-05', NULL, NULL, 5.0, 'Europe', 'Address for ALFKI', 'Berlin', 'Berlin', '12209', 'Germany'),
('C4002', 'ANATR', '2024-01-06', '2024-01-09', '2024-01-07', 6.5, 'North America', 'Address for ANATR', 'Mexico City', 'Distrito Fed', '03940', 'Mexico'),
('C4003', 'BOLID', '2024-01-07', '2024-01-10', '2024-01-08', 8.0, 'Africa', 'Address for BOLID', 'Madrid', 'Madrid', '28023', 'Spain'),
('C4004', 'ERNSH', '2024-01-08', NULL, '2024-01-09', 9.5, 'Asia', 'Address for ERNSH', 'Graz', 'Styria', '8010', 'Austria'),
('C4005', 'QUICK', '2024-01-09', '2024-01-12', NULL, 11.0, 'Europe', 'Address for QUICK', 'Cunewalde', NULL, '02733', 'Germany'),
('C4006', 'MAROC', '2024-01-10', '2024-01-13', '2024-01-11', 12.5, 'North America', 'Address for MAROC', 'Casablanca', 'Casa-Settat', '20000', 'Morocco'),
('C4007', 'USA01', '2024-01-11', NULL, '2024-01-12', 14.0, 'Africa', 'Address for USA01', 'New York', 'NY', '10001', 'USA'),
('C4008', 'FRA01', '2024-01-12', '2024-01-15', '2024-01-13', 15.5, 'Asia', 'Address for FRA01', 'Lille', 'Hauts-de-France', '59000', 'France'),
('C4009', 'CL009', '2024-01-13', '2024-01-16', NULL, 17.0, 'Europe', 'Address for CL009', 'Rabat', 'Rabat-Sale', '10000', 'Morocco'),
('C4010', 'CL010', '2024-01-14', NULL, '2024-01-15', 18.5, 'North America', 'Address for CL010', 'rabat', 'Rabat', '10000', 'MAROC'),
('C4011', 'CL011', '2024-01-15', '2024-01-18', '2024-01-16', 20.0, 'Africa', 'Address for CL011', 'Nice', 'Provence-Alpes', '06000', 'France'),
('C4012', 'CL012', '2024-01-16', '2024-01-19', '2024-01-17', 21.5, 'Asia', 'Address for CL012', 'Toulouse', 'Occitanie', '31000', 'France'),
('C4013', 'CL013', '2024-01-17', NULL, NULL, 23.0, 'Europe', 'Address for CL013', 'Toulouse', 'Occitanie', '31000', 'FR'),
('C4014', 'CL014', '2024-01-18', '2024-01-21', '2024-01-19', 24.5, 'North America', 'Address for CL014', 'Unknown', 'Unknown', NULL, 'Unknown'),
('C4015', 'CL015', '2024-01-19', '2024-01-22', '2024-01-20', 26.0, 'Africa', 'Address for CL015', 'Fes', 'Fès-Meknès', '30000', 'Morocco'),
('C4016', 'CL016', '2024-01-20', NULL, '2024-01-21', 27.5, 'Asia', 'Address for CL016', 'FÈS', 'FES-MEKNES', '30000', 'Maroc'),
('C4017', 'CL017', '2024-01-21', '2024-01-24', NULL, 29.0, 'Europe', 'Address for CL017', 'Marrakech', 'Marrakech-Safi', '40000', 'Morocco'),
('C4018', 'CL018', '2024-01-22', '2024-01-25', '2024-01-23', 30.5, 'North America', 'Address for CL018', 'San Francisco', 'California', '94105', 'USA'),
('C4019', 'CL019', '2024-01-23', NULL, '2024-01-24', 32.0, 'Africa', 'Address for CL019', 'Berlin', 'Berlin', '10117', 'Germany'),
('C4020', 'CL020', '2024-01-24', '2024-01-27', '2024-01-25', 33.5, 'Asia', 'Address for CL020', 'Nice', 'PACA', '06000', 'France'),
('C4021', 'ALFKI', '2024-01-25', '2024-01-28', NULL, 5.0, 'Europe', 'Address for ALFKI', 'Berlin', 'Berlin', '12209', 'Germany'),
('C4022', 'ANATR', '2024-01-26', NULL, '2024-01-27', 6.5, 'North America', 'Address for ANATR', 'Mexico City', 'Distrito Fed', '03940', 'Mexico'),
('C4023', 'BOLID', '2024-01-27', '2024-01-30', '2024-01-28', 8.0, 'Africa', 'Address for BOLID', 'Madrid', 'Madrid', '28023', 'Spain'),
('C4024', 'ERNSH', '2024-01-28', '2024-01-31', '2024-01-29', 9.5, 'Asia', 'Address for ERNSH', 'Graz', 'Styria', '8010', 'Austria'),
('C4025', 'QUICK', '2024-01-29', NULL, NULL, 11.0, 'Europe', 'Address for QUICK', 'Cunewalde', NULL, '02733', 'Germany'),
('C4026', 'MAROC', '2024-01-30', '2024-02-02', '2024-01-31', 12.5, 'North America', 'Address for MAROC', 'Casablanca', 'Casa-Settat', '20000', 'Morocco'),
('C4027', 'USA01', '2024-01-31', '2024-02-03', '2024-02-01', 14.0, 'Africa', 'Address for USA01', 'New York', 'NY', '10001', 'USA'),
('C4028', 'FRA01', '2024-02-01', NULL, '2024-02-02', 15.5, 'Asia', 'Address for FRA01', 'Lille', 'Hauts-de-France', '59000', 'France'),
('C4029', 'CL009', '2024-02-02', '2024-02-05', NULL, 17.0, 'Europe', 'Address for CL009', 'Rabat', 'Rabat-Sale', '10000', 'Morocco'),
('C4030', 'CL010', '2024-02-03', '2024-02-06', '2024-02-04', 18.5, 'North America', 'Address for CL010', 'rabat', 'Rabat', '10000', 'MAROC'),
('C4031', 'CL011', '2024-02-04', NULL, '2024-02-05', 20.0, 'Africa', 'Address for CL011', 'Nice', 'Provence-Alpes', '06000', 'France'),
('C4032', 'CL012', '2024-02-05', '2024-02-08', '2024-02-06', 21.5, 'Asia', 'Address for CL012', 'Toulouse', 'Occitanie', '31000', 'France'),
('C4033', 'CL013', '2024-02-06', '2024-02-09', NULL, 23.0, 'Europe', 'Address for CL013', 'Toulouse', 'Occitanie', '31000', 'FR'),
('C4034', 'CL014', '2024-02-07', NULL, '2024-02-08', 24.5, 'North America', 'Address for CL014', 'Unknown', 'Unknown', NULL, 'Unknown'),
('C4035', 'CL015', '2024-02-08', '2024-02-11', '2024-02-09', 26.0, 'Africa', 'Address for CL015', 'Fes', 'Fès-Meknès', '30000', 'Morocco'),
('C4036', 'CL016', '2024-02-09', '2024-02-12', '2024-02-10', 27.5, 'Asia', 'Address for CL016', 'FÈS', 'FES-MEKNES', '30000', 'Maroc'),
('C4037', 'CL017', '2024-02-10', NULL, NULL, 29.0, 'Europe', 'Address for CL017', 'Marrakech', 'Marrakech-Safi', '40000', 'Morocco'),
('C4038', 'CL018', '2024-02-11', '2024-02-14', '2024-02-12', 30.5, 'North America', 'Address for CL018', 'San Francisco', 'California', '94105', 'USA'),
('C4039', 'CL019', '2024-02-12', '2024-02-15', '2024-02-13', 32.0, 'Africa', 'Address for CL019', 'Berlin', 'Berlin', '10117', 'Germany'),
('C4040', 'CL020', '2024-02-13', NULL, '2024-02-14', 33.5, 'Asia', 'Address for CL020', 'Nice', 'PACA', '06000', 'France'),
('C4041', 'ALFKI', '2024-02-14', '2024-02-17', NULL, 5.0, 'Europe', 'Address for ALFKI', 'Berlin', 'Berlin', '12209', 'Germany'),
('C4042', 'ANATR', '2024-02-15', '2024-02-18', '2024-02-16', 6.5, 'North America', 'Address for ANATR', 'Mexico City', 'Distrito Fed', '03940', 'Mexico'),
('C4043', 'BOLID', '2024-02-16', NULL, '2024-02-17', 8.0, 'Africa', 'Address for BOLID', 'Madrid', 'Madrid', '28023', 'Spain'),
('C4044', 'ERNSH', '2024-02-17', '2024-02-20', '2024-02-18', 9.5, 'Asia', 'Address for ERNSH', 'Graz', 'Styria', '8010', 'Austria'),
('C4045', 'QUICK', '2024-02-18', '2024-02-21', NULL, 11.0, 'Europe', 'Address for QUICK', 'Cunewalde', NULL, '02733', 'Germany'),
('C4046', 'MAROC', '2024-02-19', NULL, '2024-02-20', 12.5, 'North America', 'Address for MAROC', 'Casablanca', 'Casa-Settat', '20000', 'Morocco'),
('C4047', 'USA01', '2024-02-20', '2024-02-23', '2024-02-21', 14.0, 'Africa', 'Address for USA01', 'New York', 'NY', '10001', 'USA'),
('C4048', 'FRA01', '2024-02-21', '2024-02-24', '2024-02-22', 15.5, 'Asia', 'Address for FRA01', 'Lille', 'Hauts-de-France', '59000', 'France'),
('C4049', 'CL009', '2024-02-22', NULL, NULL, 17.0, 'Europe', 'Address for CL009', 'Rabat', 'Rabat-Sale', '10000', 'Morocco'),
('C4050', 'CL010', '2024-02-23', '2024-02-26', '2024-02-24', 18.5, 'North America', 'Address for CL010', 'rabat', 'Rabat', '10000', 'MAROC'),
('C4051', 'CL011', '2024-02-24', '2024-02-27', '2024-02-25', 20.0, 'Africa', 'Address for CL011', 'Nice', 'Provence-Alpes', '06000', 'France'),
('C4052', 'CL012', '2024-02-25', NULL, '2024-02-26', 21.5, 'Asia', 'Address for CL012', 'Toulouse', 'Occitanie', '31000', 'France'),
('C4053', 'CL013', '2024-02-26', '2024-02-29', NULL, 23.0, 'Europe', 'Address for CL013', 'Toulouse', 'Occitanie', '31000', 'FR'),
('C4054', 'CL014', '2024-02-27', '2024-03-01', '2024-02-28', 24.5, 'North America', 'Address for CL014', 'Unknown', 'Unknown', NULL, 'Unknown'),
('C4055', 'CL015', '2024-02-28', NULL, '2024-02-29', 26.0, 'Africa', 'Address for CL015', 'Fes', 'Fès-Meknès', '30000', 'Morocco'),
('C4056', 'CL016', '2024-02-29', '2024-03-03', '2024-03-01', 27.5, 'Asia', 'Address for CL016', 'FÈS', 'FES-MEKNES', '30000', 'Maroc'),
('C4057', 'CL017', '2024-03-01', '2024-03-04', NULL, 29.0, 'Europe', 'Address for CL017', 'Marrakech', 'Marrakech-Safi', '40000', 'Morocco'),
('C4058', 'CL018', '2024-03-02', NULL, '2024-03-03', 30.5, 'North America', 'Address for CL018', 'San Francisco', 'California', '94105', 'USA'),
('C4059', 'CL019', '2024-03-03', '2024-03-06', '2024-03-04', 32.0, 'Africa', 'Address for CL019', 'Berlin', 'Berlin', '10117', 'Germany'),
('C4060', 'CL020', '2024-03-04', '2024-03-07', '2024-03-05', 33.5, 'Asia', 'Address for CL020', 'Nice', 'PACA', '06000', 'France'),
('C4061', 'ALFKI', '2024-03-05', NULL, NULL, 5.0, 'Europe', 'Address for ALFKI', 'Berlin', 'Berlin', '12209', 'Germany'),
('C4062', 'ANATR', '2024-03-06', '2024-03-09', '2024-03-07', 6.5, 'North America', 'Address for ANATR', 'Mexico City', 'Distrito Fed', '03940', 'Mexico'),
('C4063', 'BOLID', '2024-03-07', '2024-03-10', '2024-03-08', 8.0, 'Africa', 'Address for BOLID', 'Madrid', 'Madrid', '28023', 'Spain'),
('C4064', 'ERNSH', '2024-03-08', NULL, '2024-03-09', 9.5, 'Asia', 'Address for ERNSH', 'Graz', 'Styria', '8010', 'Austria'),
('C4065', 'QUICK', '2024-03-09', '2024-03-12', NULL, 11.0, 'Europe', 'Address for QUICK', 'Cunewalde', NULL, '02733', 'Germany'),
('C4066', 'MAROC', '2024-03-10', '2024-03-13', '2024-03-11', 12.5, 'North America', 'Address for MAROC', 'Casablanca', 'Casa-Settat', '20000', 'Morocco'),
('C4067', 'USA01', '2024-03-11', NULL, '2024-03-12', 14.0, 'Africa', 'Address for USA01', 'New York', 'NY', '10001', 'USA');

-- Additional orders
INSERT INTO ComptoireDB.dbo.commandes 
(num_commande, code_client, date_commande, date_livraison, date_envoi, port, destination, adresse_livraison, ville_livraison, region_livraison, code_postale_livraison, pays_livraison) 
VALUES
('C3007', 'CL017', '2023-10-10', '2023-10-12', '2023-10-11', 12, 'Africa', 'Jemaa el-Fna', 'Marrakech', 'Marrakech-Safi', '40000', 'Morocco'),
('C3008', 'CL018', '2023-11-05', '2023-11-08', '2023-11-06', 25, 'North America', '88 Market St', 'San Francisco', 'California', '94105', 'USA'),
('C3009', 'CL019', '2023-12-01', NULL, '2023-12-02', 18.5, 'Europe', 'Friedrichstr. 10', 'Berlin', 'Berlin', '10117', 'Germany'),
('C3010', 'CL020', '2023-12-15', NULL, NULL, 9.9, 'Europe', 'Avenue Jean Médecin', 'Nice', 'PACA', '06000', 'France');





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

-- Additional order details aligned with new orders
INSERT INTO ComptoireDB.dbo.details_commande (num_commande, ref_produit, quantite, remise)
VALUES
('C4001', 'P040', 2, 0.1),
('C4001', 'P041', 1, 0.05),
('C4002', 'P042', 3, 0),
('C4002', 'P043', 2, 0),
('C4003', 'P044', 4, 0),
('C4003', 'P045', 3, 0),
('C4004', 'P046', 5, 0),
('C4004', 'P047', 4, 0),
('C4005', 'P048', 6, 0),
('C4005', 'P049', 5, 0.05),
('C4006', 'P020', 7, 0.1),
('C4006', 'P030', 6, 0),
('C4007', 'P034', 8, 0),
('C4007', 'P040', 7, 0),
('C4008', 'P041', 9, 0),
('C4008', 'P042', 1, 0),
('C4009', 'P043', 10, 0),
('C4009', 'P044', 2, 0.05),
('C4010', 'P045', 2, 0),
('C4010', 'P046', 3, 0),
('C4011', 'P047', 3, 0.1),
('C4011', 'P048', 4, 0),
('C4012', 'P049', 4, 0),
('C4012', 'P020', 5, 0),
('C4013', 'P030', 5, 0),
('C4013', 'P034', 6, 0.05),
('C4014', 'P040', 6, 0),
('C4014', 'P041', 7, 0),
('C4015', 'P042', 7, 0),
('C4015', 'P043', 1, 0),
('C4016', 'P044', 8, 0.1),
('C4016', 'P045', 2, 0),
('C4017', 'P046', 9, 0),
('C4017', 'P047', 3, 0.05),
('C4018', 'P048', 10, 0),
('C4018', 'P049', 4, 0),
('C4019', 'P020', 2, 0),
('C4019', 'P030', 5, 0),
('C4020', 'P034', 3, 0),
('C4020', 'P040', 6, 0),
('C4021', 'P041', 4, 0.1),
('C4021', 'P042', 7, 0.05),
('C4022', 'P043', 5, 0),
('C4022', 'P044', 1, 0),
('C4023', 'P045', 6, 0),
('C4023', 'P046', 2, 0),
('C4024', 'P047', 7, 0),
('C4024', 'P048', 3, 0),
('C4025', 'P049', 8, 0),
('C4025', 'P020', 4, 0.05),
('C4026', 'P030', 9, 0.1),
('C4026', 'P034', 5, 0),
('C4027', 'P040', 10, 0),
('C4027', 'P041', 6, 0),
('C4028', 'P042', 2, 0),
('C4028', 'P043', 7, 0),
('C4029', 'P044', 3, 0),
('C4029', 'P045', 1, 0.05),
('C4030', 'P046', 4, 0),
('C4030', 'P047', 2, 0),
('C4031', 'P048', 5, 0.1),
('C4031', 'P049', 3, 0),
('C4032', 'P020', 6, 0),
('C4032', 'P030', 4, 0),
('C4033', 'P034', 7, 0),
('C4033', 'P040', 5, 0.05),
('C4034', 'P041', 8, 0),
('C4034', 'P042', 6, 0),
('C4035', 'P043', 9, 0),
('C4035', 'P044', 7, 0),
('C4036', 'P045', 10, 0.1),
('C4036', 'P046', 1, 0),
('C4037', 'P047', 2, 0),
('C4037', 'P048', 2, 0.05),
('C4038', 'P049', 3, 0),
('C4038', 'P020', 3, 0),
('C4039', 'P030', 4, 0),
('C4039', 'P034', 4, 0),
('C4040', 'P040', 5, 0),
('C4040', 'P041', 5, 0),
('C4041', 'P042', 6, 0.1),
('C4041', 'P043', 6, 0.05),
('C4042', 'P044', 7, 0),
('C4042', 'P045', 7, 0),
('C4043', 'P046', 8, 0),
('C4043', 'P047', 1, 0),
('C4044', 'P048', 9, 0),
('C4044', 'P049', 2, 0),
('C4045', 'P020', 10, 0),
('C4045', 'P030', 3, 0.05),
('C4046', 'P034', 2, 0.1),
('C4046', 'P040', 4, 0),
('C4047', 'P041', 3, 0),
('C4047', 'P042', 5, 0),
('C4048', 'P043', 4, 0),
('C4048', 'P044', 6, 0),
('C4049', 'P045', 5, 0),
('C4049', 'P046', 7, 0.05),
('C4050', 'P047', 6, 0),
('C4050', 'P048', 1, 0),
('C4051', 'P049', 7, 0.1),
('C4051', 'P020', 2, 0),
('C4052', 'P030', 8, 0),
('C4052', 'P034', 3, 0),
('C4053', 'P040', 9, 0),
('C4053', 'P041', 4, 0.05),
('C4054', 'P042', 10, 0),
('C4054', 'P043', 5, 0),
('C4055', 'P044', 2, 0),
('C4055', 'P045', 6, 0),
('C4056', 'P046', 3, 0.1),
('C4056', 'P047', 7, 0),
('C4057', 'P048', 4, 0),
('C4057', 'P049', 1, 0.05),
('C4058', 'P020', 5, 0),
('C4058', 'P030', 2, 0),
('C4059', 'P034', 6, 0),
('C4059', 'P040', 3, 0),
('C4060', 'P041', 7, 0),
('C4060', 'P042', 4, 0),
('C4061', 'P043', 8, 0.1),
('C4061', 'P044', 5, 0.05),
('C4062', 'P045', 9, 0),
('C4062', 'P046', 6, 0),
('C4063', 'P047', 10, 0),
('C4063', 'P048', 7, 0),
('C4064', 'P049', 2, 0),
('C4064', 'P020', 1, 0),
('C4065', 'P030', 3, 0),
('C4065', 'P034', 2, 0.05),
('C4066', 'P040', 4, 0.1),
('C4066', 'P041', 3, 0),
('C4067', 'P042', 5, 0),
('C4067', 'P043', 4, 0);

-- Additional order details
INSERT INTO ComptoireDB.dbo.details_commande (num_commande, ref_produit, quantite, remise)
VALUES
('C3007', 'P040', 12, 0.05),
('C3007', 'P047', 20, 0),
('C3008', 'P046', 5, 0),
('C3008', 'P049', 2, 0.1),
('C3009', 'P041', 24, 0),
('C3009', 'P043', 10, 0),
('C3010', 'P045', 10, 0),
('C3010', 'P048', 15, 0);


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
