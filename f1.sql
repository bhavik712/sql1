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


