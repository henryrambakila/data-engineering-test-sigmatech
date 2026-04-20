
  create or replace   view TECHNICALTEST.ANALYTICS.stg_orders
  
   as (
    

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_STATUS,
    ORDER_PURCHASE_TIMESTAMP
FROM TECHNICALTEST.PUBLIC.RAW_ORDERS
  );

