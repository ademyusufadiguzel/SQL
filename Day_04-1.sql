create table workers(
id smallint,
name varchar(50),
salary smallint,
constraint id4_pk primary key(id)
);

insert into workers values (10001, 'Ali Can', 12000);
insert into workers values (10002, 'Veli Han', 2000);
insert into workers values (10003, 'Mary Star', 7000);
insert into workers values (10004, 'Angie Ocean', 8500);

--En dusuk ve en buyuk salary degerlerine sahip recordlari cagirin.
select * from workers where salary in((select max(salary) from workers), (select min(salary) from workers));

--En yuksek salary degerini bulunuz.
--"AS" keywordu kullanilarak konsola gecici(temporary) field olusturulabilir.
select max(salary) as maximum_salary
from workers;

--En dusuk salary degerini bulunuz.
select min(salary) as minimum_salary
from workers;

--Salary ortalamasini bulun.
select avg(salary) as avarage_salary
from workers;

--Record sayisini(adetini) bulunuz.
select count(name) as number_of_workers
from workers;

--Salary toplamini veren kodu yaziniz.
select sum(salary) as salary_sum
from workers;

--Interview Question: En yuksek ikinci salary degerini bulunuz.
select max(salary) as second_highest_salary from workers 
where salary<(Select max(salary) from workers);

--Interview Question: En dusuk ikinci salary degerini bulunuz.
select min(salary) as second_lowest_salary from workers 
where salary>(select min(salary) from workers);

--En yuksek ucuncu salary degerini bulunuz.
select max(salary) as third_max_salary
from workers
where salary<(select max(salary) as second_highest_salary 
			  from workers 
			  where salary<(Select max(salary) from workers));

--En dusuk ucuncu salary degerini bulun
select min(salary) as third_min_salary
from workers
where salary> (select min(salary) as second_lowest_salary from workers 
where salary>(select min(salary) from workers));

--Salary degeri en yuksek ikinci degere sahip record'i cagirin.
--1.Yol:
select * from workers where salary = (select max(salary) as second_highest_salary from workers 
where salary<(Select max(salary) from workers));

--2.Yol:
select * from workers
order by salary desc
offset 1 row
fetch next 1 row only;

--Salary degeri en dusuk ikinci degere sahip record'i cagirin.
select * from workers
order by salary
offset 1 row
fetch next 1 row only;

--Salary degeri en yuksek ucuncu olan record'i cagirin.
select * from workers
order by salary desc
offset 2 ROW
fetch next 1 row only;

select * from workers;

-----------------------




