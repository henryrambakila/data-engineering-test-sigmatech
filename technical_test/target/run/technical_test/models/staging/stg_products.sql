
  create or replace   view TECHNICALTEST.ANALYTICS.stg_products
  
   as (
    

SELECT
    PRODUCT_ID,
    PRODUCT_CATEGORY_NAME
FROM TECHNICALTEST.PUBLIC.RAW_PRODUCTS
  );

