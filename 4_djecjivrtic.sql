drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

create table djecjivrtic (
sifra int not null primary key auto_increment,
naziv varchar (50) not null,
adresa varchar (50) not null,
radnovrijeme varchar (50) not null,
iban char (21) not null
);

create table odgojnaskupina (
sifra int not null primary key auto_increment,
naziv varchar (50) not null,
brojdjeceuskupini int not null,
djecjivrtic int not null,
odgajateljica int not null
);

create table odgajateljica (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
oib char (11) not null
);

create table dijete (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
oib char (11) not null,
alergija varchar (50) not null,
odgojnaskupina int not null
);


alter table odgojnaskupina add foreign key (djecjivrtic) references djecjivrtic (sifra);
alter table odgojnaskupina add foreign key (odgajateljica) references odgajateljica (sifra);
alter table dijete add foreign key (odgojnaskupina) references odgojnaskupina (sifra);


