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

