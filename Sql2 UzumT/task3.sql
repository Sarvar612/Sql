CREATE TABLE students1 (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    age INT,
    group_id INT
);

CREATE TABLE groups1 (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(50)
);

CREATE TABLE subjects1 (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50)
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES students1(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects1(subject_id)
);


----task1

INSERT INTO groups1 (group_id, group_name) VALUES
    (1, 'Mathematics'),
    (2, 'Computer Science'),
    (3, 'Physics'),
    (4, 'Linguistics');


INSERT INTO students1 (student_id, full_name, age, group_id) VALUES
    (1, 'Sarvar Tohirov', 20, 1),
    (2, 'Dilshod Karimov', 21, 1),
    (3, 'Aziza Rustamova', 19, 2),
    (4, 'Shahnoza Yusupova', 20, 2),
    (5, 'Javohir Abdullaev', 22, 3),
    (6, 'Umida Usmonova', 20, 3),
    (7, 'Sherzod Axmedov', 21, 4),
    (8, 'Malika Ismoilova', 19, 4);


INSERT INTO subjects1 (subject_id, subject_name) VALUES
    (1, 'Higher Mathematics'),
    (2, 'Programming Basics'),
    (3, 'General Physics'),
    (4, 'English Language');


INSERT INTO grades (grade_id, student_id, subject_id, grade) VALUES
    (1, 1, 1, 85),
    (2, 1, 2, 90),
    (3, 2, 1, 70),
    (4, 2, 3, 75),
    (5, 3, 2, 95),
    (6, 3, 4, 80),
    (7, 4, 2, 88),
    (8, 5, 3, 92),
    (9, 6, 3, 77),
    (10, 7, 4, 89),
    (11, 8, 4, 93);


---task2
select count(*) as number_of_students from students1 ;

---task3
select avg(age) as avg_age from students1;

---task4
select min(age) as min_age from students1;
select max(age) as min_age from students1;

--task5
select count(grade) from grades;

---task6
select g.group_name, count(s.group_id)from groups1 as g
                                    join students1 s on g.group_id = s.group_id
                                    group by g.group_name;

---task7
select g.group_name,avg(s.age) as avg_age from groups1 as g
         join students1 as s on g.group_id = s.group_id
group by  g.group_name;


---task8
select sub.subject_name, avg(g.grade) as avg_grade from subjects1 as sub
         join grades as g on sub.subject_id = g.subject_id
group by sub.subject_name;


---task9
select s.full_name, count(distinct g.subject_id) as subjects_count from students1 s join grades g on s.student_id = g.student_id
group by s.student_id, s.full_name having count(distinct g.subject_id) = (select count(*) from subjects1);

---task10
select g.group_name, count(s.student_id) as student_count from groups1 g
         join students1 s on g.group_id = s.group_id
group by g.group_name having count(s.student_id) > 1;

---tas11
select sub.subject_name, avg(g.grade) as avg_grade from subjects1 sub
         join grades g on sub.subject_id = g.subject_id
group by sub.subject_name having avg(g.grade) > 80;

---task12
select s.full_name, avg(g.grade) as avg_grade from students1 s
         join grades g on s.student_id = g.student_id
group by s.student_id, s.full_name having avg(g.grade) > 85;

