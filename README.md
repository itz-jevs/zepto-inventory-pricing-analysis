# Zepto Inventory & Retail Data Analysis Using SQL

## Project Overview

This project analyzes a Zepto product inventory dataset using MySQL. The goal is to explore product categories, stock availability, discount percentages, pricing patterns, and repeated product names to identify useful data patterns and potential data-quality issues.

## Project Objectives

- Analyze product records across categories.
- Examine in-stock and out-of-stock records.
- Identify products with the highest discount percentages.
- Calculate the difference between MRP and discounted selling price.
- Investigate repeated product names and products listed under multiple categories.
- Check the dataset for missing values and potential data-quality issues.

## Tools Used

- **MySQL Workbench** — SQL queries and data analysis
- **SQL** — Data exploration, aggregation, filtering, and sorting
- **GitHub** — Project documentation and version control

## Dataset Summary

| Metric | Result |
|---|---:|
| Records in the imported table | 3,728 |
| Unique product names | 1,674 |
| In-stock records | 3,275 |
| Out-of-stock records | 453 |
| Columns in the original import | 9 |

*Note: These figures describe the imported dataset. Repeated product names are not necessarily duplicate records.*

## Analysis Performed

### 1. Product Category Analysis
Counted product records in each category and sorted the categories by record count.

### 2. Stock Availability Analysis
Grouped records by stock status to examine the distribution of in-stock and out-of-stock products.

### 3. Discount Analysis
Ranked product records by discount percentage to identify the highest advertised discounts.

### 4. Price Difference Analysis
Calculated the difference between MRP and discounted selling price. Price values and units require validation before interpreting these differences as reliable customer savings.

### 5. Repeated Product Names
Identified product names appearing multiple times and investigated whether their package weights, prices, quantities, or other attributes differ.

### 6. Category Consistency
Identified product names associated with multiple categories for further data-quality investigation.

### 7. Data Quality Checks
Included checks for missing values in important product, category, price, discount, and stock-status fields.

## Initial Findings

- The imported table contains 3,728 records and 1,674 distinct product names.
- Stock-status grouping returned 3,275 in-stock records and 453 out-of-stock records.
- Cooking Essentials and Munchies each contained 512 records in the category analysis.
- Some product names appeared multiple times and were associated with different categories.
- Some price values appeared unusually high and should be validated before drawing conclusions about pricing or savings.

## Repository Structure

```text
zepto-data-analysis/
├── README.md
└── sql/
    └── zepto_analysis.sql
```

## How to Run the Project

1. Download or clone this repository.
2. Open MySQL Workbench and connect to your MySQL server.
3. Import the dataset and create the `zepto_analysis` database.
4. Ensure the imported table is named `zepto_v2`.
5. Open `sql/zepto_analysis.sql` in MySQL Workbench.
6. Execute the queries and review the results.

## Project Status

**In Progress** — SQL exploration and initial analysis are complete. Further validation of price values, category assignments, and repeated product records is planned.

## Future Improvements

- Validate and clean inconsistent product records.
- Investigate unusually high price values and confirm units.
- Create an Excel dashboard with key inventory metrics.
- Add visualizations and additional business insights.
