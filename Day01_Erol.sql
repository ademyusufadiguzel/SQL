--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
create table ogrenci_notlari
as -- Benzer tablodaki basliklarla ve data tiplerinde yeni bir tablo olusturmak icin
--normal tablo olusturuken ki parantezler yerine AS kullanip Select komutuyla almak istedigimiz verileri aliriz
select isim,soyisim,not_ort from ogrenciler2;

-- DML - DATA MANUPULATION LANG.
-- INSER (Database'e veri ekleme)
insert into ogrenciler2 values ('1234567','Adem Yusuf','ADIGUZEL',85.5,now());
insert into ogrenciler2 values ('1234567','Adem Yusuf','ADIGUZEL',85.5,'2022-12-01');

-- BIR TABLOYA PARCALI VERI EKLEMEK
insert into ogrenciler2 (isim,soyisim) values ('Eslem','ADIGUZEL');

-- DQL - DATA QUERY LANG.
-- SELECT
select * from ogrenciler2;
