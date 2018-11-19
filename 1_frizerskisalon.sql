drop database if exists frizerskisalon;
create database frizerskisalon;
use frizerskisalon;

create table frizerskisalon(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
adresa varchar(50) not null,
radnovrijeme varchar(50) not null,
kontakbroj varchar(20) not null,
email varchar(100)
);

create table djelatnica(
sifra int not null primary key auto_increment,
ime varchar(50)not null,
prezime varchar(50) not null,
oib char(11),
iban char(21),
frizerskisalon int not null
);

create table korisnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
kontakbroj varchar(50) not null
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

alter table djelatnica add foreign key (frizerskisalon) references frizerskisalon (sifra);
alter table posjeta_usluga add foreign key (posjeta) references posjeta (sifra);
alter table posjeta_usluga add foreign key (usluga) references usluga (sifra);
alter table posjeta add foreign key (djelatnica) references djelatnica (sifra);
alter table posjeta add foreign key (korisnik) references korisnik (sifra);

insert into frizerskisalon (sifra,naziv,adresa,radnovrijeme,kontakbroj,email) values
(null,'charlie','osječka 27','07:00-20:00','031/653-352','charlie@gmail.com');

insert into djelatnica (sifra,ime,prezime,oib,iban,frizerskisalon) values
(null,'Petra','Petrić','23564789651','HR0214536985231457896',1),
(null,'Josipa','Tunić','98725431254','HR7854631526478925634',1);

insert into korisnik (sifra,ime,prezime,kontakbroj) values
(null,'Marko','Ivić','0986543256'),
(null,'Tomislav','Konti','0958952132'),
(null,'Ivona','Ivić','091524756');

insert into usluga (sifra,naziv,cijena,trajanjeusluge) values
(null,'šišanje',30,'30 min'),
(null,'pranje',15,'25 min'),
(null,'bojanje',120,'90 min');

insert into posjeta (sifra,djelatnica,korisnik) values
(null,1,2),
(null,2,1),
(null,1,3);

insert into posjeta_usluga (posjeta,usluga) values
(1,1),(3,3),(1,2),(1,3),(2,1);