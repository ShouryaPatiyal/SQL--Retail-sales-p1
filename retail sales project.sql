-- Creating table for Retail sales analysis--

Create table retail_sales(
transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(20),
age int,
category varchar(20),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
);

select count(*) from retail_sales;
select * from retail_sales;

--checking NULL values from the records--

select * from retail_sales 
where transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or 
gender is null
or 
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

-- Deleting NULL records for cleaning data--

delete from retail_sales 
where 
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or 
gender is null
or 
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

--Data analysis and finding--

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'.  

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022.  

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.  

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.  

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.  

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.  

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out the best selling month in each year.  

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.  

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.  

--------------------------------------------------------------------------------------------------------------------------------------

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'.

select * from retail_sales 
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022.  

SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND quantiy >= 3
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category,sum(total_sale)  as total_sale from retail_sales 
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.  

select  ROUND(avg(age),0) from retail_sales
where category= 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.  

select * from retail_sales 
where total_sale>1000;

select count(*) from retail_sales 
where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.  

select category, gender, count(*)
from retail_sales 
group by 1,2;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out the best selling month in each year.

select extract(month from sale_date) as month,
extract(year from sale_date) as year,
avg(total_sale) as avg_sale
from retail_sales
group by month,year
order by month, avg_sale desc;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.  

select customer_id, sum(total_sale) as sales from retail_sales
group by customer_id
order by sales desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.  

select
category, count(distinct(customer_id))
from retail_sales group by category;

------ END OF THE PROJECT-----------

