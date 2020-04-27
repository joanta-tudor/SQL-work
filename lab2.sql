use Outlet
go

insert into Clienti values(1,'Stefan','Cluj');
insert into Clienti values(2,'Alex','Bucuresti');
insert into Clienti values(3,'Tudor','Iasi');
insert into Clienti values(4,'Cornel','Zalau');
insert into Clienti values(5,'Daniel','Sibiu');
insert into Clienti values(6,'Stefania','Cluj');
insert into Clienti values(7,'Alexia','Bucuresti');
insert into Clienti values(8,'Stefania','Brasov');
insert into Clienti values(9,'Alexandra','Sighisoara');
insert into Clienti values(10,'Diana','Deva');

insert into Card_de_fidelitate values (1,10,1,4);
insert into Card_de_fidelitate values (2,20,2,6);
insert into Card_de_fidelitate values (3,10,1,7);
insert into Card_de_fidelitate values (4,20,2,10);
insert into Card_de_fidelitate values (5,10,1,1);
insert into Card_de_fidelitate values (6,10,2,2);
insert into Card_de_fidelitate values (7,20,3,5);
insert into Card_de_fidelitate values (8,40,4,3);
insert into Card_de_fidelitate values (9,10,1,8);
insert into Card_de_fidelitate values (10,30,3,9);

insert into Flota_de_masini values(1,'Skoda');
insert into Flota_de_masini values(2,'Volkswagen');
insert into Flota_de_masini values(3,'Nissan');
insert into Flota_de_masini values(4,'Honda');
insert into Flota_de_masini values(5,'Audi');
insert into Flota_de_masini values(6,'Mercedes');
insert into Flota_de_masini values(7,'Alfa Romeo');
insert into Flota_de_masini values(8,'Opel');
insert into Flota_de_masini values(9,'Dacia');
insert into Flota_de_masini values(10,'Kia');

insert into Soferi values(1,'Cosmin',10);
insert into Soferi values(2,'Tudor',6);
insert into Soferi values(3,'Cristian',15);
insert into Soferi values(4,'Sergiu',3);
insert into Soferi values(5,'Ilie',20);
insert into Soferi values(6,'Vasile',7);
insert into Soferi values(7,'Gheorghe',2);
insert into Soferi values(8,'Ioan',17);
insert into Soferi values(9,'Petru',9);
insert into Soferi values(10,'Mirel',21);

insert into Livrari values(1,'Str.Aurel Vlaicu',2,1,3);
insert into Livrari values(2,'Str.Mihai Eminescu',1,4,2);
insert into Livrari values(3,'Str.George Bacovia',3,2,1);
insert into Livrari values(4,'Str.Aviatorilor',1,5,5);
insert into Livrari values(5,'Str.George Bacovia',2,2,1);
insert into Livrari values(6,'Str.Stefan cel Mare',1,6,10);
insert into Livrari values(7,'Str.Infundata',2,1,3);
insert into Livrari values(8,'Str.Iuliu Maniu',1,6,10);
insert into Livrari values(9,'Str.Gheorghe Sincai',2,7,9);
insert into Livrari values(10,'Str.Olarilor',4,9,6);

insert into Firme values(1,'Nike','1929-03-11');
insert into Firme values(2,'Adidas','1955-09-20');
insert into Firme values(3,'New Balance','2001-01-01');
insert into Firme values(4,'Puma','1966-12-18');
insert into Firme values (5,'Polo Ralph Lauren','1993-07-21');
insert into Firme values(6,'TheNorthFace','2010-08-22');
select * from Firme;

insert into Comenzi values(1,'geaca',1,1);
insert into Comenzi values(2,'boxeri',2,4);
insert into Comenzi values(3,'tricou',1,1);
insert into Comenzi values(4,'hanorac',2,4);
insert into Comenzi values(5,'sosete',3,8);
insert into Comenzi values(6,'camasa',4,9);
insert into Comenzi values(7,'adidasi',4,9);
insert into Comenzi values(8,'geaca',5,7);
insert into Comenzi values(9,'pulover',5,7);
insert into Comenzi values(10,'hanorac',6,5);
insert into Comenzi values(11,'camasa',5,7);
insert into Comenzi values(12,'adidasi',6,10);
insert into Comenzi values(13,'maieu',7,6);
insert into Comenzi values(14,'sapca',7,6);
insert into Comenzi values(15,'boxeri',8,2);
insert into Comenzi values(16,'boxeri',1,1);
insert into Comenzi values(17,'pantaloni',8,2);
insert into Comenzi values(18,'adidasi',9,3);
insert into Comenzi values(19,'geaca',9,3);
insert into Comenzi values(20,'sosete',9,3);


insert into Produse values(1,'geaca',6,19);
insert into Produse values(2,'tricou',1,3);
insert into Produse values(3,'adidasi',2,7);
insert into Produse values(4,'hanorac',3,10);
insert into Produse values(5,'maieu',2,13);
insert into Produse values(6,'camasa',5,11);
insert into Produse values(7,'boxeri',5,16);
insert into Produse values(8,'sosete',1,20);
insert into Produse values(9,'adidasi',3,7);
insert into Produse values(10,'tricou',4,3);
insert into Produse values(11,'sapca',4,14);
insert into Produse values(12,'geaca',5,1);
insert into Produse values(13,'pantaloni',3,17);
insert into Produse values(14,'pulover',6,9);
insert into Produse values(15,'adidasi',1,12);
insert into Produse values(16,'boxeri',4,15);
insert into Produse values(17,'pantaloni',6,17);
insert into Produse values(18,'pulover',1,9);

insert into Categorii_produse values(1,'verde');
insert into Categorii_produse values(2,'negru');
insert into Categorii_produse values(3,'alb');
insert into Categorii_produse values(4,'gri');
insert into Categorii_produse values(5,'turquoise');
insert into Categorii_produse values(6,'rosu');
insert into Categorii_produse values(7,'roz');
insert into Categorii_produse values(8,'albastru');
insert into Categorii_produse values(9,'portocaliu');
insert into Categorii_produse values(10,'bej');

insert into Cat_prod_legatura values(1,2);
insert into Cat_prod_legatura values(2,9);
insert into Cat_prod_legatura values(3,4);
insert into Cat_prod_legatura values(4,8);
insert into Cat_prod_legatura values(5,3);
insert into Cat_prod_legatura values(6,7);
insert into Cat_prod_legatura values(7,2);
insert into Cat_prod_legatura values(8,10);
insert into Cat_prod_legatura values(9,5);
insert into Cat_prod_legatura values(10,6);
insert into Cat_prod_legatura values(11,2);
insert into Cat_prod_legatura values(12,7);
insert into Cat_prod_legatura values(13,1);
insert into Cat_prod_legatura values(14,4);
insert into Cat_prod_legatura values(15,9);
insert into Cat_prod_legatura values(16,3);
insert into Cat_prod_legatura values(17,1);
insert into Cat_prod_legatura values(18,10);

select * from Livrari where durata>1 ;






