

--Sql Server

create database temporal;

create table inventoriocarros
(
	id integer primary key identity,
	ano integer,
	marca varchar(20),
	cor varchar(15),
	kilometragem integer,
	emEstoque bit not null default 1,
	SysStartTime datetime2 generated always as row start not null,
	SysEndTime datetime2 generated always as row end not null,
	period for system_time (SysStartTime, SysEndTime)
)
with
(  SYSTEM_VERSIONING = ON   )


insert into inventoriocarros (ano, marca, cor, kilometragem)
values ('1985', 'Shelby Cobra', 'Azul', 719544);

select * from inventoriocarros
for system_time all
where id = 2

update inventoriocarros set ano = 2012 where id = 2

-- PostgreSql
create table inventorio_carros (
  id              bigint generated always as identity primary key,
  ano             integer,
  marca           varchar(40),
  modelo          varchar(40),
  cor             varchar(12),
  kilometragem    integer,
  em_estoque      boolean not null default true,
  sys_start_time  timestamptz not null default now()
);

create table inventorio_carros_hist (
  id              bigint not null,
  ano             integer,
  marca           varchar(40),
  modelo          varchar(40),
  cor             varchar(12),
  kilometragem    integer,
  em_estoque      boolean not null,
  sys_start_time  timestamptz not null,
  sys_end_time    timestamptz not null,
  primary key (id, sys_start_time)
);

create index on inventorio_carros_hist (id, sys_end_time);

-- carimbo de tempo alvo
-- exemplo: '2026-03-01 10:00:00-03'

select *
from inventorio_carros
where id = 10
  and sys_start_time <= $1

union all

select *
from inventorio_carros_hist
where id = 10
  and sys_start_time <= $1
  and sys_end_time   >  $1
limit 1;
