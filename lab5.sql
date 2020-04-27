use Outlet
go

create or alter function ValidateFirme(@nume varchar(100),@lansare date)
returns varchar(100) 
as
begin
	if(isnull(@nume,'')='' or isnull(@lansare,'')='')
		return 'Nume invalid sau lansare invalida';
	return 'Nume valid si lansare valida';
end

go

create or alter procedure CreateFirme(@id_firma int,@nume varchar(100),@lanasare date)
as
begin
	if ((select count(id_firma) from Firme where id_firma=@id_firma)=0 and [dbo].ValidateFirme(@nume,@lanasare)='Nume valid si lansare valida')
		insert into Firme values(@id_firma,@nume,@lanasare);
	else
		print 'Nu s-a putut insera';
end

go

create or alter procedure ReadFirme(@id_firma int,@nume varchar(100),@lansare date)
as
begin
	select id_firma,nume,lansare from Firme where @id_firma=id_firma;
end

go

create or alter procedure UpdateFirme(@id_firma int,@nume varchar(100),@lanasare date)
as
begin
	if((select count(id_firma) from Firme where id_firma=@id_firma)>0 and [dbo].ValidateFirme(@nume,@lanasare)='Nume valid si lansare valida')
		update Firme 
		set nume=@nume,lansare=@lanasare
		where id_firma=@id_firma;
	else
		print 'Nu se poate updata';
end

go

create or alter procedure DeleteFirme(@id_firma int)
as
begin
	delete from Produse where @id_firma=id_firma;
	delete from Firme where @id_firma=id_firma;
end

go

create or alter function ValidateClient(@nume varchar(100),@localitate varchar(100))
returns varchar(100)
as
begin
	if (isnull(@nume,'')='' or isnull(@localitate,'')='')
		return 'Nume sau localitate invalid';
	return 'Nume si localitate valide';
end

go

create or alter procedure CreateClienti(@id_client int,@nume varchar(100),@localitate varchar(100))
as
begin
	if((select count(id_client) from Clienti where id_client=@id_client)=0 and [dbo].ValidateClient(@nume,@localitate)='Nume si localitate valide')
		insert into Clienti values(@id_client,@nume,@localitate);
	else
		print 'Nu se poate adauga';
end

go  

create or alter procedure ReadClienti(@id_client int,@nume varchar(100),@localitate varchar(100))
as
begin
	select id_client,nume,localitate from Clienti where id_client=@id_client;
end

go

create or alter procedure UpdateClienti(@id_client int,@nume varchar(100),@localitate varchar(100))
as
begin
	if((select count(id_client) from Clienti where id_client=@id_client)>0 and [dbo].ValidateClient(@nume,@localitate)='Nume si localitate valide')
		update Clienti
		set nume=@nume,localitate=@localitate
		where id_client=@id_client;
	else
		print 'Nu se poate updata';
end

go

create or alter procedure DeleteClienti(@id_client int)
as
begin
	delete from Card_de_fidelitate where id_client=@id_client;
	delete from Comenzi where id_client=@id_client;
	delete from Clienti where id_client=@id_client;
end

go

create or alter function ValidateProduse(@nume varchar(100),@id_firma int ,@id_cmonada int)
returns varchar(100)
as
begin
	if(isnull(@nume,'')='' or @id_firma<0 or @id_firma>200 or @id_cmonada<0)
		return 'Nume sau id firma sau id comanda invalide';
	return 'Nume si id-uri valide';
end

go

create or alter procedure CreateProduse(@id_produs int,@nume varchar(100),@id_firma int,@id_comanda int)
as
begin
	if((select count(id_produs) from Produse where id_produs=@id_produs)=0 and [dbo].ValidateProduse(@nume,@id_firma,@id_comanda)='Nume si id-uri valide')
		insert into Produse values(@id_produs,@nume,@id_firma,@id_comanda);
	else 
		print 'Nu se poate adauga';
end

go

create or alter procedure ReadProduse(@id_produs int,@nume varchar(100),@id_firma int,@id_comanda int)
as
begin
	select id_produs,nume,id_firma,@id_comanda from Produse where id_produs=@id_produs;
end

go

create or alter procedure UpdateProduse(@id_produs int,@nume varchar(100),@id_firma int,@id_comanda int)
as
begin
	if((select count(id_produs) from Produse where id_produs=@id_produs)>0 and [dbo].ValidateProduse(@nume,@id_firma,@id_comanda)='Nume si id-uri valide')
		update Produse
		set nume=@nume,@id_comanda=@id_comanda,id_firma=@id_firma
		where id_produs=@id_produs;
	else
		print 'Nu se poate updata';
end

go

create or alter procedure DeleteProduse(@id_produs int,@nume varchar(100),@id_firma int,@id_comanda int)
as
begin
	delete from Produse where id_produs=@id_produs;
end

go

create or alter function ValidateCategorii(@marime varchar(100),@culoare varchar(100))
returns varchar(100)
as
begin
	if (isnull(@marime,'')='' or isnull(@culoare,'')='')
		return 'Marime sau culoare invalide';
	return 'Marime si culoare valide';
end 

go

create or alter procedure CreateCategorii(@id_categorie int,@marime varchar(100),@culoare varchar(100))
as
begin
	if((select count(id_categorie) from Categorii_produse where id_categorie=@id_categorie)=0 and [dbo].ValidateCategorii(@marime,@culoare)='Marime si culoare valide')
		insert into Categorii_produse values(@id_categorie,@culoare,@marime);
	else
		print 'Nu se poate adauga';
end

go

create or alter procedure ReadCategorii(@id_categorie int,@marime varchar(100),@culoare varchar(100))
as
begin
	select id_categorie,culoare,marime from Categorii_produse where id_categorie=@id_categorie;
end

go

create or alter procedure UpdateCategorii(@id_categorie int,@marime varchar(100),@culoare varchar(100))
as
begin
	if(select count(id_categorie) from Categorii_produse where id_categorie=@id_categorie)>0 and [dbo].ValidateCategorii(@marime,@culoare)='Marime si culoare valide'
		update Categorii_produse
		set culoare=@culoare,marime=@marime
		where id_categorie=@id_categorie;
	else
		print 'Nu se poate updata ';
end

go

create or alter procedure DeleteCategorii(@id_categorie int)
as
begin
	delete from Categorii_produse where id_categorie=@id_categorie;
end

go

create or alter procedure CreateCPL(@id_produs int,@id_categorie int)
as
begin
	if (select count(id_produs) from Cat_prod_legatura where id_produs=@id_produs)=0
		insert into  Cat_prod_legatura values(@id_produs,@id_categorie);
	else
		print 'Nu se poate adauga';
end

go

create or alter procedure ReadCPL(@id_produs int,@id_categorie int)
as
begin
	select id_produs,id_categorie from Cat_prod_legatura where id_categorie=@id_categorie and id_produs=@id_produs;
end

go

create or alter procedure UpdateCPL(@id_produs int,@id_categorie int)
as
begin
	if (select count(id_produs) from Cat_prod_legatura where id_produs=@id_produs)>0
		update Cat_prod_legatura
		set id_categorie=@id_categorie,id_produs=@id_produs
		where id_produs=@id_produs;
	else
		print 'Nu se poate updata';
end

go

create or alter procedure DeleteCPL(@id_produs int,@id_categorie int)
as
begin
	delete from Cat_prod_legatura where id_produs=@id_produs;
end

go

create or alter view V1 as 
/*selecteaza toate produsele care au culoarea verde*/
select P.id_produs,P.nume,C.culoare From Produse P inner join Cat_prod_legatura Cat on P.id_produs=Cat.id_produs inner join Categorii_produse C on C.id_categorie=Cat.id_categorie where C.culoare='verde';

go

create or alter view V2 as
/*afiseaza firmele care au cel putin un produs*/
select Distinct F.nume from Firme F inner join Produse P on F.id_firma=P.id_firma;

go

if exists(select name from sys.indexes where name=N'N_idx_nume')
	drop index N_idx_nume on Firme;

go

create nonclustered index N_idx_nume on Firme(nume);

go

if exists(select name from sys.indexes where name=N'N_idx_culoare')
	drop index N_idx_culoare on Categorii_produse;

go

create nonclustered index N_idx_culoare on Categorii_produse(culoare);

go

exec CreateFirme 14,'Pull&Bear','1992-08-08';
exec ReadFirme 6,'','';
exec DeleteFirme 13;
exec UpdateFirme 3,'Puma','2012-01-12';
select * from Firme;

exec CreateProduse 20,'Fular',7,12;
exec ReadProduse 10,'','','';
exec DeleteProduse 17,'','','';
exec UpdateProduse 18,'Esarfa',2,9;
select * from Produse;

exec CreateClienti 20,'Mirel','Afumati';
exec ReadClienti 10,'','';
exec DeleteClienti 20;
exec UpdateClienti 9,'Dorel','Crotone';
select * from Clienti;

exec CreateCPL 20,10;
exec CreateCPL 18,10;
exec CreateCPL 8,10;
exec ReadCPL 12,7;
exec DeleteCPL 20,10;
exec DeleteCPL 18,10;
exec DeleteCPL 8,10;
exec UpdateCPL 12,7;
select * from Cat_prod_legatura;

exec CreateCategorii 10,'M','gri';
exec ReadCategorii 3,'','';
exec DeleteCategorii 10;
exec UpdateCategorii 8,'S','rosu';
select * from Categorii_produse;

select * from V1 order by culoare;
select * from V2 order by nume;