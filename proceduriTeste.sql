use Turism
go
--procedura pentru stergerea tuturor inregistrarilor dintr-un tabel dat
create procedure delete_table(@table varchar(100))
as 
begin
	declare @querry varchar(100)='delete from ' +@table;
	exec (@querry);
end

go

--procedura pentru inserarea de valori in tabelul Rezervare
alter procedure insert_Rezervare(@nrRows int)
as
begin
	declare @i int =1;
	while @i<=@nrRows
	begin
		insert into Rezervare(ID_rezervare,Detalii,ID_agent,ID_client,ID_pachet,ID_hotel) 
		values (@i,'rezervare'+convert (varchar(100),@i),1,@i%10+1,1,1);
		print(@i%5+1);
		set @i=@i+1
	end
end
go

--procedura pentru inserarea de valori in tabelul Servicii
create procedure insert_Servicii(@nrRows int)
as
begin
	declare @i int =1;
	while @i<=@nrRows
	begin
		insert into Servicii(ID_servicii,Detalii) 
		values (@i,'serviciu'+convert (varchar(100),@i));
		set @i=@i+1
	end
end
go

--procedura pentru inserarea de valori in tabelul Rezervare_Servicii
alter procedure insert_Rezervare_Servicii(@nrRows int)
as
begin
	declare @i int =1;
	declare @nrInregistrari int=1;
	while @nrInregistrari<=@nrRows and exists(select ID_Rezervare from Rezervare where ID_rezervare=@i)
	begin
		declare @j int =1;
		while @nrInregistrari<=@nrRows and exists(select ID_Servicii from Servicii where ID_servicii=@j)
			begin
				declare @idRezervare int =(select ID_Rezervare from Rezervare where ID_rezervare=@i);
				declare @idServicii int=(select ID_Servicii from Servicii where ID_servicii=@j);
				insert into Rezervare_Servicii(ID_rezervare,ID_servicii) values (@idRezervare,@idServicii);
				set @j=@j+1;
				set @nrInregistrari=@nrInregistrari+1;
			end
		set @i=@i+1;
	end
end
go



--procedura test
alter procedure principalTest(@test varchar(100))
as begin
	--inserare timp start pentru test in TestRuns
	insert into TestRuns(StartAt) values (current_timestamp);

	declare @idTest int = (select TestID from Tests where Name=@test);
	declare @nrRows1 int =(select NoOfRows from TestTables TT where Position=1 and TestID=@idTest);
	declare @nrRows2 int =(select NoOfRows from TestTables TT where Position=2 and TestID=@idTest);
	declare @nrRows3 int =(select NoOfRows from TestTables TT where Position=3 and TestID=@idTest);
	declare @tabel1 varchar(100) = (select Name from Tables T 
						inner join TestTables TT on T.TableID=TT.TableID where TT.TestID=@idTest and TT.Position=1);
	declare @IDTabel1 varchar(100) = (select T.TableID from Tables T 
						inner join TestTables TT on T.TableID=TT.TableID where TT.TestID=@idTest and TT.Position=1);
	declare @tabel2 varchar(100) = (select Name from Tables T 
						inner join TestTables TT on T.TableID=TT.TableID where TT.TestID=@idTest and TT.Position=2);
	declare @IDTabel2 varchar(100) = (select T.TableID from Tables T 
						inner join TestTables TT on T.TableID=TT.TableID where TT.TestID=@idTest and TT.Position=2);
	declare @tabel3 varchar(100) = (select Name from Tables T 
						inner join TestTables TT on T.TableID=TT.TableID where TT.TestID=@idTest and TT.Position=3);
	declare @IDTabel3 varchar(100) = (select T.TableID from Tables T 
						inner join TestTables TT on T.TableID=TT.TableID where TT.TestID=@idTest and TT.Position=3);


	--stergem datele din tabelele asociate testului si apoi inseram date in tabele
	exec delete_table @tabel1;
	exec delete_table @tabel2;
	exec delete_table @tabel3;

	--inseram date in tabele
	declare @insert1 varchar(100)='insert_'+@tabel3;
	declare @insert2 varchar(100)='insert_'+@tabel2;
	declare @insert3 varchar(100)='insert_'+@tabel1;

	declare @start datetime=current_timestamp;
	exec @insert1 @nrRows1;
	insert into TestRunTables (TestRunID,TableID,StartAt,EndAt) 
		values((select max(TestRunID) from TestRuns),@IDTabel1,@start,current_timestamp);

	set @start=current_timestamp;
	exec @insert2 @nrRows2;
	insert into TestRunTables (TestRunID,TableID,StartAt,EndAt) 
		values((select max(TestRunID) from TestRuns),@IDTabel2,@start,current_timestamp);

	set @start=current_timestamp;
	exec @insert3 @nrRows3;
	insert into TestRunTables (TestRunID,TableID,StartAt,EndAt) 
		values((select max(TestRunID) from TestRuns),@IDTabel3,@start,current_timestamp);

	--parcurgem rezultatul select-ului din tabelul View cu un cursor
	declare @currentView varchar(50);
	declare cursorViews cursor fast_forward for
				select Name from Views V inner join TestViews TV on V.ViewID=TV.ViewID where TV.TestID=@idTest;
	open cursorViews;
	fetch next from cursorViews INTO @currentView;
	while @@FETCH_STATUS=0
	begin
		declare @querry varchar(100)='select * from '+@currentView;
		--timp start select pe currentView
		declare @startTestView datetime=current_timestamp;
		exec (@querry);
		--timp final select pe currentView
		declare @endTestView datetime=current_timestamp;
		--adaugare inregistrare in TestRunViews
		insert into TestRunViews (TestRunID,ViewID,StartAt,EndAt) 
				values ((select MAX(TestRunID) from TestRuns),(select ViewID from Views where Name=@currentView),@startTestView,@endTestView);
		fetch next from cursorViews into @currentView;
	end
	close cursorViews;
	deallocate cursorViews;
	--popularea tabelului TestRuns cu descrierea si timpul de final al testului
	update TestRuns set Description='delete, insert pe tabelele '+@tabel1+' '+@tabel2+' '+@tabel3+' si select pe view-uri',
					EndAt=current_timestamp where TestRunID=(select MAX(TestRunID) from TestRuns);
end


exec principalTest 'test1'
select * from TestRuns
select * from TestRunTables
select * from TestRunViews

delete from TestRuns
delete from TestRunTables
delete from TestRunViews
DBCC CHECKIDENT ('[TestRuns]', RESEED, 0);

select * from Rezervare
select * from Rezervare_Servicii
select * from Servicii
