94% of storage used … If you run out of space, you can't save to Drive, back up Google Photos, or use Gmail. Get 30 GB of storage for ₹59.00 ₹15.00 for 1 month.
# VIEWS  
/*
MySQL allows you to create a view based on a SELECT statement 
that retrieves data from one or more tables. 
*/
/*In views, data is not stored, only the query is stored.*/ 
##################### View 1 ##################################

# This statement uses the CREATE VIEW statement to create a view 
# that represents sales per order.
CREATE or replace VIEW salePerOrder AS(
    SELECT 
        orderNumber, 
        SUM(quantityOrdered * priceEach) as total
    FROM
        orderDetails
    GROUP by orderNumber
    ORDER BY total DESC);

#Show create view salesPerorder;
 # execute a simple SELECT  statement against the SalePerOrder  
 Select * from saleperorder;
 #view as follows:
   
show tables;
##################### View 2 ##################################
# Creating a view based on another view example
# you can create a view called bigSalesOrder based on the 
# salesPerOrder view to show every sales order whose total is 
# greater than 60,000 as follows:
CREATE or replace VIEW bigSalesOrder AS(
    SELECT 
        orderNumber, 
        ROUND(total,0) as total
    FROM
        salePerOrder
    WHERE
        total > 60000);
# Now, you can query the data from the bigSalesOrder view as follows:
SELECT *
FROM bigSalesOrder; 

##################### View 3 ##################################
# Creating a view with join example    
 # CREATE VIEW statement to create a view based on multiple tables. 
 # It uses the INNER JOIN clauses to join tables.
CREATE VIEW customerOrders1 AS(
SELECT 
    orderNumber,
    customerName,
    round(SUM(quantityOrdered * priceEach),0) as total
FROM
    orderDetails
INNER JOIN orders  USING (orderNumber)
INNER JOIN customers USING (customerNumber)
GROUP BY orderNumber);

# This statement selects data from the customerOrders view:
SELECT * FROM customerOrders1
ORDER BY total DESC;

##################### View 4 ##################################
# Creating a view with a subquery example
# The view contains products whose buy prices are higher than the 
# average price of all products.
CREATE VIEW aboveAvgProducts AS (
    SELECT 
        productCode, 
        productName, 
        buyPrice
    FROM products
    WHERE buyPrice > (
            SELECT 
                AVG(buyPrice)
            FROM
                products)
    ORDER BY buyPrice DESC);

# This query data from the aboveAvgProducts is simple as follows:

SELECT * FROM aboveAvgProducts;            

create view buyorders as (SELECT 
    productName, productDescription, buyPrice
FROM
    products
WHERE
    buyPrice > (SELECT 
            AVG(buyPrice)
        FROM
            products)
ORDER BY buyPrice DESC);

Select * from buyorders;


/*
Materialized View:
A materialized view is a database object that stores the results 
of a query and provides fast access to the precomputed 
results, rather than computing the results on the fly each 
time the query is executed.
*/