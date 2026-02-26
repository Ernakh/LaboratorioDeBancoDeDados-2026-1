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


--primeira trigger POSTGRESQL
CREATE OR REPLACE FUNCTION primeiratrigger() RETURNS trigger as $BODY$
BEGIN
	insert into log values ('exclusão', 'foi excluido um professor da academia java', TIMESTAMP;
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;

CREATE  TRIGGER t_primeiratrigger BEFORE DELETE ON JAVA
FOR EACH ROW EXECUTE PROCEDURE primeiratrigger();


