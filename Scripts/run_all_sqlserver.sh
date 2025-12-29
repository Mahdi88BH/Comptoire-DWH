#!/usr/bin/env bash
set -euo pipefail

SA_PASSWORD="${SA_PASSWORD:-YourStrong!Passw0rd}"
SOURCE_DB="${SOURCE_DB:-ComptoireDB}"
DW_DB="${DW_DB:-DataWareHouse}"

container_up() { docker ps --format '{{.Names}}' | grep -q '^sqlserver$'; }
container_exists() { docker ps -a --format '{{.Names}}' | grep -q '^sqlserver$'; }

if ! container_up; then
  if container_exists; then
    echo "Starting existing sqlserver container..."
    docker start sqlserver >/dev/null
  else
    echo "Creating new sqlserver container..."
    docker run -d --name sqlserver \
      -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=${SA_PASSWORD}" \
      -p 1433:1433 mcr.microsoft.com/mssql/server:2022-latest >/dev/null
  fi
fi

echo "Waiting for SQL Server to be ready..."
until sqlcmd -S localhost,1433 -U SA -P "${SA_PASSWORD}" -Q "SELECT 1" -b -l 5 >/dev/null 2>&1; do 
  sleep 2
done
echo "SQL Server is ready."

run() { 
  local db="$1" 
  local file="$2"
  echo "Running ($db): $file"
  sqlcmd -S localhost,1433 -U SA -P "${SA_PASSWORD}" ${db:+-d "$db"} -i "$file"
}

echo "=== Setting up Source Database ==="
run master "Scripts/Source_Data/DDL_DB.sql"
run "$SOURCE_DB" "Scripts/Source_Data/Source_DB.sql"

echo "=== Initializing Data Warehouse ==="
run master "Scripts/init_database.sql"

echo "=== Creating Bronze Layer ==="
run "$DW_DB" "Scripts/bronze/DDl_bronze_layer.sql"
run "$DW_DB" "Scripts/bronze/load _data_to_bronzeLayer.sql"

echo "=== Creating Silver Layer ==="
run "$DW_DB" "Scripts/silver/DDl_silver.sql"
run "$DW_DB" "Scripts/silver/load_data_silverLayer.sql"

echo "=== Creating Gold Layer ==="
run "$DW_DB" "Scripts/gold/DDl_gold.sql"

echo ""
echo "✅ All done! Your data warehouse is ready."
echo "   Source DB: $SOURCE_DB"
echo "   DW DB: $DW_DB"
