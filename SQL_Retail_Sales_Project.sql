-- (Q1) Write a sql query to retrieve all columns for sales mode on '2022-11-05
SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-11-05';


-- (Q2) write a sql query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 10 in the, month of november
SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'clothing' AND quantiy >= 4
        AND MONTH(sale_date) = 11;

-- (Q3) write a sql query to calculate the total sales for each category
SELECT 
    category,
    SUM(total_sale) AS net_sales,
    COUNT(*) AS total_orders
FROM
    retail_sales
GROUP BY category;

-- (4) write a sql query to find the avg age of customers who purchased items from the 'beauty' category
SELECT 
    category, ROUND(AVG(age), 2) AS avg_age
FROM
    retail_sales
WHERE
    category = 'beauty';

-- (5)write a sql query to find all the transactions where the total_sales is greater than 1000.
SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > '1000';
    
    
-- (Q6)write a sql query to find the total number of transactions made by each gender in each category.
SELECT 
    gender, category, COUNT(transaction_id)
FROM
    retail_sales
GROUP BY gender , category
ORDER BY category , gender;


-- (Q7)write a sql query to calculate the average sale for each month. Find out best selling month in each year.
select * from
(
select
      year(sale_date) as year,
	  month(sale_date) as month,
      avg(total_sale) as Total_sale,
      rank() over(partition by year(sale_date) order by avg(total_sale) desc) as sales_rank
 from 
      retail_sales
 group by year,month
) as t1
where
      sales_rank = 1;

-- (Q8) write a sql query to find the top five customers based on the highest total sales
SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- (Q9) write a sql query to find the number of unique customers who purchsed item from each category
SELECT 
    category, COUNT(DISTINCT customer_id) AS distinct_customers
FROM
    retail_sales
GROUP BY category;
 
 -- (10) write a query to create each shift and number of orders (example morning <=12, afternoon between 12 & 17, evening > 17)
 SELECT 
    *,
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift
FROM
    retail_sales;













