CREATE DATABASE IF NOT EXISTS PRODUCT;
USE PRODUCT;
CREATE TABLE makeup_products (
    product_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    product_name VARCHAR(100),
    category VARCHAR(50),
    shade VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    expiry_date DATE,
    country VARCHAR(30)
);
INSERT INTO makeup_products VALUES
(1,'Maybelline','Fit Me Foundation','Foundation','128 Warm Nude',850,120,'2026-05-12','USA'),
(2,'Maybelline','Lash Sensational Mascara','Mascara','Black',650,200,'2026-02-20','USA'),
(3,'Lakme','9 to 5 Primer','Primer','Transparent',900,90,'2026-01-15','India'),
(4,'Lakme','Cushion Matte Lipstick','Lipstick','Red Wine',750,150,'2025-11-30','India'),
(5,'MAC','Studio Fix Powder Plus','Compact Powder','NC42',3200,60,'2027-03-18','USA'),
(6,'MAC','Retro Matte Lipstick','Lipstick','Ruby Woo',2300,110,'2026-09-25','USA'),
(7,'NYX','Soft Matte Lip Cream','Lipstick','Amsterdam',1200,140,'2026-06-10','USA'),
(8,'NYX','HD Studio Finishing Powder','Loose Powder','Translucent',1800,75,'2027-01-05','USA'),
(9,'Huda Beauty','Easy Bake Loose Powder','Loose Powder','Banana Bread',4200,50,'2027-08-14','UAE'),
(10,'Huda Beauty','Power Bullet Lipstick','Lipstick','Interview',3500,80,'2026-12-01','UAE');
SELECT * FROM makeup_products;
SELECT product_name, company_name, price from makeup_products;
SELECT product_name from makeup_products where category="Lipstick";
SELECT product_name,price from makeup_products where price>2000;
SELECT DISTINCT category FROM makeup_products;
SELECT product_name,price from makeup_products order by price ASC;
SELECT product_name from makeup_products where expiry_date<'2026-01-01';
select company_name , count(product_name) from makeup_products group by company_name;
select max(price) from makeup_products;
select company_name, sum(stock) as stock_value from makeup_products group by company_name;
select company_name,count(product_name)as product_count from makeup_products group by company_name having count(product_name)>2;
select category, sum(stock) as stock_value  from makeup_products where category="Lipstick";
select category, avg(price) as average_price from makeup_products group by category;
SELECT product_name,price
FROM makeup_products
WHERE product_name LIKE '%Matte%';
select company_name, sum(stock) as stock_value from makeup_products group by company_name order by stock_value desc limit 1;
select category, avg(price) as average_price from makeup_products group by category order by average_price desc limit 1;
select product_name, price from makeup_products order by price desc limit 3;
SELECT product_name FROM makeup_products WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH);
SELECT company_name,sum(price * stock) AS total_inventory_value FROM makeup_products group by company_name;
SELECT price, avg(price) as average_price from makeup_products group by company_name  having price>average_price;

SELECT product_name,company_name,price
FROM makeup_products mp
WHERE price >
(
  SELECT AVG(price)
  FROM makeup_products
  WHERE company_name = mp.company_name
);
SELECT company_name,price ,product_name,
       RANK() OVER (PARTITION BY company_name ORDER BY price DESC) AS price_rank
FROM makeup_products;
Alter table makeup_products
change column country country_name char(20);
select * from makeup_products;



