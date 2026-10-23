-- Zepto Inventory & Retail Data Analysis
-- Database: MySQL
-- Table: zepto_v2
-- Project status: In Progress
-- Note: Run these queries in MySQL Workbench after importing  the dataset.
-- This script reports record-level patterns; repeated names are not automatically duplicates.

USE zepto_analysis;

-- 1. Preview the dataset
SELECT *
FROM zepto_v2
LIMIT 10;

-- 2. Count total records
SELECT COUNT(*) AS total_records
FROM zepto_v2;

-- 3. Count distinct product names
SELECT COUNT(DISTINCT name) AS unique_product_names
FROM zepto_v2;

-- 4. Count records by category
SELECT
    Category,
    COUNT(*) AS total_records
FROM zepto_v2
GROUP BY Category
ORDER BY total_records DESC;

-- 5. Summarize stock status
SELECT
    outOfStock,
    COUNT(*) AS total_records
FROM zepto_v2
GROUP BY outOfStock
ORDER BY total_records DESC;

-- 6. Find records with the highest discount percentages
SELECT
    name,
    Category,
    mrp,
    discountedSellingPrice,
    discountPercent,
    availableQuantity
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

-- 7. Calculate the difference between MRP and discounted selling price
-- Validate price units and unusually high values before interpreting as real savings.
SELECT
    name,
    Category,
    mrp,
    discountedSellingPrice,
    (mrp - discountedSellingPrice) AS price_difference,
    discountPercent
FROM zepto_v2
ORDER BY price_difference DESC
LIMIT 10;

-- 8. Find product names that appear more than once
-- Repeated names are not necessarily duplicate records.
SELECT
    name,
    COUNT(*) AS occurrences
FROM zepto_v2
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY occurrences DESC
LIMIT 10;

-- 9. Find product names associated with multiple categories
SELECT
    name,
    COUNT(DISTINCT Category) AS category_count,
    COUNT(*) AS total_records
FROM zepto_v2
GROUP BY name
HAVING COUNT(DISTINCT Category) > 1
ORDER BY category_count DESC
LIMIT 20;

-- 10. Check missing values in key fields
SELECT
    SUM(name IS NULL OR TRIM(name) = '') AS missing_product_names,
    SUM(Category IS NULL OR TRIM(Category) = '') AS missing_categories,
    SUM(mrp IS NULL) AS missing_mrp,
    SUM(discountedSellingPrice IS NULL) AS missing_selling_price,
    SUM(discountPercent IS NULL) AS missing_discount,
    SUM(outOfStock IS NULL) AS missing_stock_status
FROM zepto_v2;
