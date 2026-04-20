-- Task 2.1 — Total revenue per day
SELECT
    DATE_KEY,
    SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM analytics.fact_sales
GROUP BY DATE_KEY
ORDER BY DATE_KEY DESC;

-- Task 2.2 — Top 5 products by revenue (last 30 days)
SELECT
    p.PRODUCT_ID,
    p.PRODUCT_CATEGORY_NAME,
    SUM(f.TOTAL_AMOUNT) AS REVENUE
FROM analytics.fact_sales f
JOIN analytics.dim_products p
    ON f.PRODUCT_ID = p.PRODUCT_ID
WHERE f.DATE_KEY >= DATEADD(DAY, -30, '2018-09-03')
-- WHERE f.DATE_KEY >= DATEADD(DAY, -30, CURRENT_DATE)
GROUP BY p.PRODUCT_ID, p.PRODUCT_CATEGORY_NAME
ORDER BY REVENUE DESC
LIMIT 5;

-- Task 2.3 — Monthly active customers
SELECT
    DATE_TRUNC('MONTH', DATE_KEY) AS MONTH,
    COUNT(DISTINCT CUSTOMER_ID) AS ACTIVE_CUSTOMERS
FROM analytics.fact_sales
GROUP BY MONTH
ORDER BY MONTH DESC;

-- Task 2.4 — Average order value per customeR
SELECT
    CUSTOMER_ID,
    AVG(ORDER_TOTAL) AS AVG_ORDER_VALUE
FROM (
    SELECT
        ORDER_ID,
        CUSTOMER_ID,
        SUM(TOTAL_AMOUNT) AS ORDER_TOTAL
    FROM analytics.fact_sales
    GROUP BY ORDER_ID, CUSTOMER_ID
) t
GROUP BY CUSTOMER_ID
ORDER BY CUSTOMER_ID;

-- Task 2.5 — Data anomaly
-- Dataset tidak memiliki quantity, diasumsikan 1 per item.
SELECT *,
    CASE 
        WHEN PRICE <= 0 THEN 'INVALID_PRICE'
        WHEN CUSTOMER_ID IS NULL THEN 'MISSING_CUSTOMER'
        ELSE 'OK'
    END AS DATA_QUALITY_FLAG
FROM analytics.fact_sales;
