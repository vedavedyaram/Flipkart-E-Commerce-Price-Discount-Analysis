CREATE DATABASE FLIPKART;
USE FLIPKART;

CREATE TABLE flipkart_products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    seller VARCHAR(100),
    seller_city VARCHAR(100),
    price DECIMAL(12,2),
    discount_percent INT,
    final_price DECIMAL(12,2),
    rating DECIMAL(3,1),
    review_count INT,
    stock_available INT,
    units_sold INT,
    listing_date DATE,
    delivery_days INT,
    weight_g DECIMAL(10,2),
    warranty_months INT,
    color VARCHAR(50),
    size VARCHAR(50),
    return_policy_days INT,
    is_returnable BOOLEAN,
    payment_modes VARCHAR(100),
    shipping_weight_g DECIMAL(12,6),
    product_score DECIMAL(6,2),
    seller_rating DECIMAL(3,2));
    
    SET GLOBAL local_infile = 1;
    
    SHOW GLOBAL VARIABLES LIKE 'local_infile';
    
    
LOAD DATA LOCAL INFILE
"C:/Users/mundr/OneDrive/Desktop/Flipkart E-Commerce Price & Discount Analysis.csv"
INTO TABLE flipkart_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM flipkart_products;

# 1. Display first 10 product records #
SELECT * FROM flipkart_products LIMIT 10;


# 2. Check total number of products #
SELECT COUNT(*) AS Total_Products
FROM flipkart_products;


# 3. Find unique product categories #
SELECT DISTINCT category
FROM flipkart_products;


# 4. Find all products belonging to Electronics category #
SELECT *
FROM flipkart_products
WHERE category = 'Electronics';


# 5. Find products offering a discount of 30% or more #
SELECT product_name, category, price, discount_percent, final_price
FROM flipkart_products
WHERE discount_percent >= 30;


# 6. Find products with ratings greater than 4.0 #
SELECT product_name, brand, rating, review_count
FROM flipkart_products
WHERE rating > 4.0
ORDER BY rating DESC;


# 7. Find products priced between 10000 and 30000 #
SELECT product_name, category, price
FROM flipkart_products
WHERE price BETWEEN 10000 AND 30000;


# 8. Find products listed by sellers from Hyderabad, Mumbai and Bengaluru #
SELECT product_name, seller, seller_city, price
FROM flipkart_products
WHERE seller_city IN ('Hyderabad', 'Mumbai', 'Bengaluru');


# 9. Calculate total products available in each category #
SELECT
    category,
    COUNT(*) AS Total_Products
FROM flipkart_products
GROUP BY category
ORDER BY Total_Products DESC;


# 10. Calculate average product price and final price for each category #
SELECT
    category,
    ROUND(AVG(price), 2) AS Average_Original_Price,
    ROUND(AVG(final_price), 2) AS Average_Final_Price
FROM flipkart_products
GROUP BY category
ORDER BY Average_Final_Price DESC;


# 11. Find top 10 products based on highest units sold #
SELECT
    product_name,
    category,
    units_sold,
    price
FROM flipkart_products
ORDER BY units_sold DESC
LIMIT 10;


# 12. Calculate average rating and total reviews for each brand #
SELECT
    brand,
    ROUND(AVG(rating), 2) AS Average_Rating,
    SUM(review_count) AS Total_Reviews
FROM flipkart_products
GROUP BY brand
ORDER BY Average_Rating DESC;


# 13. Identify sellers with an average seller rating greater than 4.0 #
SELECT
    seller,
    ROUND(AVG(seller_rating), 2) AS Average_Seller_Rating
FROM flipkart_products
GROUP BY seller
HAVING AVG(seller_rating) > 4.0
ORDER BY Average_Seller_Rating DESC;


# 14. Calculate total units sold and average discount for each category #
SELECT
    category,
    SUM(units_sold) AS Total_Units_Sold,
    ROUND(AVG(discount_percent), 2) AS Average_Discount
FROM flipkart_products
GROUP BY category
ORDER BY Total_Units_Sold DESC;


# 15. Find top 5 sellers based on total units sold #
SELECT
    seller,
    SUM(units_sold) AS Total_Units_Sold
FROM flipkart_products
GROUP BY seller
ORDER BY Total_Units_Sold DESC
LIMIT 5;

# 16. Categorize products based on their price using CASE #
SELECT
    product_name,
    category,
    price,
    CASE
        WHEN price < 1000 THEN 'Low Price'
        WHEN price BETWEEN 1000 AND 10000 THEN 'Medium Price'
        WHEN price BETWEEN 10001 AND 50000 THEN 'High Price'
        ELSE 'Premium Price'
    END AS Price_Category
FROM flipkart_products;



# 17. Create a VIEW to display high-rated products #
CREATE VIEW High_Rated_Products AS
SELECT
    product_name,
    category,
    brand,
    rating,
    review_count,
    final_price
FROM flipkart_products
WHERE rating >= 4.0;


# 18. Use a CTE to find the top 5 brands based on total units sold #
WITH Brand_Sales AS (
    SELECT
        brand,
        SUM(units_sold) AS Total_Units_Sold
    FROM flipkart_products
    GROUP BY brand
)
SELECT
    brand,
    Total_Units_Sold
FROM Brand_Sales
ORDER BY Total_Units_Sold DESC
LIMIT 5;

