
-- Zepto Inventory & Retail Data Analysis
-- Project status: In Progress

-- 1. Preview the dataset
SELECT *
FROM zepto
FETCH FIRST 10 ROWS ONLY;

-- 2. Count total products
SELECT COUNT(*) AS total_products
FROM zepto;

-- 3. Check products by category
SELECT Category, COUNT(*) AS product_count
FROM zepto
GROUP BY Category
ORDER BY product_count DESC;

-- 4. Find products marked out of stock
SELECT name, Category, availableQuantity
FROM zepto
WHERE outOfStock = 1;

-- 5. Find products with the highest discounts
SELECT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
FETCH FIRST 10 ROWS ONLY;

-- Project: Zepto Inventory and Retail Data Analysis
-- Database: MySQL
-- Table: zepto_v2

USE zepto_analysis;

-- 1. Total records
SELECT COUNT(*) AS total_records
FROM zepto_v2;

-- 2. Unique product names
SELECT COUNT(DISTINCT name) AS unique_product_names
FROM zepto_v2;

-- 3. Product records by category
SELECT
    Category,
    COUNT(*) AS total_records
FROM zepto_v2
GROUP BY Category
ORDER BY total_records DESC;

-- 4. Stock availability
SELECT
    outOfStock,
    COUNT(*) AS total_records
FROM zepto_v2
GROUP BY outOfStock
ORDER BY total_records DESC;

-- 5. Top 10 discounted records
SELECT
    name,
    Category,
    mrp,
    discountedSellingPrice,
    discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

-- 6. Potential savings per listed unit
SELECT
    name,
    mrp,
    discountedSellingPrice,
    mrp - discountedSellingPrice AS potential_savings,
    discountPercent
FROM zepto_v2
ORDER BY potential_savings DESC
LIMIT 10;

-- 7. Repeated product names
SELECT
    name,
    COUNT(*) AS occurrences
FROM zepto_v2
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY occurrences DESC
LIMIT 10;

-- 8. Product names appearing in multiple categories
SELECT
    name,
    COUNT(DISTINCT Category) AS category_count,
    COUNT(*) AS total_records
FROM zepto_v2
GROUP BY name
HAVING COUNT(DISTINCT Category) > 1
ORDER BY category_count DESC
LIMIT 20;


