create database company;
use company;
select * from sales;

-- 1. Find all orders shipped via 'Economy' mode with a total amount is greater than 25,000.
select order_id from sales 
where ship_mode = "Economy" and Total_Amount>25000;

-- 2. Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

select * from sales 
where category= 'Technology' and country="Ireland" and
order_date>"01-01-2020";

-- 3. List the top 10 most profitable sales transactions in descending order.alter

select * from sales order by unit_profit desc limit 10;

-- skip 10 records, showing next 20 records.
select * from sales order by unit_profit desc limit 10,20;

-- 4. Find all cutomers whose name starts with 'J' and ends with 'n'.
select order_id,customer_name from sales 
where customer_name like 'J%n';

-- 5. Retrieve all product names that contain 'Acco' any where in the name.
select order_id,product_name from sales 
where product_name like '%Acco%';

-- 6. Get the top 5 cities with the highest total sales amount.
select city, sum(total_amount) as total_sales from sales 
group by city order by total_sales desc limit 5;

-- 7. Display the second set of 10 records for customer_name and total_amount in decreasing order.
select customer_name, total_amount from sales
order by total_amount desc limit 10,10; 

-- 8. Find the total_revenue, average unit cost, and total number of orders.
select sum(total_amount) as `Total Revenue`,
avg(unit_cost) as `Average Unit Cost`,
count(order_id) as `total number of orders` from sales;

-- 9. Count unique number of region
-- select region,count(region) as `Region Count` from sales group by region;

select count(distinct(region)) as `unique region` from sales;

-- 10. Find the number of orders placed by each customer. 
select customer_name, count(order_id) as `number of orders` 
from sales
group by customer_name
order by `number of orders` desc; 

-- 11. Rank 5 products based on total sales using rank()
-- 4 types : Row number, rank, dense, ntile
select product_name, sum(total_amount) as total_sales, 
rank() over (order by sum(total_amount) desc) as sales_rank
from sales
group by product_name 
limit 5;
