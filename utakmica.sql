drop database if exists utakmica;
create database utakmica character set utf8 collate utf8_general_ci;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\utakmica.sql
use utakmica;

create table stadion (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
pocetak datetime not null,
domacin int not null,
gost int not null
);

create table momcad (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
izbornik varchar (100) not null
);

create table igrac (
sifra int not null primary key auto_increment,
ime varchar (100) not null,
prezime varchar (100) not null,
momcad int not null
);

alter table stadion add foreign key (domacin) references momcad (sifra);
alter table stadion add foreign key (gost) references momcad (sifra);
alter table igrac add foreign key (momcad) references momcad (sifra);

insert into momcad (sifra,naziv,izbornik) values
(null,'Engleska','Gareth Southgate'),
(null,'Hrvatska','Zlatko Dalić'),
(null,'Španjolska','Luis Enrique'),
(null,'Portugal','Fernando Santos');

insert into stadion (sifra,naziv,pocetak,domacin,gost) values
(null,'Wembley','2018-11-15 15:00:00',1,2),
(null,'Santiago bernabeu','2018-11-16 18:00:00',3,4);

insert into igrac (sifra,ime,prezime,momcad) values 
(null,'Harry ','Kane',1),
(null,'Jack','Wilshere',1),
(null,'Luka','Modrić',2),
(null,'Ivan','Rakitić',2),
(null,'Sergio ','Ramos',3),
(null,'David','Silva',3),
(null,'Adrien','Silva',4),
(null,'	Cristiano','Ronaldo',4);

update stadion set pocetak='2018-11-18 19:30:00';

delete from igrac where sifra=2;

insert into igrac (sifra,ime,prezime,momcad) values
(2,'Joe','Hart',1);

select * from igrac where sifra=4;

update igrac set ime='Ivan', prezime='Perišić'
where sifra=4; 


select * from stadion;

select * from stadion where sifra=2;

update stadion set pocetak='2018-10-11 16:00:00'
where sifra=2;
