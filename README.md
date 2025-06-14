# 🏭 Optimizing Supply Chain Insights with SQL & Power BI: A Case Study on BLT Industries

> 📌 *Disclaimer: This project was developed as a portfolio showcase. BLT Industries is a fictitious entity created solely for demonstration purposes.*

---

## 📘 Background & Overview

BLT Industries is a hypothetical mid-sized manufacturer expanding its supply chain. As data complexity grew, the goal was to build an analytics solution from the ground up using SQL Server Management Studio (SSMS) and Power BI. All data was manually entered via SQL commands to simulate unstructured source data, ensuring control over the model design and cleaning process.

The final deliverable was a two-page Power BI report focusing on financial insights and warehouse operations to help decision-makers take action quickly and effectively.

---

## 🗃️ Data Overview

### Relational Database Model — 6 Tables:

1. **Products:** `ProductID`, `ProductName`, `Category`, `SupplierID`, `CostPrice`  
2. **Suppliers:** `SupplierID`, `SupplierName`, `Region`, `Rating`  
3. **Warehouses:** `WarehouseID`, `WarehouseName`, `City`, `State`, `Capacity`  
4. **Orders:** `OrderID`, `ProductID`, `OrderDate`, `Quantity`, `UnitPrice`, `CustomerID`, `WarehouseID`  
5. **Inventory:** `ProductID`, `WarehouseID`, `StockQuantity`, `ReorderLevel`, `LastRestockDate`  
6. **Shipments:** `ShipmentID`, `OrderID`, `DispatchDate`, `DeliveryDate`, `Status`  

Each table was created with appropriate keys and referential constraints to maintain relational integrity.

---

## 🧮 Data Exploration in SQL

### 10 Key Business Questions Answered:

1. Top 5 products by revenue  
2. Suppliers with broad category offerings  
3. Average delivery delay by supplier region  
4. Low-stock products vs. reorder level  
5. Warehouses with <50% utilization  
6. Orders with >7-day shipment delay  
7. Monthly order & revenue trend  
8. Top 3 customers by shipment delays  
9. Categories with >20% average margin  
10. Regions with >10% shipment delay rate  

These queries involved `JOIN`s, `GROUP BY`, date calculations, and conditional logic to extract actionable operational and financial insights.

---

## 📊 Power BI Report Development

### Step 1: Time Intelligence

Created a **Date Table** with fiscal year, quarter, and month columns

### Step 2: DAX Measures

Custom KPIs created include:

- Total Sales  
- Total Orders  
- Gross Profit & Margin  
- COGS (Cost of Goods Sold)  
- Order Fulfilment Rate  
- Average Warehouse Capacity  
- Average Delivery Time  

### Step 3: Native SQL Query

Used Power BI's SQL native query feature to pull in pre-cleaned warehouse utilization and shipment data directly from SSMS.

---

## 📈 Page 1: Financial Analysis Report

### KPIs (Card Visuals):

- **Total Orders**  
- **Total Sales**  
- **Gross Margin**  

### Charts:

- **Sales by Month:** Line chart with forecast (95% CI)  
- **Revenue vs. COGS vs. Gross Profit:** Time trend comparison  
- **Top 10 Products by Sales:** Treemap  
- **Sales by Category & Region:** Matrix with conditional formatting  

### Slicers:

- Region (East, North, South, West)  
- Year (2023–2025)  
- State-level filtering
  
![Fin Analysis](https://github.com/user-attachments/assets/2d35d22a-18eb-449e-a5fd-c4af80f522cb)

---

## 🏪 Page 2: Inventory & Warehouse Operations Report

### KPIs:

- **Avg. Warehouse Capacity**  
- **Order Fulfilment Rate**  
- **Avg. Delivery Time**  

### Visuals:

- **Inventory Levels Over Time:** Line chart (Stock vs. Reorder Level)  
- **Shipment Status:** Donut chart (Delivered, Delayed, In Transit)  
- **Orders by Category/Product:** Drill-down bar chart  
- **Warehouse Utilization Table:** Conditional formatting by stock/capacity ratio  

### Slicers:

- Region  
- Year  
- State  

![Inventory Analysis](https://github.com/user-attachments/assets/1332e71d-2c72-4d3f-9e94-c1810021fdd5)

---

## 🔍 Key Insights & Recommendations

### Insight 1: High Gross Margin (62.29%)

**Recommendation:** Maintain cost controls and supplier terms to preserve margin.

### Insight 2: Sales Imbalance by Category and Region

- Food category underperforms  
- South region lags in revenue  

**Recommendation:** Audit marketing and fulfillment effectiveness in low-performing segments.

### Insight 3: Low Order Fulfilment Rate (33.31%)

**Recommendation:** Investigate delays — likely caused by vendor issues, inventory stockouts, or transport delays.

### Insight 4: Underutilized Warehouses (e.g., Lisaside 11.08%)

**Recommendation:** Consolidate low-performing warehouses and review routing efficiencies.

---

## 🧾 Final Thoughts

This case study demonstrates end-to-end analytics: from designing the relational model in SQL to deriving insights and turning them into a compelling, stakeholder-ready report in Power BI. While the tools were important, the real value came from asking the right business questions and ensuring that data and visuals worked together to support confident decision-making.

