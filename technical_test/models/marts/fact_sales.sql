{{ config(materialized='table') }}

SELECT
    oi.ORDER_ID,
    oi.ORDER_ITEM_ID,
    o.CUSTOMER_ID,
    oi.PRODUCT_ID,
    DATE(o.ORDER_PURCHASE_TIMESTAMP) AS DATE_KEY,
    oi.PRICE,
    oi.FREIGHT_VALUE,
    (oi.PRICE + oi.FREIGHT_VALUE) AS TOTAL_AMOUNT
FROM TECHNICALTEST.PUBLIC.RAW_ORDER_ITEMS oi
JOIN {{ ref('stg_orders') }} o
    ON oi.ORDER_ID = o.ORDER_ID