--1.Overview

select *
from orders;

--total sales

select sum(sales)
from orders;

--total profit

select sum(profit)
from orders;

--profit ratio

select sum(profit)/sum(sales) as ratio
from orders;

--profit per order

select 
	order_id, 
	sum(profit)
from orders
group by order_id ;

--sales per customer

select 	
	customer_id,
	sum(sales)
from orders
group by customer_id ;

--avg discount

select avg(discount)
from orders;

-- Monthly Sales by Segment

select 
	date_part('month', order_date) as month,
	segment, 
	sum(sales) as Mounthly_sales_by_segment
from orders
group by 
	date_part('month', order_date), 
	segment
order by 1,2;


-- Monthly Sales by Product Category (табличка и график)

select 
	date_part('month', order_date) as month,
	category, 
	sum(sales) as Mounthly_sales_by_category
from orders
group by 
	date_part('month', 
	order_date), category
order by 1,2;

--2. Product dashboard

-- Sales by Product Category over time (Продажи по категориям)

select 
	category, 
	sum(sales) as Mounthly_sales_by_category
from 
	orders
group by 
	category
order by 1;


--3.Customer analysis

-- Sales and Profit by Customer

select 
	customer_id,
	sum(sales) sales, 
	sum(profit) profit
from 
	orders
group by 
	customer_id ;

--Customer Ranking

select 
	order_id,
	sales,
	rank() over (order by sales desc) as rank
from orders;

--Sales per region

select
	region,
	sum(sales) sales_per_region;
from orders
group by region;
