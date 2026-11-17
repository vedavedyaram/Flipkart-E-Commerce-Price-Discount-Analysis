# 🛒 Flipkart E-Commerce Price & Discount Analysis | SQL Project

**Project Level:** Beginner to Intermediate  
**Project Status:** Completed  
**Database:** Flipkart_Analytics  
**SQL Language:** MySQL 8.0+  
**Domain:** Retail & E-Commerce Analytics

## 📌 Project Overview

The **Flipkart E-Commerce Price & Discount Analysis** project demonstrates how SQL can be used to analyze retail product data and generate meaningful business insights.

This project uses a synthetic Flipkart-inspired retail product dataset containing 80,000 product listings across multiple product categories, brands, and sellers.

The analysis focuses on product pricing, discount strategies, customer ratings, seller performance, product availability, units sold, and delivery information.

It is designed to demonstrate practical SQL skills through database creation, data exploration, aggregation, filtering, and business-driven queries.

## 🎯 Project Objectives

- **Database Creation:** Create and manage a retail product database using MySQL.
- **Data Exploration:** Understand product categories, brands, sellers, and product attributes.
- **Pricing Analysis:** Analyze original prices, final prices, and discount percentages.
- **Sales Performance:** Identify top-selling products, brands, and sellers.
- **Rating Analysis:** Evaluate product ratings, reviews, and seller ratings.
- **Inventory Analysis:** Examine stock availability and product performance.
- **Business Insights:** Generate insights to support retail pricing and business decisions.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL 8.0+ | Database management |
| SQL | Data extraction and analysis |
| MySQL Workbench | SQL development environment |
| GitHub | Project documentation and version control |

## 📚 SQL Concepts Covered

- SELECT, WHERE, ORDER BY, LIMIT
- DISTINCT and filtering operators
- GROUP BY and HAVING
- Aggregate Functions (SUM, AVG, COUNT, MIN, MAX)
- BETWEEN and IN operators
- CASE Statements
- Subqueries
- Derived Tables
- Views
- Common Table Expressions (CTEs)
- Date Functions
- Data Cleaning and NULL Handling

## 📂 Project Structure

```text
Flipkart-E-Commerce-Price-and-Discount-Analysis/
│
├── README.md
│
├── database/
│   └── 01_database_setup.sql
│
├── sql/
│   ├── 02_data_exploration.sql
│   ├── 03_data_analysis.sql
│   └── 04_business_analysis.sql
│
├── data/
│   └── flipkard.csv
│
├── insights/
│   └── business_insights.md
│
├── screenshots/
│   ├── sql_queries.png
│   └── sql_results.png
│
└── .gitignore
```

## 🗄️ Database Setup

**Database Name:** `Flipkart_Analytics`

**Table Name:** `flipkart_products`

The dataset contains product information, pricing details, seller information, sales performance, customer ratings, and delivery attributes.

### Dataset Description

| Column Name | Description |
|---|---|
| product_id | Unique product identifier |
| product_name | Name of the product |
| category | Product category |
| brand | Product brand |
| seller | Seller name |
| seller_city | Seller's city |
| price | Original product price |
| discount_percent | Discount percentage |
| final_price | Price after discount |
| rating | Product rating |
| review_count | Number of product reviews |
| stock_available | Available product stock |
| units_sold | Number of units sold |
| listing_date | Product listing date |
| delivery_days | Estimated delivery duration |
| weight_g | Product weight in grams |
| warranty_months | Warranty duration |
| color | Product color |
| size | Product size |
| return_policy_days | Return policy duration |
| is_returnable | Whether the product is returnable |
| payment_modes | Available payment methods |
| shipping_weight_g | Shipping weight in grams |
| product_score | Product performance score |
| seller_rating | Seller rating |

### Create Database

```sql
CREATE DATABASE Flipkart_Analytics;

USE Flipkart_Analytics;
```

### Create Table

```sql
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
    seller_rating DECIMAL(3,2)
);
```

## 🧹 Data Cleaning & Exploratory Data Analysis

Before performing business analysis, the dataset is inspected for quality and consistency.

### Data Cleaning Tasks

- Identify missing and NULL values.
- Check duplicate product records.
- Validate product prices and final prices.
- Check data types and column formats.
- Identify inconsistent product and seller information.
- Examine unusual values in ratings, discounts, and stock availability.

### Exploratory Data Analysis

- Calculate the total number of products.
- Identify unique product categories and brands.
- Explore product price distributions.
- Analyze discount percentages.
- Examine product and seller ratings.
- Identify top-selling products.
- Explore seller locations and product availability.

## 📊 Business Questions & SQL Analysis

This project answers 23 practical business questions using SQL to understand product performance, pricing strategies, discounts, and seller performance.

### 1. Display the first 10 product records

```sql
SELECT *
FROM flipkart_products
LIMIT 10;
```

### 2. Calculate the total number of products

```sql
SELECT COUNT(*) AS Total_Products
FROM flipkart_products;
```

### 3. Find all unique product categories

```sql
SELECT DISTINCT category
FROM flipkart_products;
```

### 4. Find all products belonging to the Electronics category

```sql
SELECT *
FROM flipkart_products
WHERE category = 'Electronics';
```

### 5. Find products offering a discount of 30% or more

```sql
SELECT
    product_name,
    category,
    price,
    discount_percent,
    final_price
FROM flipkart_products
WHERE discount_percent >= 30;
```

### 6. Find products with ratings greater than 4.0

```sql
SELECT
    product_name,
    brand,
    rating,
    review_count
FROM flipkart_products
WHERE rating > 4.0
ORDER BY rating DESC;
```

### 7. Find products priced between ₹10,000 and ₹30,000

```sql
SELECT
    product_name,
    category,
    price
FROM flipkart_products
WHERE price BETWEEN 10000 AND 30000;
```

### 8. Find products listed by sellers from Hyderabad, Mumbai, and Bengaluru

```sql
SELECT
    product_name,
    seller,
    seller_city,
    price
FROM flipkart_products
WHERE seller_city IN ('Hyderabad', 'Mumbai', 'Bengaluru');
```

### 9. Calculate the total number of products in each category

```sql
SELECT
    category,
    COUNT(*) AS Total_Products
FROM flipkart_products
GROUP BY category
ORDER BY Total_Products DESC;
```

### 10. Calculate the average original price and final price for each category

```sql
SELECT
    category,
    ROUND(AVG(price), 2) AS Average_Original_Price,
    ROUND(AVG(final_price), 2) AS Average_Final_Price
FROM flipkart_products
GROUP BY category
ORDER BY Average_Final_Price DESC;
```

### 11. Find the top 10 products based on units sold

```sql
SELECT
    product_name,
    category,
    units_sold,
    price
FROM flipkart_products
ORDER BY units_sold DESC
LIMIT 10;
```

### 12. Calculate average product ratings and total reviews for each brand

```sql
SELECT
    brand,
    ROUND(AVG(rating), 2) AS Average_Rating,
    SUM(review_count) AS Total_Reviews
FROM flipkart_products
GROUP BY brand
ORDER BY Average_Rating DESC;
```

### 13. Identify sellers with an average seller rating greater than 4.0

```sql
SELECT
    seller,
    ROUND(AVG(seller_rating), 2) AS Average_Seller_Rating
FROM flipkart_products
GROUP BY seller
HAVING AVG(seller_rating) > 4.0
ORDER BY Average_Seller_Rating DESC;
```

### 14. Calculate total units sold and average discount for each category

```sql
SELECT
    category,
    SUM(units_sold) AS Total_Units_Sold,
    ROUND(AVG(discount_percent), 2) AS Average_Discount
FROM flipkart_products
GROUP BY category
ORDER BY Total_Units_Sold DESC;
```

### 15. Find the top 5 sellers based on total units sold

```sql
SELECT
    seller,
    SUM(units_sold) AS Total_Units_Sold
FROM flipkart_products
GROUP BY seller
ORDER BY Total_Units_Sold DESC
LIMIT 5;
```

### 16. Find products with zero stock availability

```sql
SELECT *
FROM flipkart_products
WHERE stock_available = 0;
```

### 17. Identify the year with the highest number of product listings

```sql
SELECT
    YEAR(listing_date) AS Listing_Year,
    COUNT(*) AS Total_Listings
FROM flipkart_products
GROUP BY YEAR(listing_date)
ORDER BY Total_Listings DESC;
```

### 18. Categorize products based on discount percentage using CASE

```sql
SELECT
    product_name,
    discount_percent,
    CASE
        WHEN discount_percent = 0 THEN 'No Discount'
        WHEN discount_percent <= 10 THEN 'Low Discount'
        WHEN discount_percent <= 30 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS Discount_Category
FROM flipkart_products;
```

### 19. Categorize products based on their price using CASE

```sql
SELECT
    product_name,
    price,
    CASE
        WHEN price < 1000 THEN 'Low Price'
        WHEN price <= 10000 THEN 'Medium Price'
        WHEN price <= 50000 THEN 'High Price'
        ELSE 'Premium Price'
    END AS Price_Category
FROM flipkart_products;
```

### 20. Create a VIEW to display high-rated products

```sql
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
```

Display the view:

```sql
SELECT *
FROM High_Rated_Products;
```

### 21. Find categories with average prices above the overall average using a Derived Table

```sql
SELECT
    category,
    Average_Price
FROM (
    SELECT
        category,
        AVG(price) AS Average_Price
    FROM flipkart_products
    GROUP BY category
) AS Category_Prices
WHERE Average_Price > (
    SELECT AVG(price)
    FROM flipkart_products
);
```

### 22. Find the top 5 brands based on total units sold using a CTE

```sql
WITH Brand_Sales AS (
    SELECT
        brand,
        SUM(units_sold) AS Total_Units_Sold
    FROM flipkart_products
    GROUP BY brand
)
SELECT *
FROM Brand_Sales
ORDER BY Total_Units_Sold DESC
LIMIT 5;
```

### 23. Identify products with discounts above the average discount using a CTE

```sql
WITH Average_Discount AS (
    SELECT AVG(discount_percent) AS Avg_Discount
    FROM flipkart_products
)
SELECT
    product_name,
    category,
    discount_percent,
    final_price
FROM flipkart_products
WHERE discount_percent > (
    SELECT Avg_Discount
    FROM Average_Discount
)
ORDER BY discount_percent DESC;
```

## 💡 Key Business Insights

The analysis is designed to uncover insights across six important business areas:

| Business Area | Analysis |
|---|---|
| Product Category Performance | Identify categories with the highest number of products and units sold |
| Pricing Analysis | Compare original prices and final prices across categories |
| Discount Analysis | Evaluate discount strategies and discount distribution |
| Product Performance | Identify top-selling and highly rated products |
| Seller Performance | Compare seller ratings and total units sold |
| Inventory & Delivery | Examine stock availability, delivery duration, and return policies |

*Actual numerical findings should be added after executing the queries against the imported dataset.*


## 📈 Future Improvements

- Build an interactive E-Commerce Analytics Dashboard using Power BI.
- Perform product segmentation based on price, ratings, and sales.
- Analyze discount effectiveness across product categories.
- Identify high-performing brands and sellers.
- Develop product pricing and sales performance reports.
- Integrate Python for advanced exploratory data analysis and machine learning.

## 👨‍💻 About the Author

**Mundru Veda Vedya Ram**  
**B.Tech Graduate | Aspiring Data Analyst**

I am passionate about Data Analytics, SQL, Python, and Business Intelligence. I enjoy working with real-world datasets, performing data analysis, creating interactive dashboards, and generating meaningful insights to support data-driven decision-making.

### Connect With Me

- **LinkedIn:** https://www.linkedin.com/in/mvvram/
- **GitHub:** https://github.com/vedavedyaram

---

## 🌟 Support & Feedback

If you find this project useful:

- ⭐ Star this repository.
- 🍴 Fork the repository.
- 💬 Share your feedback and suggestions.
- 📢 Share it with aspiring Data Analysts.

---

**Turning Data into Insights. Building Skills Through Real-World Projects.**

---

**Created by Mundru Veda Vedya Ram | Aspiring Data Analyst | SQL | Python | Power BI**
