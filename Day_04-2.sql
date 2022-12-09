create table customers_products(
product_id int,
customer_name varchar(50),
product_name varchar(50)
);

insert into customers_products values (10, 'Mark', 'Orange');
insert into customers_products values (10, 'Mark', 'Orange');
insert into customers_products values (20, 'John', 'Apple');
insert into customers_products values (30, 'Amy', 'Palm');
insert into customers_products values (20, 'Mark', 'Apple');
insert into customers_products values (10, 'Adem', 'Orange');
insert into customers_products values (40, 'John', 'Apricote');
insert into customers_products values (20, 'Eddie', 'Apple');

select * from customers_products;

--Product_name degeri orange , apple ve palm olan record'lari cagiriniz.
select * from customers_products where
product_name in('Orange', 'Apple', 'Palm');


--Product_name degeri orange , apple ve palm olmayan record'lari cagiriniz.
select * from customers_products where
product_name not in('Orange', 'Apple', 'Palm');


--BETWEEN Condition
--product_id 30'dan kucuk veya esit ve 20'den buyuk veya esit olan record'lari cagiriniz.
select * from customers_products where
product_id between 20 and 30;

--product_id degeri 20'den kucuk, 25'den buyuk record'lari cagiriniz.
select * from customers_products WHERE
product_id not between 20 and 25;


--EXISTS Conditions - EXISTS Conditions 'Subquery' ile kullanilir.
--					  Eger Subquery herhangi bir data cagirirsa 'Outer Query' calistirilir.
--					  Eger Subquery herhangi bir data cagirmazsa 'Outer Query' calistirilmaz.
--					  XISTS Conditions Select, Insert, Update, Delete komutlarinda kullanilabilir.


create table customers_likes(
product_id char(10),
customer_name varchar(50),
liked_product varchar(50)
);

insert into customers_likes values (10, 'Mark', 'Orange');
insert into customers_likes values (50, 'Mark', 'Pineapple');
insert into customers_likes values (60, 'John', 'Avocado');
insert into customers_likes values (30, 'Lary', 'Cherries');
insert into customers_likes values (20, 'Mark', 'Apple');
insert into customers_likes values (10, 'Adem', 'Orange');
insert into customers_likes values (40, 'John', 'Apricote');
insert into customers_likes values (20, 'Eddie', 'Apple');

select * from customers_likes;

--customer_name degerleri arasinda Lary varsa customer_name degerlerini "No name" olarak guncelle.
update customers_likes set customer_name = 'No name'
where exists(select liked_product from customers_likes where customer_name = 'Lary');

--liked_product degerleri arasinda Orange, Pineapple yada avacado varsa name degerlerini "No name" olarak guncelle.
update customers_likes set customer_name = 'No name'
where exists(select customer_name from customers_likes where liked_product in('Orange', 'Pineapple', 'Avocado'));


--customer_name degerleri arasinda Orange degeri varsa recordlari silin.
delete from customers_likes
where exists(select liked_product from customers_likes where liked_product = 'Orange');

select * from customers_likes;


--SUBQUERY














