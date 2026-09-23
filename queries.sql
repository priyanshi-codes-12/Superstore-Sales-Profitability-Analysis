SELECT * FROM superstore;


-- 1. Create Table
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(1000),
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC
);


-- 2. Basic Data Checks

SELECT COUNT(*) FROM superstore;

SELECT * 
FROM superstore
LIMIT 10;


-- 3. Total Revenue & Profit

SELECT 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit
FROM superstore;


-- 4. Category-wise Sales & Profit

SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- 5. Top 5 Products by Revenue

SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;


-- 6. Region-wise Performance

SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


-- 7. Monthly Sales Trend

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS monthly_sales
FROM superstore
GROUP BY month
ORDER BY month;


-- 8. Sub-Category-wise Profit

SELECT 
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC;


-- 9. Selected Loss-making Sub-Categories Analysis

SELECT 
    sub_category,
    AVG(discount) AS avg_discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
WHERE sub_category IN ('Tables', 'Bookcases', 'Supplies', 'Copiers')
GROUP BY sub_category
ORDER BY total_profit;


-- 10. Segment-wise Performance

SELECT 
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT customer_id) AS num_customers
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;


-- 11. Discount Impact on Profit

SELECT 
    discount,
    AVG(profit) AS avg_profit,
    COUNT(*) AS num_orders
FROM superstore
GROUP BY discount
ORDER BY discount;


-- 12. Top 10 Customers by Sales

SELECT 
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- 13. Ship Mode Distribution

SELECT 
    ship_mode,
    COUNT(*) AS num_orders,
    AVG(sales) AS avg_order_value
FROM superstore
GROUP BY ship_mode
ORDER BY num_orders DESC;