drop database if exists salonzauljepsavanje;
create database salonzauljepsavanje;
use salonzauljepsavanje;

create table salonzauljepsavanje (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
adresa varchar (100) not null,
radnovrijeme varchar (100) not null,
email varchar (100) not null
);
 create table djelatnica (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
oib char (11) not null,
iban char (23) not null,
salonzauljepsavanje int not null
);

create table korisnik (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
datumdolaska datetime not null
);

create table usluga (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
cijena decimal(5,2) not null,
trajanjeusluge varchar(20) not null
);

create table posjeta_usluga(
posjeta int not null,
usluga int not null
);

create table posjeta(
sifra int not null primary key auto_increment,
djelatnica int not null,
korisnik int not null
);

alter table djelatnica add foreign key (salonzauljepsavanje) references salonzauljepsavanje (sifra);
alter table posjeta_usluga add foreign key (posjeta) references posjeta (sifra);
alter table posjeta_usluga add foreign key (usluga) references usluga (sifra);
alter table posjeta add foreign key (djelatnica) references djelatnica (sifra);
alter table posjeta add foreign key (korisnik) references korisnik (sifra);


insert into salonzauljepsavanje (sifra,naziv,adresa,radnovrijeme,email) values
(null,'Beauty','Divaltova 107 Osijek','09:00-19:00','beauty99@gmail.com');

insert into djelatnica (sifra,ime,prezime,oib,iban,salonzauljepsavanje) values
(null,'Martina','Varžić','54212365478','HR654231785423214598',1),
(null,'Tamara','Kopić','45213214785','HR212458745213254125',1);

insert into korisnik (sifra,ime,prezime,datumdolaska) values
(null,'Josip','Tomić','2018-10-30 09:00'),
(null,'Valentina','Petri','2018-11-10 11:30'),
(null,'Kristina','Sop','2018-12-05 15:45');

insert into usluga (sifra,naziv,cijena,trajanjeusluge) values
(null,'manikura',60,'45 min'),
(null,'pedikura',40,'30 min');

insert into posjeta (sifra,djelatnica,korisnik) values
(null,1,2),
(null,2,1),
(null,1,3);

insert into posjeta_usluga (posjeta,usluga) values
(1,1),(3,1),(1,2),(1,2),(2,1);