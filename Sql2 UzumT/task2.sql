CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    group_id INT NOT NULL
);



---task1
INSERT INTO students (first_name, last_name, birth_date, email, group_id) VALUES
    ('Alex', 'Smith', '2000-01-01', 'alex1@gmail.com', 1),
    ('Alex', 'Smith', '2000-01-02', 'alex2@gmail.com', 2),
    ('John', 'Doe',   '2001-02-01', 'john1@gmail.com', 1),
    ('Jane', 'Watson','2002-03-01', 'jane1@gmail.com', 2),
    ('Jane', 'Watson','2002-03-05', 'jane2@gmail.com', 3),
    ('Emma', 'Stone', '2003-04-01', 'emma1@gmail.com', 1);

---task2
select s.first_name,s.last_name from students as s group by s.first_name,s.last_name having count(*)>1;

--task3
delete from students where student_id not in (select min(student_id) from students as s group by s.first_name,s.last_name );
