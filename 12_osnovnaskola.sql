drop database if exists osnovnaskola;
create database osnovnaskola;
use osnovnaskola;

create table osnovnaskola(
sifra		 int not null primary key auto_increment,
naziv		 varchar(50) not null,
adresa		 varchar(50) not null,
kontaktbroj	 varchar(30) not null
);

create table uciteljica(
sifra		 int not null primary key auto_increment,
oib			 char(11) not null,
ime			 varchar(50) not null,
prezime		 varchar(50) not null,
email		 varchar(100) not null,
kontaktbroj	 varchar(30) not null,
iban		 char(21) not null,
osnovnaskola int not null
);

create table dijete(
sifra		 int not null primary key auto_increment,
ime			 varchar(50) not null,
prezime		 varchar(50) not null,
oib			 char(11) not null,
adresa		 varchar(50) not null
);

create table radionica(
sifra				 int not null primary key auto_increment,
naziv				 varchar(50) not null,
datumpocetka		 datetime not null,
datumzavrsetka		 datetime not null,
brojdjeceuradionici	 int not null,
uciteljica			 int not null
);

create table radionica_dijete(
radionica	 int not null,
dijete		 int not null
);

alter table uciteljica add foreign key (osnovnaskola) references osnovnaskola (sifra);
alter table radionica add foreign key (uciteljica) references uciteljica (sifra);
alter table radionica_dijete add foreign key (radionica) references radionica (sifra);
alter table radionica_dijete add foreign key (dijete) references dijete (sifra);

insert into osnovnaskola (sifra,naziv,adresa,kontaktbroj) values
(null,'Osnovna škola Retfala','Kapelska ul. 51A Osijek','031/275-258');

insert into uciteljica (sifra,oib,ime,prezime,email,kontaktbroj,iban,osnovnaskola) values
#1
(null,'23145897545','Tamara','Jokić','tamara.jokić@gmail.com','097564895','HR8654759632124785964',1),
#2
(null,'54789654125','Kristina','Malić','kmalic@gmail.com','092879645','HR8654759524124782464',1);

insert into dijete (sifra,ime,prezime,oib,adresa) values
#1
(null,'Toni','Kras','68974513214','Vranska 15 Osijek'),
#2
(null,'Petar','Lović','12032147896','Kopačevska 57 Osijek'),
#3
(null,'Helena','Kopljar','00321478569','Palička 10 Osijek'),
#4
(null,'Jasminka','Vlašić','78541236589','Vratnička 88 Osijek');

insert into radionica (sifra,naziv,datumpocetka,datumzavrsetka,brojdjeceuradionici,uciteljica) values
#1
(null,'informatika 101','2018-09-11 12:30','2019-02-11 14:30',10,1),
#2
(null,'Kemija 101','2018-10-20 09:00','2019-05-01 08:15',15,2);

insert into radionica_dijete (radionica,dijete) values
(1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3);

