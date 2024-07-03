-- Create table for products 
 create table Products(
 product_id int primary key  ,
 product_name varchar(255) not null,
category varchar(255),
 price int not null
);


--  insert into products
INSERT INTO Products (product_id, product_name, category, price)
VALUES
    (1, 'Product A', 'Category 1', 10),
    (2, 'Product B', 'Category 2', 20),
    (3, 'Product C', 'Category 1', 30);

	--  insert into orders 
INSERT INTO Orders (order_id, customer_name, product_id, quantity, order_date)
VALUES
    (1, 'Customer 1', 1, 2, '2024-06-01'),
    (2, 'Customer 2', 2, 3, '2024-06-02'),
    (3, 'Customer 1', 3, 1, '2024-06-03'),
    (4, 'Customer 3', 1, 4, '2024-06-04'),
    (5, 'Customer 2', 3, 2, '2024-06-05'),
    (6, 'Customer 3', 2, 1, '2024-06-06');


-- Update 
update orders
set customer_name='bob'
where product_id = 1;

--  delete 
Delete from orders
Where order_id = 5;

--  Q->Calculate the total quantity ordered for each product category in the orders table.

select Products.category , sum(Orders.quantity) as total_quantity_ordred
from Products
inner join Orders on  Products.product_id = Orders.product_id
group by Products.category;


--  without join 
SELECT 
    Products.category,
    SUM(Orders.quantity) AS total_quantity_ordered FROM 
    Products, Orders  
WHERE 
    Products.product_id = Orders.product_id  
GROUP BY 
    Products.category;



--  Q -> Find categories where the total number of products ordered is greater than 5. 

select Products.category , sum(Orders.quantity) as total_quantity_ordred
from Products
inner join Orders on  Products.product_id = Orders.product_id
group by Products.category
having sum(Orders.quantity)>5;
