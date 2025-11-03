---task13
select p.id,p.name,sum(oi.quantity * p.price) as revenue
from products as p
         join order_items as oi on p.id=oi.product_id
group by p.id,p.name
order by revenue desc
    limit 3;

---task14
select c.id,c.name
from customers as c
where exists (
    select 1
    from orders as o
    where o.customer_id=c.id
    group by o.customer_id
    having count(*) > 1
);

---task15
select d.id,d.name,
       count(e.id) as total_employees,
       avg(e.salary) as avg_salary,
       sum(o.amount) as total_order_amount
from departments as d
         left join employees as e on d.id=e.department_id
         left join orders as o on e.id=o.employee_id
group by d.id,d.name;

---task16
select c.id,c.name
from customers as c
         join orders as o on c.id=o.customer_id
group by c.id,c.name
having avg(o.amount) > (select avg(amount) from orders);

---task17
select e.id,
       e.name,
       coalesce(e.position,'No Position') as position,
       coalesce(d.name,'No Department') as department_name,
       coalesce(m.name,'No Manager') as manager_name
from employees as e
    left join departments as d on e.department_id=d.id
    left join employees as m on e.manager_id=m.id;

---task18
select id,order_date,amount
from orders
where order_date = to_date('2024-01-05','YYYY-MM-DD');

---task19
select id,order_date,amount
from orders
where order_date < current_date - interval '1 day' * :N;


---task20
select e.id,
       e.name,
       coalesce(e.salary,0) as salary,
       coalesce(e.salary,0) * 0.10 as bonus,
       coalesce(e.salary,0) * 1.10 as total_income
from employees as e;
