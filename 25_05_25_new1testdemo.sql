use NEW1
go

CREATE TABLE sellers (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  rating INTEGER NOT NULL
);

CREATE TABLE items (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  sellerId INTEGER,
  FOREIGN KEY (sellerId) REFERENCES sellers(id)
);

INSERT INTO sellers(id, name, rating) VALUES(1, 'Roger', 3);
INSERT INTO sellers(id, name, rating) VALUES(2, 'Penny', 5);

INSERT INTO items(id, name, sellerId) VALUES(1, 'Notebook', 2);
INSERT INTO items(id, name, sellerId) VALUES(2, 'Stapler', 1);
INSERT INTO items(id, name, sellerId) VALUES(3, 'Pencil', 2);

select * from sellers s 
select*from items

select i.name as itemname,s.name as sellername from sellers s 
inner join items i on s.id=i.sellerid 
where rating > 4;

create table users
(
id int,
name varchar(20),
sex varchar(1)
);

insert into users (id,name,sex) values(1,'ann',''),
(2,'steve','m'),(3,'mary','f'),(4,'brenda','f')

create table friends 
(
user1 int,
user2 int
);

insert into friends (user1,user2) 
values (1,2),(1,3),(2,3);

select * from users;select * from friends;
update users set sex=null where id=1
select users.name,count(*) as count from
users
left join friends 
on users.id=friends.user1 or users.id=friends.user2
where users.sex='f'
group by users.id,users.name;

select users.name from
users
left join friends 
on users.id=friends.user1 or users.id=friends.user2
where users.sex='f'
---group by users.id,users.name;




