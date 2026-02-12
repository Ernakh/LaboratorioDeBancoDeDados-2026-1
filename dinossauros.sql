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
