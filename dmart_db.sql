
USE dmart_db;

-- Create Table
CREATE TABLE dmart_sales (
    invoice_id INT,
    date DATE,
    store_city VARCHAR(100),
    category VARCHAR(100),
    product_name VARCHAR(150),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(12,2),
    payment_mode VARCHAR(50),
    customer_type VARCHAR(50)
);

drop table dmart_sales;
show tables;

-- ==========================================
--  BUSINESS INSIGHT QUERIES


-- total revenue
select sum(total_sales) as total_revenue
from dmart_sales;

-- total quantity sold
select sum(quantity) as total_quantity
from dmart_sales;

-- total invoices
select count(distinct invoice_id) as total_invoices
from dmart_sales;

-- average bill value
select avg(total_sales) as avg_bill_value
from dmart_sales;

-- highest single bill
select max(total_sales) as highest_bill
from dmart_sales;

-- lowest single bill
select min(total_sales) as lowest_bill
from dmart_sales;

-- sales by category
select category, sum(total_sales) as total_sales
from dmart_sales
group by category
order by total_sales desc;

-- quantity by category
select category, sum(quantity) as total_qty
from dmart_sales
group by category
order by total_qty desc;

-- top 10 products by revenue
select product_name, sum(total_sales) as total_sales
from dmart_sales
group by product_name
order by total_sales desc
limit 10;

-- top 10 products by quantity
select product_name, sum(quantity) as total_qty
from dmart_sales
group by product_name
order by total_qty desc
limit 10;

-- city wise sales
select store_city, sum(total_sales) as total_sales
from dmart_sales
group by store_city
order by total_sales desc;

-- city wise invoices
select store_city, count(distinct invoice_id) as invoices
from dmart_sales
group by store_city
order by invoices desc;

-- payment mode distribution
select payment_mode, count(*) as transactions,
sum(total_sales) as total_sales
from dmart_sales
group by payment_mode
order by total_sales desc;

-- customer type sales
select customer_type, sum(total_sales) as total_sales
from dmart_sales
group by customer_type
order by total_sales desc;

-- monthly sales trend
select year(date) as yr,
month(date) as mn,
sum(total_sales) as monthly_sales
from dmart_sales
group by yr, mn
order by yr, mn;

-- yearly sales
select year(date) as yr,
sum(total_sales) as yearly_sales
from dmart_sales
group by yr;

-- average unit price by category
select category, avg(unit_price) as avg_price
from dmart_sales
group by category
order by avg_price desc;

-- revenue per invoice
select invoice_id, sum(total_sales) as invoice_total
from dmart_sales
group by invoice_id
order by invoice_total desc
limit 10;

-- busiest sales day
select date, sum(total_sales) as day_sales
from dmart_sales
group by date
order by day_sales desc
limit 5;

-- products with highest avg price
select product_name, avg(unit_price) as avg_price
from dmart_sales
group by product_name
order by avg_price desc
limit 10;