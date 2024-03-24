--Criação do Banco de Dados
create database diarista;

--Criação da Tabela casa
create table casa(
	cas_cd_id serial,
	cas_tx_nome varchar(50),
	cas_tx_endereco varchar(150),
	primary key (cas_cd_id)
);

--Criação da Tabela tarefa
create table tarefa(
	tar_cd_id serial,
	tar_tx_nometar varchar(100),
	tar_tx_descricao varchar(150),
	tar_dt_dataconclusao date,
	fk_cas_cd_id integer,
	primary key (tar_cd_id),
	foreign key (fk_cas_cd_id) references casa(cas_cd_id)
);

--Inclusão dos Valores da Tabela casa
insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)
values ('1', 'Casa da Rafaela Costa', 'Rua do João Gome');

insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)
values ('2', 'Casa Muito Engraçada Não Tinha Teto Não Tinha Nada', 'Rua dos Bobos Numero Zero');

insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)
values ('3', 'Casa da Dua Lipa', 'Rua das Divas Pop');

insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)
values ('4', 'Casa da Rafinha', 'Rua dos Nerds');

insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)
values ('5', 'Casa do Mario', 'Rua Atras do Armario');


--Inclusão dos Valores da Tabela tarefa
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('1', 'Limpeza da Casa', 'Limpar Quarto, Banheiro e Varanda', '2024-03-27', '5');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('2', 'Compras de Supermercado', 'Comprar itens da lista', '2024-04-08', '1');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('3', 'Consertar o Encamento e Limpar o Quarto', 'Chamar encanador e limpar o quarto incluindo as luminarias', '2024-07-25', '2');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('4', 'Cortar Grama', 'Limpar o Jardim e Aparar a Grama', '2024-04-21', '3');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('5', 'Organização do Armário', 'Arrumar as roupas e sapatos separando nos devidos compartimentos', '2024-06-06', '4');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('6', 'Lavar a Louça', 'Lavar, Secar e Guardar a louça', '2024-03-30', '2');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('7', 'Lavar Roupa', 'Lavar, Secar, Passar e Guardar as roupas', '2024-04-15', '3');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('8', 'Aspirar a Casa', 'Passar Aspirador de Pó no Quarto, Sala e no Cinema', '2024-04-18', '3');

insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,
fk_cas_cd_id)
values ('9', 'Limpar Atrás do Armário', 'Varrer e Passar Pano Atrás do Armário e CUIDADO!', '2024-05-19', '5');


--Consulta para mostrar quantidade de tarefas por casa na ordem decrescente (de quem tem mais para quem tem menos)
select fk_cas_cd_id, count (fk_cas_cd_id) as "qtd_de_tarefa"
from tarefa
group by fk_cas_cd_id
order by qtd_de_tarefa desc;

--Consulta para mostrar quais tarefas tem a casa de código (cas_cod_id) = 3 (no caso, Casa da Dua Lipa)
select *
from tarefa
where fk_cas_cd_id = 3

--Consulta para mostrar quais tarefas tem a casa de código (cas_cod_id) = 5 (no caso, Casa do Mario)
select *
from tarefa
where fk_cas_cd_id = 5

--Consulta para mostrar em ordem alfabética o nome da casa e da(s) tarefa(s) que a pertence
select cas_tx_nome, tar_tx_nometar 
from casa
inner join tarefa on casa.cas_cd_id = tarefa.fk_cas_cd_id
order by cas_tx_nome asc;