go
use Outlet
go

select * from Firme;

insert into Firme values(7,'Jordan','1999-08-12');

/*afiseaza firmele care au cel putin un produs*/
select Distinct F.nume from Firme F inner join Produse P on F.id_firma=P.id_firma;

/*pentru fiecare firma afiseaza toate produsele grupate deupa numele firmei*/
select F.nume,P.nume from Firme F inner join Produse P on F.id_firma=P.id_firma group by F.nume,P.nume;

/*afiseaza produsele a caror firma au data de lansare mai mare decat 1990,grupate dupa nume*/
select F.nume,P.nume,F.lansare from Firme F inner join Produse P on F.id_firma=P.id_firma group by F.nume,P.nume,F.lansare having F.lansare>='1990-01-01';

/*selecteaza toate produsele care au culoarea verde*/
select P.id_produs,P.nume,Cat.id_produs,C.culoare From Produse P inner join Cat_prod_legatura Cat on P.id_produs=Cat.id_produs inner join Categorii_produse C on C.id_categorie=Cat.id_categorie where C.culoare='verde';

/*selecteaza un produs si afiseaza toate culorile lui*/
select C.id_categorie,C.culoare,P.nume From Categorii_produse C inner join Cat_prod_legatura Cat on C.id_categorie=Cat.id_categorie inner join Produse P on P.id_produs=Cat.id_produs where P.nume='boxeri';

/*selecteaza masinile care au id-ul distinct*/
select Distinct L.id_masina,F.tip from Livrari L inner join Flota_de_masini F on F.id_masina=L.id_masina;

/*selecetaza clientii cu mai mult de 3 comenzi,grupate dupa localitate*/
select  Cl.nume,Cl.localitate,count(Co.id_client) as [nr_comenzi] from Clienti Cl inner join Comenzi Co on Cl.id_client=Co.id_client group by Cl.nume,Cl.localitate having count(Co.id_client)>=3;

/*selecteaza soferii care au livrari pe strada george bacovia*/
select S.nume,L.durata,L.adresa from Soferi S inner join Livrari L on S.id_sofer=L.id_sofer where L.adresa='Str.George Bacovia';

/*afiseaza media reducerilor oferite la card de fidelitate unde vechimea acestuia este mai mare de un an*/
select avg(Ca.reducere) as [medie] from Card_de_fidelitate Ca where durata>1;

/*afiseaza produsele ale caror firme incep cu litera N*/
select P.nume,F.nume from Produse p inner join Firme F on P.id_firma=F.id_firma where F.nume like 'N%';