select * from ogrenciler2;
update ogrenciler2 set ogrenci_no=1234567, not_ort=90.5 where isim='Eslem';
select * from ogrenciler2;
update ogrenciler2 set kayit_tarih=now() where isim='Eslem';
create table notlar
as
select isim, not_ort from ogrenciler2;
select * from notlar;
--INSERT - TABLO ICINE VERI EKLEME
insert into notlar values ('Jessie', 75);
update notlar set isim='Walter' where not_ort=85.5;

create table talabeler(
isim varchar(10),
notlar real
);
insert into talabeler values('jack', 77);
insert into talabeler values('saul', 97.5);
insert into talabeler values('gus', 87.5);
insert into talabeler values('scofial', 100);
insert into talabeler values('hans', 95.5);
select * from talabeler;

-- CONSTRAINT
-- UNIQEU
create table ogrenciler6(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarihi date
);
select * from ogrenciler6;
insert into ogrenciler6 values ('1234567', 'Old','Spice', 90,now());
insert into ogrenciler6 values ('1234568', 'rexona','Man', 90,now());
insert into ogrenciler6 (ogrenci_no, soyisim, not_ort) values ('1234569','Cold', 60);-- NOT NULL kisitlamadi oldugu icin bu veri eklenemedi

-- PRIMARY KEY atamasi

create table ogrenciler8(
ogrenci_no char(7) primary key,
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarihi date
);

-- PRIMARY KEY atamasi 2.yol

create table ogrenciler9(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarihi date,
constraint ogr primary key(ogrenci_no)
);

-- FOREIGN KEY
/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/
create table tedarikciler3(
tedakrikci_id varchar(20) primary Key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(10)
);

create table urunler(
tedarikci_id char(5),
urun_id char(5),
foreign key (tedarikci_id) references tedarikciler3(tedakrikci_id)
);

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun.
“adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');-- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- 
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');-- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');-- PRIMARY KEY
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;
