--to get customer who lives in USA

select * 
from Customers
where country="USA";

-- by using & op
select * 
from Customers 
where (country="USA") and (age<30);

-- Like op
select * 
from Customers 
where first_name like 'J%';

-- in op 
select *
from customers 
where age in (25,27);

--between op 
select * 
from Customers 
where age between 25 AND 30;

--AS op
select first_name as Name, last_name as Surname
from Customers
where country="UK";

--Aggregate function 
select sum(amount) 
from Orders;

select avg(age)
from Customers;

select count(customer_id) AS Total_Customers
from Orders;

select count(country) AS Countries 
from Customers;

select count(customer_id) AS Total_Customers
from Orders
where item='Keyboard';



--nested query 
select first_name AS Most_Experaince_Person
from Customers
where age=(select max(age) from Customers);

--Simple & Multiple join (more may be covered in next Advanced Course)

--Showing the details of orders of Customers 
select Orders.customer_id,Customers.first_name,Customers.last_name,Orders.item,Orders.amount 
from Customers, Orders
where Customers.customer_id = Orders.customer_id;

--Details of the customers who have ordered Keyboard
select Orders.customer_id,Customers.first_name,Customers.last_name,Orders.item,Orders.amount 
from Customers,Orders
where Customers.customer_id = Orders.customer_id AND item = "Keyboard";

--Showing Deatails of customers' orders with Shipping Status 
select Shippings.customer, Customers.first_name, Customers.last_name, Customers.country , Orders.item, Orders.amount, Shippings.status
from Customers, Orders, Shippings 
where Shippings.customer = Orders.customer_id AND Shippings.customer = Customers.customer_id;

--group by
select * 
from Customers 
group by Country;

--nested query getting the details of the orders whoose customers in USA
select * 
from Shippings Join Orders
ON Shippings.customer = Orders.customer_id
where customer in (select customer_id from Customers where country = "USA");

--order by 
Select * 
from Customers
ORDER BY age;

--details of orders and Customer in descending order
select *
from Customers Join Orders 
ON Customers.customer_id = Orders.customer_id
ORDER BY amount DESC;

--showing top 3 order - Customer details 
select *
from Customers Join Orders 
ON Customers.customer_id = Orders.customer_id
ORDER BY amount DESC
Limit 1,3;

--Combaining age & country in Order by 
select *
from Customers 
order by country,age;

-- Showing panding records in descending orders of country and amount 
select * 
from Customers JOIN Orders
ON Customers.customer_id = Orders.customer_id
where Customers.customer_id in (select customer from Shippings where status="Pending")
order by Customers.country DESC ,amount DESC;

--Showing customers wise no of orders 
select Customers.first_name, Customers.last_name, count(Orders.customer_id) AS No_of_orders
from Customers LEFT JOIN Orders 
ON Customers.customer_id = Orders.customer_id
group by Orders.customer_id;

--Showing country wise no of orders
select Customers.country,count(Orders.Customer_id)
from Customers LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
group by Customers.country;

--showing the status of orders of Keyboard
Select Orders.customer_id, Orders.order_id, Orders.item, Orders.amount,Shippings.shipping_id,Shippings.status
from Orders Join Shippings
ON Orders.customer_id = Shippings.customer
where Orders.item = "Keyboard" ;

-- Joining three tables 
Select Orders.customer_id, Customers.first_name, Customers.last_name, Orders.order_id, Orders.item,Orders.amount,Shippings.shipping_id,Shippings.status
from Orders Join Shippings 
ON Orders.customer_id = Shippings.customer 
Join Customers
ON Orders.customer_id = Customers.customer_id ;

--showing keyboard -> order customer & Shipping status 
Select Orders.customer_id, Customers.first_name, Customers.last_name, Orders.order_id, Orders.item,Orders.amount,Shippings.shipping_id,Shippings.status
from Orders Join Shippings 
ON Orders.customer_id = Shippings.customer 
Join Customers
ON Orders.customer_id = Customers.customer_id 
where Orders.item="Keyboard";

-- Showing pending order full details 
Select Orders.customer_id, Customers.first_name, Customers.last_name, Orders.order_id, Orders.item,Orders.amount,Shippings.shipping_id,Shippings.status
from Orders Join Shippings 
ON Orders.customer_id = Shippings.customer 
Join Customers
ON Orders.customer_id = Customers.customer_id 
where Shippings.status = "Pending";

--Showing country wise pending orders 
Select Customers.country,count(Shippings.status) AS No_of_pending_orders
from Orders Join Shippings 
ON Orders.customer_id = Shippings.customer 
Join Customers
ON Orders.customer_id = Customers.customer_id
where Shippings.status="Pending"
group by Customers.country;




