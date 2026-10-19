
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
