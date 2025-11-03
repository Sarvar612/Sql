-- Task 1. Customers & Orders
CREATE TABLE customers1 (
     id SERIAL PRIMARY KEY,
     name TEXT NOT NULL,
     email TEXT UNIQUE NOT NULL
);

CREATE TABLE orders1 (
    id SERIAL PRIMARY KEY,
    amount NUMERIC(10,2) NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    customer_id INT REFERENCES customers1(id)
);

-- Task 2. Departments & Employees
CREATE TABLE departments2 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE employees2 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT,
    department_id INT REFERENCES departments2(id) ON DELETE SET NULL
);

-- Task 3. Categories & Products
CREATE TABLE categories3 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE products3 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10,2) CHECK (price >= 0),
    category_id INT REFERENCES categories3(id)
);

-- Task 4. Customers, Products, Orders & Order_Items
CREATE TABLE customers4 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE products4 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE orders4 (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers4(id),
    order_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE order_items4 (
    order_id INT REFERENCES orders4(id),
    product_id INT REFERENCES products4(id),
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id)
);

-- Task 5. Students, Groups, Faculties, Courses, Teachers, Student_Courses
CREATE TABLE faculties5 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE groups5 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    faculty_id INT REFERENCES faculties5(id)
);

CREATE TABLE students5 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    group_id INT REFERENCES groups5(id)
);

CREATE TABLE teachers5 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE courses5 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    teacher_id INT REFERENCES teachers5(id)
);

CREATE TABLE student_courses5 (
    student_id INT REFERENCES students5(id),
    course_id INT REFERENCES courses5(id),
    grade INT CHECK (grade BETWEEN 1 AND 5),
    PRIMARY KEY (student_id, course_id)
);

-- Task 6. Users, Posts, Comments, Likes
CREATE TABLE users6 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts6 (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users6(id) ON DELETE CASCADE,
    text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments6 (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts6(id) ON DELETE CASCADE,
    user_id INT REFERENCES users6(id) ON DELETE CASCADE,
    text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE likes6 (
    user_id INT REFERENCES users6(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts6(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, post_id)
);
SELECT * FROM likes6
