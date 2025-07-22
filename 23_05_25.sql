CREATE TABLE dogs (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(50) NOT NULL
);

CREATE TABLE cats (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(50) NOT NULL
);

INSERT INTO dogs(id, name) values(1, 'Lola');
INSERT INTO dogs(id, name) values(2, 'Bella');
INSERT INTO cats(id, name) values(1, 'Lola');
INSERT INTO cats(id, name) values(2, 'Kitty');



select name from dogs 
union
select name from cats

select * from dogs d full join cats c on d.id = c.id
select * from dogs d inner join cats c on d.id = c.id
select * from dogs d left join cats c on d.id = c.id
select * from dogs d right join cats c on d.id = c.id

CREATE TABLE enums_sets_example (
    size ENUM('small', 'medium', 'large'),     -- Only these values allowed
    options SET('a', 'b', 'c', 'd')            -- Any combination of these
);
CREATE TABLE EnumSimExample (
    Size VARCHAR(10) CHECK (Size IN ('small', 'medium', 'large'))
);


CREATE TABLE sessions (
  id INTEGER NOT NULL PRIMARY KEY,
  userId INTEGER NOT NULL,
  duration DECIMAL NOT NULL
);

INSERT INTO sessions(id, userId, duration) VALUES(1, 1, 10);
INSERT INTO sessions(id, userId, duration) VALUES(2, 2, 18);
INSERT INTO sessions(id, userId, duration) VALUES(3, 1, 14);

select userid,avg(duration) from sessions
group by userid
having count(*)>1


declare @total int =-10,@money int =10

SET @total += 1
select @money+@total;



declare @total1 int =10

SET @total1 -= 1

select @total1;


declare @total2 int =10

SET @total2 *= -1

select @total2;


declare @total3 int =10

SET @total3 /= -2

select @total3;


declare @total4 int =10, @q int=2

--SET @total4 %=2

select @total4 %=@q;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 1000.00),
(2, 'Tablet', 500.00),
(3, 'Smartphone', 750.00),
(4, 'Monitor', 300.00);

delete from products

--using comound operator to increase 10% of price value

update products set price =price*(.90)

update products set price *=.90

select * from products for xml auto

CREATE TABLE employees23 (
  id INTEGER NOT NULL PRIMARY KEY,
  managerId INTEGER, 
  name VARCHAR(30) NOT NULL,
  FOREIGN KEY (managerId) REFERENCES employee23(id)
);

INSERT INTO employees23(id, managerId, name) VALUES(1, NULL, 'John');
INSERT INTO employees23(id, managerId, name) VALUES(2, 1, 'Mike');
