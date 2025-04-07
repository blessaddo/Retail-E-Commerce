select 
  age, 
  gender, 
  city, 
  category_name, 
  product_name, 
  sum(quantity) as total_quantity, 
  avg(price) as average_price, 
  case 
    when age < 25 then 'Young Adults'
    when age between 25 and 44 then 'Adults'
    when age between 45 and 64 then 'Middle-Aged'
    else 'Seniors'
  end as age_segment,
  case 
    when gender = 'M' then 'Male'
    when gender = 'F' then 'Female'
    else 'Other'
  end as gender_segment,
  case 
    when city like '%West Sarah%' then 'West Sarah'
    when city like '%East Tonyaberg%' then 'East Tonyaberg%'
    ELSE 'Other'
  end as city_segment

from 
  Retail_Commerce

where
	gender is not null

group by 
  age, 
  gender, 
  city, 
  category_name, 
  product_name;

select * from Retail_Commerce;

--sales data by product category and subcategory to identify top-selling products 
--and areas for improvement?

with sub_category as
		(select 
			product_name,
			category_name,
			cast(sum(price) as int) as total_price,
			review_score
			--max(price) as max_price
		from 
			Retail_Commerce
		where review_score is not null
		group by product_name, category_name, review_score
		)
select category_name, product_name,review_score, total_price
from sub_category
order by total_price desc;



---analyze return rates by product category and subcategory to identify areas for improvement and potential cost savings?
select 
	category_name,
	product_name,
	review_score,
	count(*) as total_count,
	(
case
	when review_score <= 1 then 'low value product'
	when review_score between 2 and 3 then 'Middle value product'
	else 'high value product'
end 
	)  as product_rating
from Retail_Commerce
where review_score is not null
group by category_name, product_name, review_score
having count(*) > 1
order by product_rating desc;


--Analyzing review score by percent
select 
	review_score,
	count(*) as total_count,
	(count(*) * 100)/ (select count(*) from Retail_Commerce where review_score > 4) as percent
from Retail_Commerce
where review_score <> 3
group by review_score
order by total_count desc;


Select * from Retail_Commerce;


--What is the distribution fo customers by age and gender
select
	case
		when age between 18 and  25 then '18-24'
		when age between 26 and 35 then '26-35'
		when age between 36 and 45 then '36-45'
		when age between 46 and 55 then '46-55'
		when age between 56 and 66 then '56-66'
		else '67+'
	end as age_group, gender,
	count(*) as customer_count
from Retail_Commerce
where gender is not null
group by age_group, gender
order by age_group, gender;


--Which product are frequently bought togther
select 
	p1.product_name as product_name_A,
	p2.product_name as product_name_B,
	p1.product_id as product_A,
	p2.product_id as product_B,
	count(*) as frequency
from 
	Retail_Commerce as p1
join 
	Retail_Commerce as p2
on 
  p1.product_id = p2.product_id
group by 
	product_A, product_B, product_name_A, product_name_B
order by frequency desc
limit 10;


select * from Retail_Commerce;
---Monthly sales trends over the past year
select 
	category_name,
	DATE_TRUNC('month', order_date) as month, --extract the month from the order date while setting the day to 1st of the month
	cast(sum(price) as int) as total_price
from 
	Retail_Commerce
where 
	order_date >= NOW() - INTERVAL '1 year'
group by month, category_name
order by month
limit 15;


--How does price impact demand for different product
select	
	product_id,
	cast(avg(price) as int) as average_price,
	count(customer_id) as total_sales
from
	Retail_Commerce
group by product_id
order by average_price desc
limit 10;


--which city generate the most sales
select
	city,
	cast(sum(price) as int) as total_price,
	count(customer_id) as total_customers
from
	Retail_Commerce
group by city
order by total_customers, total_price desc
limit 10;


--Top selling prodcut over the past 6 months
select
	product_id,
	category_name,
	product_name,
	sum(quantity) as total_units_sold
from 
	Retail_Commerce
where 
	order_date >= NOW() - INTERVAL '6 month'
group by 
	product_id, category_name, product_name
order by 
	total_units_sold desc
	limit 10;