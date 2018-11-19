drop database if exists udrugazazastituzivotinja;
create database udrugazazastituzivotinja;
use udrugazazastituzivotinja;

create table udrugazazastituzivotinja (
sifra int not null primary key auto_increment,
naziv varchar (50) not null,
adresa varchar (50) not null,
radnovrijeme varchar (50) not null,
email varchar (100) not null
);

create table osoba (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
oib varchar (11) not null,
iban varchar (21) not null,
udrugazazastituzivotinja int not null
);

create table sticenik (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
vrsta varchar (50) not null,
pasmina varchar (50) not null,
datumdolaska datetime not null,
osoba int not null 
);

create table prostor (
sifra int not null primary key auto_increment,
naziv varchar (50) not null,
dimenzija decimal (5,2) not null,
sticenik int not null
);

alter table osoba add foreign key (udrugazazastituzivotinja) references udrugazazastituzivotinja (sifra);
alter table sticenik add foreign key (osoba) references osoba (sifra);
alter table prostor add foreign key (sticenik) references sticenik (sifra);

insert into udrugazazastituzivotinja (sifra,naziv,adresa,radnovrijeme,email) values
(null,'Šapa','Vukovarska 50 Osijek','08:00-16:00','sapa@gmail.com');

insert into osoba (sifra,ime,prezime,oib,iban,udrugazazastituzivotinja) values
(null,'Vlatka','Norić','03214568794','HR0321456879654210321',1),
(null,'Petar','Martinović','12321458789','HR8974563210321456454',1);

insert into sticenik (sifra,ime,vrsta,pasmina,datumdolaska,osoba) values
(null,'Max','pas','škotski ovčar','2018-01-20 09:50',2),
(null,'Joza','mačka','ruska plava macka','2018-10-01 10:20',1),
(null,'Loki','pas','hrvatski ovčar','2018-12-05 15:50',2);

insert into prostor (sifra,naziv,dimenzija,sticenik) values
(null,'MAX',15.2,1),(null,'JOZA',10.8,2),(null,'LOKI',20,3);