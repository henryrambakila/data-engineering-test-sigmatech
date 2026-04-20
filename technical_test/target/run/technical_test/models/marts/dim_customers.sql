
  
    

        create or replace transient table TECHNICALTEST.ANALYTICS.dim_customers
         as
        (

SELECT *
FROM TECHNICALTEST.ANALYTICS.stg_customers
        );
      
  