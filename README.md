# 📊 ComptoirDB – Data Warehouse, OLAP & Data Mining Project

## 📌 Project Overview
This project aims to build a complete **Business Intelligence (BI) solution** for the *ComptoirDB* dataset.  
The solution covers the full data lifecycle: from data ingestion and cleaning, to data warehousing, OLAP analysis, dashboarding, and finally data mining techniques to extract hidden knowledge.

---

## 🏗️ 1. Data Warehouse Architecture (Medallion Architecture)

The project follows the **Medallion Architecture**, a modern and scalable data architecture commonly used in Databricks environments.

### 🔹 Bronze Layer
- Raw data ingestion
- Data loaded directly from source systems
- Minimal transformation
- Purpose: **data traceability and history**

### 🔹 Silver Layer
- Cleaned and standardized data
- Removal of duplicates and inconsistencies
- Data quality improvements
- Business-ready relational tables (clients, products, orders, etc.)

### 🔹 Gold Layer (Data Warehouse)
- Optimized for analytical queries
- Dimensional modeling (Star Schema)
- Used for OLAP analysis and dashboards

---

## ⭐ 2. Dimensional Modeling (Star Schema)

The **Gold layer** is designed as a **star schema**, enabling fast and efficient analytical queries.

### 📐 Dimensions
The OLAP cube is built using **three dimensions**:

#### 🧑‍💼 Dim_Client
- Customer information
- Attributes: company, city, country, region

#### 📦 Dim_Product
- Product and category information
- Attributes: product name, category, unit price

#### 🗓️ Dim_Time
- Time-related attributes
- Attributes: day, month, quarter, year

### 📊 Fact Table – Fact_Sales
The fact table stores transactional measures:
- Quantity sold
- Discount
- Unit price
- Sales amount (pre-calculated)
- Freight cost

📌 **Grain**: one row per product per order.

---

## 🧊 3. OLAP Cube

The combination of:
- `Fact_Sales`
- `Dim_Client`
- `Dim_Product`
- `Dim_Time`

forms an **OLAP cube** that allows multidimensional analysis such as:
- Sales by time
- Sales by customer
- Sales by product and category
- Geographic sales analysis

---

## 📈 4. Dashboarding with Databricks

Using **Databricks SQL Dashboards**, multiple analytical visualizations were created to support decision-making.

### 🔑 Key Performance Indicators (KPIs)
- Total Revenue
- Total Quantity Sold
- Number of Customers
- Number of Categories Sold

### 📊 Analytical Visualizations
- **Line Chart**: Revenue per Month (trend analysis)
- **Bar Chart**: Revenue per Category
- **Bar Chart**: Top 5 Products by Sales
- **Bar Chart**: Top 5 Customers by Revenue
- **Pie / Bar Chart**: Sales Distribution by Country
- **Histogram**: Distribution of Sales Amounts

These dashboards provide an interactive and intuitive overview of business performance.

---

## 🤖 5. Data Mining Implementation

To enrich the decision-making process, **Data Mining techniques** were applied on top of the OLAP cube.

### 🔹 5.1 Customer Clustering (K-Means)

**Objective:**  
Segment customers based on delivery performance.

**Feature used:**  
- Average delivery delay (order date → delivery date)

**Algorithm:**  
- K-Means clustering

**Outcome:**  
- Identification of customer groups:
  - Fast delivery customers
  - Average delivery customers
  - Late delivery customers

📌 This analysis helps evaluate logistics efficiency and customer service quality.

---

### 🔹 5.2 Association Rules Mining (Apriori)

**Objective:**  
Identify products that are frequently purchased together.

**Approach:**  
- Transactions built from order details
- Apriori algorithm (implemented using `mlxtend`)

**Key Metrics:**
- Support
- Confidence
- Lift

**Results:**  
- Discovery of strong product associations
- Insights for cross-selling and product bundling strategies

### 📊 Visualization of Association Rules
- **Table**: all generated rules
- **Bar Chart**: Top rules ranked by Lift
- **Scatter Plot**: Confidence vs Lift

---

## 🎯 6. Business Value

This project demonstrates how combining:
- Data Warehousing
- OLAP Analysis
- Interactive Dashboards
- Data Mining

can significantly enhance **data-driven decision-making**, offering insights into sales performance, customer behavior, logistics efficiency, and product associations.

---

## ✅ Conclusion

The implementation of a Medallion Architecture-based Data Warehouse, followed by OLAP and Data Mining techniques, provides a complete and scalable BI solution.  
This approach transforms raw data into actionable insights, supporting both operational monitoring and strategic decision-making.

---

## 🛠️ Technologies Used
- Databricks
- Apache Spark / PySpark
- SQL
- MLlib / mlxtend
- Databricks SQL Dashboards

---


