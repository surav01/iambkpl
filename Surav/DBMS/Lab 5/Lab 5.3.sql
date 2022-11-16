-- no. 1
create or replace view vwCustomerAddress as
	select c.customer_id, concat(c.first_name," ",c.last_name) as full_name, concat_ws(", ",a.street,a.city,a.province) as address, c.phone
    from customers c
    inner join address a
    on c.address_id=a.address_id;
    
-- no.2
create or replace view vwCustomerOrderDetail as
	select ca.full_name, ca.phone, ca.address, o.order_date, p.product_name, p.unit_price,od.quantity, p.unit_price*od.quantity as total_price
    from vwCustomerAddress ca
    inner join orders o
    on o.customer_id=ca.customer_id
    inner join order_detail od
    on o.order_id=od.order_id
    inner join products p
    on p.product_id=od.product_id;
    
select * from vwCustomerOrderDetail;

-- no.3
select cod.full_name,sum(cod.total_price) as total_due_amount
from vwCustomerOrderDetail cod
group by cod.full_name;		
