-- no.1
select c.first_name, c.last_name, a.city, a.province
from customers c
inner join address a
on c.address_id=a.address_id;

-- no. 2
select c.first_name, c.last_name, a.city, a.province
from customers c
inner join address a
on c.address_id=a.address_id
where province="Gandaki";

-- no.3
select c.first_name, count(o.order_id)
from customers c
join orders o
on o.customer_id=c.customer_id
group by c.first_name;

-- no. 4
select p.product_name, sum(o.quantity)
from products p
inner join order_detail o
on o.product_id=p.product_id
where p.product_name="Dell";

-- no.5
select c.first_name, c.last_name, o.order_id
from customers c
left join orders o
on c.customer_id=o.customer_id
where o.order_id is null;

-- no.6
select p.product_name, sum(od.quantity)
from products p
left join order_detail od
on p.product_id=od.product_id
group by p.product_name
having sum(od.quantity)>100;

-- no.7
select p.product_name, s.company_name
from products p
left join suppliers s
on p.supplier_id=s.supplier_id;

-- no.8
select s.company_name, p.product_name
from suppliers s
left join products p
on p.supplier_id=s.supplier_id;

-- no.9
select s.company_name, p.product_name
from suppliers s
left join products p
on p.supplier_id=s.supplier_id
union
select s.company_name, p.product_name
from suppliers s
right join products p
on p.supplier_id=s.supplier_id;

-- no.10
select c.first_name,o.order_date, od.quantity, p.product_name
from customers c
inner join orders o
on c.customer_id=o.customer_id
inner join order_detail od
on o.order_id=od.order_id
inner join products p
on od.product_id=p.product_id;

-- view wala thing
CREATE OR REPLACE VIEW customer_order_detail AS
	select c.first_name,o.order_date, od.quantity, p.product_name
	from customers c
	inner join orders o
	on c.customer_id=o.customer_id
	inner join order_detail od
	on o.order_id=od.order_id
	inner join products p
	on od.product_id=p.product_id
    WHERE od.quantity>40;





