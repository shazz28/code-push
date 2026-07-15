use sql_store;

show tables;

--select clause

select 
    last_name, 
    first_name,
    points,
(points + 10)*100 as 'discount factor' /*this creates a new calculated column for discount factor*/
from customers;

select state from customers;

select * from sql_store.customers;

--distinct returns the unique values only 
select DISTINCT state from customers; 

--activity 

select * from products;

select 
    name, 
    unit_price,
    unit_price * 1.1 as new_price
from products;


--where clause 

select * from customers where points > 3000;

select * from customers where state = 'va';

select * from customers where state != 'va';
select * from customers where state <> 'va';/* indicates not equal to */

select * from customers where birth_date > '1990-01-01';

--exercise 

select * from orders  where order_date >='2019-01-01';

-- the and or and not operators

select * from customers where birth_date > '1990-01-01' and points > 1000 ;
select * from customers where birth_date > '1990-01-01' or points > 1000 ;
select * from customers where birth_date > '1990-01-01' or points > 1000 and state = 'va';
/* and operator > or */
--not operator
select * from customers where not (birth_date > '1990-01-01' or points > 1000) ;
select * from customers where birth_date <= '1990-01-01' or points <= 1000 ;

--exercise
select * from order_items where order_id = 6 and unit_price * quantity > 30;
/* we can perform mathematical function in where clause also*/

-- in & not in operator
select * from customers where state = 'va' or state = 'ga' or state = 'fl';

select * from customers where state in ('va','fl','ga');
select * from customers where state not in ('va','fl','ga');

-- activity 
select * from products where quantity_in_stock in (49,38,72);
select * from products where quantity_in_stock not in (49,38,72);

-- between operator 
select * from customers where points between 1000 and 3000;
-- exercise 
select * from customers where birth_date between '1990-01-01' and '2000-01-01'

--like operator used to match specific string pattern
/*
the b% indicates that first letter should be b with following n no of characters
the %b% indicates that b can occur anywhere in between the characters
the %y indicates that the last character of the word should end with char y with n no.of occuerences before
the ___y indicates that the last character should be y with previous 3 char 
the b_____ indicates that the first letter should start with b and should have 5 char after 
the b_____y indicates that it should have b at the first followed by 5 character and y at the end
*/
select * from customers where last_name like 'b%';
select * from customers where last_name like '%b%';
select * from customers where last_name like '%y';
select * from customers where last_name like 'b_____';
select * from customers where last_name like '_____y';
select * from customers where last_name like 'b____y';

--activity 
select * from customers where address like '%trail%' or address like '%avenue%';
select * from customers where phone like '%9';

--regexp (regular expression)

select * from customers where last_name regexp '^mac';
-- ^ represent beginnig of a string

select * from customers where last_name regexp 'field$';
-- $ represents end of a string 

select * from customers where last_name regexp 'field|mac|rose';
-- | represent logical or 

select * from customers where last_name regexp 'field$|^mac|rose';
-- this represents that last name should end with field or start with mac or have rose in it 

select * from customers where last_name regexp '[asim]e';
--- [m]e used to match any single character listed in ther brackets

select * from customers where last_name regexp '[a-h]e';
-- [-] used to match range of characters listed 

-- exercise 
select * from customers where first_name regexp 'elka|ambur';
select * from customers where last_name regexp 'ey$|on$';
select * from customers where last_name regexp '^my|se';
select * from customers where last_name regexp 'b[ru]';

--null operataor
select * from customers where phone is null;

--exercise
select * from orders where shipped_date is NULL;

--order by clause

select first_name as name from customers ORDER BY first_name ;
--displays first name in ascending order

select first_name as name from customers ORDER BY first_name DESC ;
-- displays first name in descending order

select first_name as name, state from customers ORDER BY  state , first_name ;
-- sorts the table with state and first name

select first_name as name, state from customers ORDER BY  state desc, first_name ;
-- sorts the table with state in descending order and first name in ascening 

select first_name as name, state  from customers ORDER BY  state desc, first_name desc;
-- sorts both state and first name in descending order

--limit clause
--limit clause should always come at the end


select * from customers limit 3;

select * from customers limit 6,3;
-- the limit clause defines skip the first 6 records and show 3 records

select first_name as name, points, phone from customers order by points desc limit 3;

-- inner joins 

select ROW_NUMBER() over(ORDER BY order_id) as 's.no', order_id as 'order no', o.customer_id, first_name, last_name 
from orders o
join customers c 
    on o.customer_id = c.customer_id 
    order by order_id 
 
/* 
the key word inner for inner join is optional 

the above code is used to join 2 table using join
the ROW_NUMBER() over(ORDER BY order_id) as 's.no' creates
new column for row no to show how much rpws are returned 
the order id customer id, first name and the last name is 
selected from table orders and given an shortcut 'o' hence 
o.customer_id and is joined with the table customers followed 
by the shortcut 'c' and the on key word says on what basis the 
table should be joined or else it will duplicate the values 
ex 10 orders and 10 customers but will return 100 rows 
here it is order id of order table = customer id of customer table
and is sorted by order id in ascending order 
*/
select customer_id from customers;
select customer_id, order_id from orders;
select * from order_items;
select product_id, name from order_items;

select p.product_id,order_id, name,quantity, p.unit_price, (p.unit_price *  quantity) 
as price from order_items o
join products p
    on o.order_id = p.product_id
    order by price desc, product_id
    limit 5;

--joining across databases

select * from order_items oi
join sql_inventory.products p/*sql_inventory is the database here */
    ON oi.product_id = p.product_id;

-- self joins
use sql_hr;


select 
    e.employee_id,/*should prefix the columns to be displayed*/
    e.first_name,
    m.first_name as manager
        from employees e 
        join employees m /* should use different aliases */
            on e.reports_to = m.employee_id
;
/*--joining multiple tables for employee and offices*/ 
SELECT
    e.employee_id,/*should prefix the columns to be displayed*/
    e.first_name,
    o.city as office_location 
from employees e
join offices o
    on o.office_id = e.office_id;

desc employees
--inner join and outer join 

select 
    e.employee_id as "Emp Id",/*should prefix the columns to be displayed*/
    concat(e.first_name,'' ,e.last_name) as "Name",
    m.first_name as Manager,
    o.city as "Ofice Location"
from employees e 
join employees m /* should use different aliases */
            on e.reports_to = m.employee_id
join offices o
    on o.office_id = e.office_id
order by e.first_name, e.employee_id;

-- joining multiple tables 
use sql_store;

select 
    o.order_id,
    o.order_date,
    concat(c.first_name,' ',c.last_name) as name,
    /*joined two strings with a space*/
    os.name as status
from orders o
join customers c
    on o.customer_id = c.customer_id
    /* linked order table and customer table customer id*/
join order_statuses os
    on o.status = os.order_status_id
    /*linked order table status to order status table id*/
order by order_id;

-- activity 
use sql_invoicing;

select 
    p.payment_id,
    p.invoice_id,
    c.name,
    p.date,
    p.amount,
    pm.name
from payments p
join clients c 
    on p.client_id = c.client_id
join payment_methods pm
    on p.payment_method = pm.payment_method_id;

--compound join
use sql_store;
DESCRIBE order_items;

select 
    oi.order_id,
    oi.product_id,
    (quantity * unit_price) as price,
    oin.note
from order_items oi
join order_item_notes oin
    on oi.order_id = oin.order_id
    and oi.product_id = oin.product_id; 


/*  we add and operators for compund join to make sure that both the crieteria matches,
we also can add or operator but it is not recommended becuse it will delay the results and breaks the optimization 
because it checks the condition row by row and for huge database it will be hectic
example:
SELECT 
    u.name, 
    m.message_text
FROM users u
JOIN messages m 
    ON u.user_id = m.sender_id 
    OR u.user_id = m.receiver_id;

-- updated product id because of id mis-match no o/p was returened
update order_item_notes set product_id = 4 where note_id =1;
select * from order_item_notes;
*/

--implicit join syntax

select * 
from orders o, customers c 
where o.customer_id = c.customer_id;

--outer joins

--left join

select 
    c.customer_id,
    c.first_name, 
    o.order_id
from customers c
left join orders o
    on c.customer_id = o.customer_id
order by c.customer_id

/*
left outer join which is customers table,
this query displays the details of the customers 
irrespective of whether they have orders or not 
if they don't have any orders it will be displayed as
null*/

--right join

select 
    c.customer_id,
    c.first_name, 
    o.order_id
from orders o
right join customers c
    on c.customer_id = o.customer_id
order by c.customer_id
/*
right outer join which is customers table,
this query displays the details of the customers 
irrespective of whether they have orders or not 
if they don't have any orders it will be displayed as
null*/

--activity 

select 
    p.product_id,
    p.name,
    o.quantity
from products p
left join order_items o
    on p.product_id = o.product_id
order by p.product_id

-- outer join between multiple tables

select 
    c.customer_id,
    c.first_name, 
    o.order_id,
    sh.name
from customers c
left join orders o
    on c.customer_id = o.customer_id
left join shippers sh
    on o.shipper_id = sh.shipper_id
order by c.customer_id

/*we are using left outer join btwn multiple table so 
that it is easy to visualize the data from which table 
we are joining*/