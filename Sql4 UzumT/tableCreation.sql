CREATE TABLE departments (
                             id SERIAL PRIMARY KEY,
                             name VARCHAR(50) NOT NULL,
                             location VARCHAR(50)
);

CREATE TABLE employees (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(50) NOT NULL,
                           position VARCHAR(50),
                           salary NUMERIC(10,2),
                           department_id INTEGER REFERENCES departments(id) ON DELETE SET NULL,
                           manager_id INTEGER REFERENCES employees(id) ON DELETE SET NULL
);

CREATE TABLE customers (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           city VARCHAR(50)
);

CREATE TABLE orders (
                        id SERIAL PRIMARY KEY,
                        order_date DATE NOT NULL,
                        amount NUMERIC(10,2),
                        employee_id INTEGER REFERENCES employees(id) ON DELETE SET NULL,
                        customer_id INTEGER REFERENCES customers(id) ON DELETE SET NULL
);

CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          price NUMERIC(10,2)
);

CREATE TABLE order_items (
                             id SERIAL PRIMARY KEY,
                             order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
                             product_id INTEGER REFERENCES products(id) ON DELETE SET NULL,
                             quantity INTEGER NOT NULL
);


INSERT INTO departments(name,location) VALUES
                                           ('Sales','New York'),
                                           ('HR','Chicago'),
                                           ('IT','San Francisco'),
                                           ('Support','Boston'),
                                           ('Logistics','Miami');

INSERT INTO employees(name,position,salary,department_id,manager_id) VALUES
                                                                         ('Alice Johnson','Sales Manager',85000,1,NULL),
                                                                         ('Bob Smith','Sales Representative',50000,1,1),
                                                                         ('Carol White','HR Specialist',60000,2,NULL),
                                                                         ('David Brown','IT Technician',65000,3,NULL),
                                                                         ('Eve Black','IT Manager',90000,3,NULL),
                                                                         ('Frank Green','Support Agent',40000,4,1),
                                                                         ('Grace Lee','Warehouse Worker',35000,5,NULL),
                                                                         ('Henry Adams','Freelancer',NULL,NULL,NULL);

INSERT INTO customers(name,city) VALUES
                                     ('John Doe','Los Angeles'),
                                     ('Emily Clark','Houston'),
                                     ('Michael Scott','Scranton'),
                                     ('Sarah Miller','Denver'),
                                     ('Noah Wilson','Seattle');

INSERT INTO orders(order_date,amount,employee_id,customer_id) VALUES
                                                                  ('2024-01-05',250.00,2,1),
                                                                  ('2024-01-10',400.00,3,2),
                                                                  ('2024-01-15',150.00,4,1),
                                                                  ('2024-01-20',550.00,5,3),
                                                                  ('2024-01-22',NULL,6,4),
                                                                  ('2024-01-25',300.00,NULL,2),
                                                                  ('2024-01-30',NULL,NULL,5);

INSERT INTO products(name,price) VALUES
                                     ('Laptop',1200.00),
                                     ('Keyboard',50.00),
                                     ('Monitor',300.00),
                                     ('Mouse',25.00),
                                     ('USB Hub',15.00),
                                     ('Printer',200.00);

INSERT INTO order_items(order_id,product_id,quantity) VALUES
                                                          (1,1,1),
                                                          (1,2,2),
                                                          (2,3,1),
                                                          (2,4,3),
                                                          (3,2,1),
                                                          (4,1,1),
                                                          (4,6,1),
                                                          (5,3,2),
                                                          (6,5,4);



