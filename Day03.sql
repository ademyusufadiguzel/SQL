--Sutunlari worker_id, worker_salary olan bir "workers" table olusturun.
--worker_id sutununu worker_id_pk adiyla primary key atayin.
--4 record girisi yapin.
--Table\i konsolda goruntuleyin.

create table workers(
worker_id smallint,
worker_name varchar(50),
worker_salary int,
constraint worker_id_pk primary key(worker_id)
);

insert into workers values(1000,'Jack',5000);
insert into workers values(1001,'Tom',6800);
insert into workers values(1002,'Frank',4500);
insert into workers values(1003,'Jude',10000);

--Tom'un salary degerini en yuksek salary degerinin %20 dusugune degistirin.
update workers set worker_salary = (select max(worker_salary) * 0.8 from workers)
where worker_id = 1001;

--Jack'in salary degerini en dusuk salary degerinin %30 fazlasina degistirin.
update workers set worker_salary = (select min(worker_salary) * 1.3 from workers)
where worker_id = 1000;

--Ortalama salary degerinden dusuk olan salary degerlerini 1000 artirin.
update workers set worker_salary = (select avg(worker_salary) from workers)+1000
where worker_salary <(select avg(worker_salary) from workers);

--Ortalama salary degerinden dusuk salary degerlerine ortalama salary degeri atayin.
update workers set worker_salary = (select avg(worker_salary) from workers)
where worker_salary<(select avg(worker_salary) from workers);

select * from workers;


--IS NULL Condition
create table people(
ssn int,
name varchar(50),
address varchar(80)
);

insert into people values(123456789, 'Mark Star', 'Florida');
insert into people values(234567890, 'Angie Way', 'Virginia');
insert into people values(345678901, 'Maryy Tien', 'New Jersey');
insert into people(ssn, address) values(456789012, 'Michigan');
insert into people(ssn, address) values(567890123,'California');
insert into people(ssn, name) values(567890123,'California');

--null name degerlerini "to be inserted later" degerine guncelleyin.
update people set name = 'to be inserted later'
where name is null;

--null address degerlerini "to be inserted later" dgerine guncelleyin.
update people set address = 'to be inserted later'
where address = 'Washington';


--Bir table'dan RECORD nasil silinir:
delete from people where ssn = '23456790';

--Isimsiz RECORD'lari siliniz.
delete from people where name = 'to be inserted later';
delete from people where address = 'to be inserted later';
--Tum recordlari silme.
--Delete Command sadece recordlari siler, table'i yok etmez.
delete from people;


--Name ve address degerleri null olan record'lari silin.
delete from people
where name is null or address is null;

--ssn degeri 123456789'dan buyuk ve 345678901'den kucuk olan record'lari sil
delete from people 
where ssn>123456789 and ssn<345678901;

--name degeri null olmayan tum record'lari silin.
delete from people 
where name is not null;

--Truncate command tum record'lari siler.
--Delete ile kismen ayni islemi gorur.

--Truncate ve Delete arasindaki fark nedir?

--1) DELETE komutunda filtrelemek icin WHERE clause kullanilabilir fakat TRUNCATE komutunda kullnilamaz.
--2) DELETE komutunda sildigimiz record'lar geri cagirabilir fakat TRUNCATE komutunda record'lar geri cagirilamaz.(Roll Back)

truncate table people;

--Schema(sema)'dan table nasil kaldirilir?
drop table people;

select * from workers;

--DQL: Data Query Language. Data okumak icin kullanilar dil.(SELECT)
create table workers(
id smallint,
name varchar(50),
salary smallint,
constraint id4_pk primary key(id)
);

insert into workers values(10001, 'Ali Can', 12000);
insert into workers values(10002, 'Veli Han', 2000);
insert into workers values(10003, 'Mary Star', 7000);
insert into workers values(10004, 'Angie Ocean', 8500);

--Tum record'lar nasil cagirilir:
select * from workers;

--Spesifik bir field(stun) nasil cagirili:
select name from workers;

--Spesifik coklu field(stun) nasil cagirili:
select name, salary from workers;

--Spesifik bir record nasil cagirilir:
select * from workers where id = 10001;

--Coklu spesifik recordlar nasil cagirilir:
select * from workers where id<10003;

--Salary degeri 2000,7000 yada 12000 olanlari cagirin:
select * from workers where salary in(2000, 7000, 12000);

--Spesifik bir hucre(cell) nasil cagirilir:
select name from workers where id = 10002;

--En yuksek salary degerine sahip record'u cagirin:
select * from workers where salary = (select max(salary) from workers);

--En dusuk salary degerine sahip record'u cagirin:
select * from workers where salary = (select min(salary) from workers);


select * from workers;