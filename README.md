# Online Retail & E Commerce 

## Table of content
[Project Overview](#project-overview)

[Data Cleaning](#data-cleaning)

[EDA](#eda)

[Analytical Questions](#analytical-questions)

[Tools](#tools)

## Project Overview
This dataset contains transactional and customer data from an e-commerce business. 
It provides insights into customer behavior, product sales, and revenue trends. The dataset can be used for various business analytics, including customer segmentation, sales forecasting, and market basket analysis.

![Online](https://github.com/user-attachments/assets/23deea70-065a-48e6-aa46-5987ee56b486)

![Viz go](https://github.com/user-attachments/assets/ea7f8d6c-3526-452f-a50e-3e4bab257a1f)

![viz 3](https://github.com/user-attachments/assets/c4eee972-a515-415e-be03-cad2e32cfb36)



## Data Cleaning
1. Data cleaning and inspection
2. Handling duplicate and missing values inspection
3. Data cleaning and formatting

### EDA 
 1. Customer Segmentation – Identifying customer groups based on demographics and purchasing behavior.
 2. Sales Performance Analysis – Understanding revenue trends and best-selling products.
 3. Market Basket Analysis – Discovering frequently bought-together products.
 4. Price Optimization – Evaluating the impact of pricing on product demand.
 5. Geographic Sales Insights – Identifying top-performing regions.
 6. Time Series Forecasting – Analyzing monthly and seasonal trends in sales.

### Analytical Questions
Business managers can use this dataset to answer critical questions like:
 1. What are the top-selling products in the last 6 months?
 2. Which product categories are frequently bought together?
 3. How do sales trends vary by month?
 4. Which cities generate the most sales?
 5. How does pricing affect product demand?

### Tools 
- Microsoft Excel  for inspection. 
- PostgreSQL for cleaing and analysis.
- Power BI for visualization i.e trends, bar chart to compare two or more product.
- Tableau aslo for visual


```
SELECT 
    product_id, 
    SUM(quantity) AS total_units_sold
FROM order_details
GROUP BY product_id
ORDER BY total_units_sold DESC
LIMIT 10;
```

### Reference 
- Stack overflow
- PostgreSQL documentation



  


