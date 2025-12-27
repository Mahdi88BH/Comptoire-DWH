# Comptoire-DWH
End-to-end Data WareHouse project transforming raw 'Comptoir' sales data into a curated Gold layer. Features a Medallion pipeline resulting in a optimized Star Schema (1 Fact, 3 Dimensions) for BI reporting.

## Load Data (quick start)

- Prerequisites: a running SQL Server (Docker or local) and access to `sqlcmd`/SSMS/Azure Data Studio. For Bronze bulk load, ensure the CSVs are accessible at `/var/opt/mssql/` inside SQL Server.

- Source DB (DDL + sample inserts):
	- Run `Scripts/Source_Data/DDL_DB.sql`
	- Run `Scripts/Source_Data/Source_DB.sql`

- Bronze layer (DDL + CSV bulk import):
	- Run `Scripts/bronze/DDl_bronze_layer.sql`
	- Copy CSVs from `Datasets/*.csv` into `/var/opt/mssql/` inside SQL Server, then run `Scripts/bronze/load _data_to_bronzeLayer.sql`

Note: The datasets and source inserts include “messy” rows intentionally to exercise cleaning rules in downstream layers.
