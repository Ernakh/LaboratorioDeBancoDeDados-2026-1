create table java
(
	professor varchar(20) null
);

create table dotnet 
(
	professor varchar(20) null
);

insert into java values ('Fabrício'), 
('Dimas'), ('Glauco')

insert into dotnet values ('Fabrício'), ('Ricardo')

create table log 
(
	id integer not null primary key identity,
	acao varchar(10) not null,
	descricao varchar(100),
	quando datetime not null
);

--postgresql
CREATE OR REPLACE FUNCTION primeiratrigger() 
				RETURNS trigger as $BODY$
BEGIN
	insert into log values ('exclusão', 
	'foi excluido um professor da academia java', 
	TIMESTAMP);
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;
CREATE  TRIGGER t_primeiratrigger BEFORE DELETE ON JAVA
FOR EACH ROW EXECUTE PROCEDURE primeiratrigger();


create trigger primeiratrigger
on java
after delete 
as 
begin
	insert into log values ('exclusão', 
	'foi excluido um professor em java', GETDATE());
end
insert into java values ('Helder');
delete from java where professor = 'Helder'
select * from java
select * from log 

create trigger segundatrigger
on java
after insert 
as begin
	insert into log values ('inserção', 
		'foi incluido um professor em java', GETDATE());
		PRINT('Dados inseridos!');
end

select * from log

create trigger terceiratrigger
on dotnet 
after insert
as begin
	declare @contagem int
	select @contagem = (select count(professor) from dotnet)
	PRINT('Quantidade de registros:'
		+ CONVERT(varchar(10), @contagem))
	
	IF @contagem < 3
	begin
		insert into log values ('inserção',
			'novo professor na academia dotnet', getdate());
			print('Dados inseridos com sucesso');
	end
	ELSE
	begin
		ROLLBACK;
		insert into log values ('inserção',
		'tentativa de inserção de professor em dotnet',
		getdate());
		RAISERROR('INVALIDO', 14,1);
	end
end

select * from log
insert into dotnet values ('Professor 1');



create trigger quartatrigger
on dotnet
after update
as  begin
	declare @old varchar(10)
	declare @new varchar(10)

	select @old = (select deleted.professor from deleted)
	select @new = (select inserted.professor from inserted)

	IF (ROWCOUNT_BIG() = 0)
		return;

	IF @old = @new
	begin
		RAISERROR('Sem alterações!!', 14,1);
		rollback transaction;
		insert into log values ('Alteração', 
		'tentativa de update em dotnet', getdate());
	end
	ELSE
	begin
		insert into log values ('Alteração',
		'Alteração do nome do professor, de ' + @old + 
		' para ' + @new + ' em dotnet', getdate());
	end
end
