IF OBJECT_ID('gold.v_monthly_sales_category', 'V') IS NOT NULL DROP VIEW gold.v_monthly_sales_category;
GO
CREATE VIEW gold.v_monthly_sales_category AS
SELECT
  t.annee,
  t.mois,
  t.nom_mois,
  p.nom_categorie AS categorie,
  SUM(f.montant_vente) AS revenue,
  SUM(f.quantite)      AS quantity,
  COUNT(*)             AS lignes
FROM gold.fact_ventes AS f
JOIN gold.dim_temps   AS t ON t.id_temps   = f.id_temps
JOIN gold.dim_produit AS p ON p.id_produit = f.id_produit
GROUP BY t.annee, t.mois, t.nom_mois, p.nom_categorie;
GO

IF OBJECT_ID('gold.v_customer_kpi', 'V') IS NOT NULL DROP VIEW gold.v_customer_kpi;
GO
CREATE VIEW gold.v_customer_kpi AS
SELECT
  c.id_client,
  c.code_client,
  c.societe,
  c.ville,
  c.region,
  c.pays,
  COUNT(*)               AS lignes,
  SUM(f.quantite)        AS quantity,
  SUM(f.montant_vente)   AS revenue,
  MIN(t.date_complete)   AS first_order_date,
  MAX(t.date_complete)   AS last_order_date
FROM gold.fact_ventes AS f
JOIN gold.dim_client  AS c ON c.id_client = f.id_client
JOIN gold.dim_temps   AS t ON t.id_temps  = f.id_temps
GROUP BY c.id_client, c.code_client, c.societe, c.ville, c.region, c.pays;
GO

IF OBJECT_ID('gold.v_product_rank_month', 'V') IS NOT NULL DROP VIEW gold.v_product_rank_month;
GO
CREATE VIEW gold.v_product_rank_month AS
SELECT
  t.annee,
  t.mois,
  t.nom_mois,
  p.id_produit,
  p.ref_produit,
  p.nom_produit,
  p.nom_categorie,
  SUM(f.montant_vente) AS revenue,
  SUM(f.quantite)      AS quantity,
  DENSE_RANK() OVER (PARTITION BY t.annee, t.mois ORDER BY SUM(f.montant_vente) DESC) AS rank_revenue
FROM gold.fact_ventes AS f
JOIN gold.dim_temps   AS t ON t.id_temps   = f.id_temps
JOIN gold.dim_produit AS p ON p.id_produit = f.id_produit
GROUP BY t.annee, t.mois, t.nom_mois, p.id_produit, p.ref_produit, p.nom_produit, p.nom_categorie;
GO

IF OBJECT_ID('gold.v_monthly_growth', 'V') IS NOT NULL DROP VIEW gold.v_monthly_growth;
GO
CREATE VIEW gold.v_monthly_growth AS
WITH monthly AS (
  SELECT t.annee, t.mois, t.nom_mois, SUM(f.montant_vente) AS revenue
  FROM gold.fact_ventes AS f
  JOIN gold.dim_temps AS t ON t.id_temps = f.id_temps
  GROUP BY t.annee, t.mois, t.nom_mois
)
SELECT
  annee,
  mois,
  nom_mois,
  revenue,
  LAG(revenue) OVER (ORDER BY annee, mois) AS prev_revenue,
  CASE
    WHEN LAG(revenue) OVER (ORDER BY annee, mois) = 0 THEN NULL
    ELSE ROUND((revenue - LAG(revenue) OVER (ORDER BY annee, mois))
               / NULLIF(LAG(revenue) OVER (ORDER BY annee, mois), 0), 4)
  END AS growth_rate;
GO

IF OBJECT_ID('gold.v_sales_by_region', 'V') IS NOT NULL DROP VIEW gold.v_sales_by_region;
GO
CREATE VIEW gold.v_sales_by_region AS
SELECT
  t.annee,
  t.mois,
  t.nom_mois,
  COALESCE(c.region, c.ville) AS region,
  c.pays,
  SUM(f.montant_vente) AS revenue,
  SUM(f.quantite)      AS quantity
FROM gold.fact_ventes AS f
JOIN gold.dim_temps  AS t ON t.id_temps  = f.id_temps
JOIN gold.dim_client AS c ON c.id_client = f.id_client
GROUP BY t.annee, t.mois, t.nom_mois, COALESCE(c.region, c.ville), c.pays;
GO
