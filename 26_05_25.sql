CREATE TABLE employees26 (
  id INTEGER NOT NULL PRIMARY KEY,
  managerId INTEGER, 
  name VARCHAR(30) NOT NULL,
  FOREIGN KEY (managerId) REFERENCES employees26(id)
);

INSERT INTO employees26(id, managerId, name) VALUES(1, NULL, 'John');
INSERT INTO employees26(id, managerId, name) VALUES(2, 1, 'Mike');

SELECT name
FROM employees26 e
WHERE e.id NOT IN (
    SELECT DISTINCT managerid
    FROM employees26
    WHERE managerid IS NOT NULL
);



select * from employees26 a
inner join employees26 b on a.id <> b.managerId


select * from employees26 a
inner join employees26 b on a.id = b.managerId

-- In this example.
-- John is Mike's manager. Mike does not manage anyone.
-- Mike is the only employee who does not manage anyone.

Example case: Wrong answer
No managers: Correct answer
Workers have managers: Wrong answer
Managers have managers: Wrong answer



-----------------------

------------region wise slaes by employees 
 
 
 CREATE TABLE regions(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE states(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  regionId INTEGER NOT NULL,
  FOREIGN KEY (regionId) REFERENCES regions(id)
); 

CREATE TABLE employeesi (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL, 
  stateId INTEGER NOT NULL,
  FOREIGN KEY (stateId) REFERENCES states(id)
);

CREATE TABLE sales (
  id INTEGER PRIMARY KEY,
  amount INTEGER NOT NULL,
  employeeId INTEGER NOT NULL,
  FOREIGN KEY (employeeId) REFERENCES employeesi(id)
);

INSERT INTO regions(id, name) VALUES(1, 'North');
INSERT INTO regions(id, name) VALUES(2, 'South');
INSERT INTO regions(id, name) VALUES(3, 'East');
INSERT INTO regions(id, name) VALUES(4, 'West');
INSERT INTO regions(id, name) VALUES(5, 'Midwest');

INSERT INTO states(id, name, regionId) VALUES(1, 'Minnesota', 1);
INSERT INTO states(id, name, regionId) VALUES(2, 'Texas', 2);
INSERT INTO states(id, name, regionId) VALUES(3, 'California', 3);
INSERT INTO states(id, name, regionId) VALUES(4, 'Columbia', 4);
INSERT INTO states(id, name, regionId) VALUES(5, 'Indiana', 5);

INSERT INTO employeesi (id, name, stateId) VALUES(1, 'Jaden', 1);
INSERT INTO employeesi (id, name, stateId) VALUES(2, 'Abby', 1);
INSERT INTO employeesi (id, name, stateId) VALUES(3, 'Amaya', 2);
INSERT INTO employeesi (id, name, stateId) VALUES(4, 'Robert', 3);
INSERT INTO employeesi (id, name, stateId) VALUES(5, 'Tom', 4);
INSERT INTO employeesi (id, name, stateId) VALUES(6, 'William', 5);

INSERT INTO sales(id, amount, employeeId) VALUES(1, 2000, 1);
INSERT INTO sales(id, amount, employeeId) VALUES(2, 3000, 2);
INSERT INTO sales(id, amount, employeeId) VALUES(3, 4000, 3);
INSERT INTO sales(id, amount, employeeId) VALUES(4, 1200, 4);
INSERT INTO sales(id, amount, employeeId) VALUES(5, 2400, 5);


select * from regions
select * from states
select * from employeesi
select * from sales

