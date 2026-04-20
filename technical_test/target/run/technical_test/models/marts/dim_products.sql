
  
    

        create or replace transient table TECHNICALTEST.ANALYTICS.dim_products
         as
        (

SELECT *
FROM TECHNICALTEST.ANALYTICS.stg_products
        );
      
  