create database Outlet 
go
use Outlet
go

create table Clienti(
	id_client int primary key,
	nume varchar(100),
	localitate varchar(100)
)

create table Card_de_fidelitate(
	id_card int primary key,
	reducere int,
	durata int,
	id_client int foreign key references Clienti(id_client) unique
)

create table Firme(
	id_firma int primary key,
	nume varchar(100),
	lansare date
)

create table Soferi(
	id_sofer int primary key,
	nume varchar(100),
	experienta int
)

create table Flota_de_masini(
	id_masina int primary key,
	tip varchar(100),
)

create table Livrari(
	id_livrare int primary key,
	adresa varchar(100),
	durata varchar(100),
	id_masina int foreign key references Flota_de_masini(id_masina),
	id_sofer int foreign key references Soferi(id_sofer)
)

create table Comenzi(
	id_comanda int primary key,
	produs varchar(100),
	id_client int foreign key references Clienti(id_client),
	id_livrari int foreign key references Livrari(id_livrare)
)

create table Produse(
	id_produs int primary key,
	nume varchar(100),
	id_firma int foreign key references Firme(id_firma),
	id_comanda int foreign key references Comenzi(id_comanda)
)

create table Categorii_produse(
	id_categorie int primary key,
	culoare varchar(100)
)

create table Cat_prod_legatura(
	id_produs int foreign key references Produse(id_produs),
	id_categorie int foreign key references Categorii_produse(id_categorie)
	constraint dk_cat_prod_legatura primary key(id_produs,id_categorie)
	)