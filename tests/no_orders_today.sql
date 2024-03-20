-- Test to check that there are no orders from today
-- Assumption: this test is run at the beginning of the day, 
-- before a company has opened for business.

SELECT 
    COUNT(*) as num_orders_today
FROM 
    {{ref('stg_orders')}}
WHERE 
    DATE(order_date) = CURRENT_DATE()
HAVING 
    COUNT(*) > 0