--view care selecteaza numele produselor

create or alter View vw_Produse
as
	select nume from Produse;
go

--view care da tipurile de produs alese

create or alter VIEW vw_ProduseAlese(ID,Tip)
AS
SELECT DISTINCT P.id_produs,P.nume FROM Produse AS P
INNER JOIN Cat_prod_legatura AS Cat 
ON P.id_produs=Cat.id_produs
INNER JOIN Categorii_produse AS CatP
ON Catp.id_categorie=Cat.id_categorie;
GO

--toate produsele grupate dupa culoare

create or alter VIEW vw_GrupateCuloare(ID,Produs,[Numar culori alese])
AS
select P.id_produs,P.nume,C.culoare from Produse P
inner join Cat_prod_legatura Cat on P.id_produs=Cat.id_produs
inner join Categorii_produse C on C.id_categorie=Cat.id_categorie
group by P.nume,C.culoare,P.id_produs;
GO