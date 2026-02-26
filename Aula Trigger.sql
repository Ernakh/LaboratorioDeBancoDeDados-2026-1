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

create trigger primeiratrigger
on java
after delete 
as 
begin
	insert into log values ('exclusão', 
	'foi excluido um professor em java', GETDATE());
end
