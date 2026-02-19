create database dinossauros;

create table grupos
(
id integer not null primary key identity,
nome varchar(40) not null
);

create table descobridores 
(
id integer not null primary key identity,
nome varchar(100) not null
);

create table regioes
(
id integer not null primary key identity,
nome varchar(150) not null unique
);

create table eras 
(
id integer not null primary key identity,
nome varchar(35) not null unique,
inicio integer not null,
fim integer not null
)

create table dinossauros(
id integer not null primary key identity,
nome varchar(150) not null unique,
toneladas integer,inicio integer,
fim integer,fk_grupo integer,
fk_era integer,fk_descobridor integer,
fk_regiao integer,
foreign key (fk_grupo) references grupos (id),
foreign key (fk_era) references eras(id),
foreign key (fk_descobridor) references descobridores (id),
foreign key (fk_regiao) references regioes(id)
)




create database dinossauros;

create table grupos
(
id integer not null primary key identity,
nome varchar(40) not null
);

create table descobridores 
(
id integer not null primary key identity,
nome varchar(100) not null
);

create table regioes
(
id integer not null primary key identity,
nome varchar(150) not null unique
);

create table eras 
(
id integer not null primary key identity,
nome varchar(35) not null unique,
inicio integer not null,
fim integer not null
)

create table dinossauros(
id integer not null primary key identity,
nome varchar(150) not null unique,
toneladas integer,inicio integer,
fim integer,fk_grupo integer,
fk_era integer,fk_descobridor integer,
fk_regiao integer,
foreign key (fk_grupo) references grupos (id),
foreign key (fk_era) references eras(id),
foreign key (fk_descobridor) references descobridores (id),
foreign key (fk_regiao) references regioes(id)
)


insert into grupos values ('Anquilossauros')
insert into grupos values ('Ceratopsídeos')
insert into grupos values ('Estegossauros');
insert into grupos values ('Terápodes');

insert into eras values ('Cretáceo', 145, 65)
insert into eras values ('Jurássico', 201, 145)

insert into descobridores values ('Maryanska');
insert into descobridores values ('John Bell Hatcher');
insert into descobridores values ('Cientistas Alemães');
insert into descobridores values ('Museu Americano de História Natural');
insert into descobridores values ('Othniel Charles Marsh');
insert into descobridores values ('Barn Brown');

insert into regioes values ('Mongólia');
insert into regioes values ('Canadá');
insert into regioes values ('China');

insert into dinossauros 
values ('Saichania', 2,145,66, 1, 2,1,1)

select * from grupos
select * from regioes
select * from descobridores
select * from eras
select * from dinossauros





select 
dinossauros.id, dinossauros.nome, dinossauros.toneladas,
dinossauros.inicio, dinossauros.fim,
grupos.nome as Grupo, eras.nome as Era,
descobridores.nome as Descobridor, 
regioes.nome as Região
from dinossauros
join grupos on dinossauros.fk_grupo = grupos.id
join eras on eras.id = dinossauros.fk_era
join descobridores on descobridores.id = dinossauros.fk_descobridor
join regioes on regioes.id = dinossauros.fk_regiao
order by dinossauros.nome


