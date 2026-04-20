
  create or replace   view TECHNICALTEST.ANALYTICS.stg_customers
  
   as (
    

SELECT
    CUSTOMER_ID,
    CUSTOMER_CITY,
    CUSTOMER_STATE
FROM TECHNICALTEST.PUBLIC.RAW_CUSTOMERS
  );

