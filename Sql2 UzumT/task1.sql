CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    region VARCHAR(20),
    amount BIGINT,
    sale_date DATE
);

INSERT INTO sales (region, amount, sale_date) VALUES
    ('North', 1000, '2024-01-01'),
    ('South', 700, '2024-01-02'),
    ('North', 500, '2024-01-03'),
    ('West', NULL, '2024-01-04'),
    ('South', 900, '2024-01-05'),
    ('North', 1500, '2024-01-06');


---task1
select s.region,sum(s.amount) from sales as s group by s.region;

---task2
select s.region,avg(s.amount) from sales as s  group by s.region having count(*)>1;

---task3
select s.region,sum(s.amount) as a from sales as s group by s.region order by a asc limit 1;

---task4
select count(*) as total_sale, count(amount) as non_null_sale from sales;

---task5
select s.id,s.region,s.amount from sales as s where s.amount > (select avg(a.amount) from sales as a )  ;

