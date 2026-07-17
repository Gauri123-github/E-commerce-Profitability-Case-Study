-- 1.Total Revenue
SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM ecommerce;

-- 2.Total Orders
SELECT ROUND(SUM(total_amount),2) AS Total_Revenue
FROM ecommerce;

-- 3.Total Customers
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM ecommerce;

-- 4. Average Order Value
SELECT ROUND(AVG(total_amount),2) AS Average_Order_Value
FROM ecommerce;

-- 5. Top 10 Selling Products
SELECT
product_id,
SUM(quantity) AS Total_Quantity
FROM ecommerce
GROUP BY product_id
ORDER BY Total_Quantity DESC
LIMIT 10;

-- 6. Top Categories by Revenue
SELECT
category,
ROUND(SUM(total_amount),2) AS Revenue
FROM ecommerce
GROUP BY category
ORDER BY Revenue DESC;

-- 7. Highest Revenue Region
SELECT
region,
ROUND(SUM(total_amount),2) AS Revenue
FROM ecommerce
GROUP BY region
ORDER BY Revenue DESC;

-- 8. Payment Method Usage
SELECT
payment_method,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY payment_method
ORDER BY Orders DESC;

-- 9.Returned Orders
SELECT
returned,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY returned;

-- 10.Return Percentage
SELECT
ROUND(
100 * SUM(CASE WHEN returned='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) AS Return_Percentage
FROM ecommerce;

-- 11. Monthly Sales
SELECT
MONTH(order_date) AS Month,
ROUND(SUM(total_amount),2) AS Revenue
FROM ecommerce
GROUP BY MONTH(order_date)
ORDER BY Month;

-- 12.Average Delivery Time
SELECT
ROUND(AVG(delivery_time_days),2) AS Avg_Delivery_Days
FROM ecommerce;

-- 13.Region-wise Average Delivery
SELECT
region,
ROUND(AVG(delivery_time_days),2) AS Avg_Delivery
FROM ecommerce
GROUP BY region;

-- 14.Average Customer Age
SELECT
ROUND(AVG(customer_age),2)
FROM ecommerce;

-- 15.Gender Distribution
SELECT
customer_gender,
COUNT(*) AS Customers
FROM ecommerce
GROUP BY customer_gender;

-- 16.Revenue by Gender
SELECT
customer_gender,
ROUND(SUM(total_amount),2) AS Revenue
FROM ecommerce
GROUP BY customer_gender;

-- 17.Average Discount by Category
SELECT
category,
ROUND(AVG(discount),2) AS Avg_Discount
FROM ecommerce
GROUP BY category
ORDER BY Avg_Discount DESC;

-- 18. Profit by Category
SELECT
category,
ROUND(SUM(total_amount * profit_margin / 100),2) AS Profit
FROM ecommerce
GROUP BY category
ORDER BY Profit DESC;

-- 19.Top 10 Customers by Spending
SELECT
customer_id,
ROUND(SUM(total_amount),2) AS Total_Spent
FROM ecommerce
GROUP BY customer_id
ORDER BY Total_Spent DESC
LIMIT 10;

-- 20.Most Popular Payment Method by Region
SELECT
region,
payment_method,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY region, payment_method
ORDER BY region, Orders DESC;

-- 21. Orders by Weekday
SELECT
DAYNAME(order_date) AS Weekday,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY DAYNAME(order_date);

-- 22. Shipping Cost Analysis
SELECT
ROUND(AVG(shipping_cost),2) AS Avg_Shipping,
MAX(shipping_cost) AS Max_Shipping,
MIN(shipping_cost) AS Min_Shipping
FROM ecommerce;

-- 23. Top 5 Regions by Profit
SELECT
region,
ROUND(SUM(total_amount * profit_margin / 100),2) AS Profit
FROM ecommerce
GROUP BY region
ORDER BY Profit DESC
LIMIT 5;

-- 24. Revenue After Discount
SELECT
ROUND(SUM(price * quantity),2) AS Gross_Sales,
ROUND(SUM(total_amount),2) AS Net_Sales
FROM ecommerce;

-- 25. High-Value Orders (Above ₹1000)
SELECT *
FROM ecommerce
WHERE total_amount > 1000
ORDER BY total_amount DESC;

