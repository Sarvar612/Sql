---task1
select e.id,e.name,e.salary
from employees as e
where e.salary > (select avg(salary) from employees);

---task2
select p.id,p.name,p.price
from products as p
where p.price > (select avg(price) from products);

---task3
select d.id,d.name
from departments as d
where exists (
    select 1
    from employees as e
    where e.department_id=d.id and e.salary > 10000
);

---task4
select p.id,p.name
from products as p
         join order_items as oi on p.id=oi.product_id
group by p.id,p.name
order by count(*) desc
limit 1;

---task5
select c.id,c.name,count(o.id) as order_count
from customers as c
         left join orders as o on c.id=o.customer_id
group by c.id,c.name;

---task6
select d.id,d.name,avg(e.salary) as avg_salary
from departments as d
         join employees as e on d.id=e.department_id
group by d.id,d.name
order by avg_salary desc
limit 3;

---task7
select c.id,c.name
from customers as c
where not exists (
    select 1
    from orders as o
    where o.customer_id=c.id
);

---task8
select e.id,e.name,e.salary
from employees as e
where e.salary > (
    select max(s.salary)
    from employees as s
    where s.position ilike '%manager%'
);

---task9
select d.id,d.name
from departments as d
where not exists (
    select 1
    from employees as e
    where e.department_id=d.id and e.salary <= 5000
);

---task10
select d.id,d.name
from departments as d
where d.id not in (
    select e.department_id
    from employees as e
    where e.salary < 5000
);
