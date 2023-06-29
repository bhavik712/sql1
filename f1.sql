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

