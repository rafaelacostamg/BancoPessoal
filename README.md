<!DOCTYPE html>
<html

<body>
  <h1 align="center">Banco de Dados - Diarista</h1>
  <div align="center">
    <img src="TrabalhoFinal-Individual/Imagens-Para-O-README/WhatsApp Image 2024-03-24 at 20.31.34.jpeg"alt="Banco de Dados Diarista">
  </div>
</br>
  <p> Bem-vindo(a) ao repositório do Projeto Individual de Conclusão da Disciplina "Banco de Dados" na Residência de Software 2024.1 do SERRATEC. Este projeto consiste na criação de um Banco de Dados para um relacionamento Casa-Tarefa com base nas regras de negócio e requisitos especificados neste documento.</p>

  <h2>Descrição</h2>
O banco foi criado imaginando um aplicativo de gerenciamento de tarefas domésticas de um(a) diarista, onde cada casa pode ter várias tarefas atribuídas.

  <h2>Requisitos</h2>
  <h3>Regras</h3>
  <li>Uma casa pode ter várias tarefas.</li>
  <li>Uma tarefa pode pertencer apenas a uma casa, afim de ter especificações de uma casa específica</li>
  <li>Cada casa deve ter um nome (uma referência) e um endereço.</li>
  <li>Cada tarefa deve ter um nome, uma descrição e uma data de conclusão prevista.</li>

  <h3>Consultas</h3>
  <h4>O Script no final deste documento possui algums exemplos de consultas como:</h4>
  <li>Mostrar quantidade de tarefas por casa na ordem decrescente</li>
  <li>Mostrar quais tarefas tem um casa de acordo com o código dela</li>
  <li>Mostrar em ordem alfabética o nome da casa e da(s) tarefa(s) que a pertence</li>

  <h3>Modelo Conceitual</h3>
 <div align="center">
   <img src="TrabalhoFinal-Individual/Diagramas/Modelo Conceitual.png" width="700px" />
 </div>
 <div align="center">
   Entidades e relacionamento com cardinalidade mínima e máxima. 
 </div>
 <div align="center">
   Casa possui de nenhuma até muitas tarefas, enquanto tarefa possui uma única casa. 
 </div>
 
 <h3>Modelo Lógico</h3>
 <div align="center">
   <img src="TrabalhoFinal-Individual/Diagramas/Modelo Lógico.png" width="700px" />
 </div>
 <div align="center">
   Declarações das tabelas com as colunas, incluindo as chaves primárias e estrageiras 
 </div>
 <div align="center">
   Cardinalidade de 1 para 0,N.
 </div>
 <h3>Script</h3>
 <li>--Criação do Banco de Dados<br />
create database diarista;</li>
<br />
<li>--Criação da Tabela casa<br />
create table casa(<br />
	cas_cd_id serial,<br />
	cas_tx_nome varchar(50),<br />
	cas_tx_endereco varchar(150),<br />
	primary key (cas_cd_id)<br />
);</li>
<br />
<li>--Criação da Tabela tarefa<br />
create table tarefa(<br />
	tar_cd_id serial,<br />
	tar_tx_nometar varchar(100),<br />
	tar_tx_descricao varchar(150),<br />
	tar_dt_dataconclusao date,<br />
	fk_cas_cd_id integer,<br />
	primary key (tar_cd_id),<br />
	foreign key (fk_cas_cd_id) references casa(cas_cd_id)<br />
);</li>
<br />
<li>--Inclusão dos Valores da Tabela casa<br />
insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)<br />
values ('1', 'Casa da Rafaela Costa', 'Rua do João Gome');<br />
<br />
insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)<br />
values ('2', 'Casa Muito Engraçada Não Tinha Teto Não Tinha Nada', 'Rua dos Bobos Numero Zero');<br />
<br />
insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)<br />
values ('3', 'Casa da Dua Lipa', 'Rua das Divas Pop');<br />
<br />
insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)<br />
values ('4', 'Casa da Rafinha', 'Rua dos Nerds');<br />
<br />
insert into casa (cas_cd_id, cas_tx_nome, cas_tx_endereco)<br />
values ('5', 'Casa do Mario', 'Rua Atras do Armario');</li>
<br />
<li>--Inclusão dos Valores da Tabela tarefa<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('1', 'Limpeza da Casa', 'Limpar Quarto, Banheiro e Varanda', '2024-03-27', '5');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('2', 'Compras de Supermercado', 'Comprar itens da lista', '2024-04-08', '1');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('3', 'Consertar o Encamento e Limpar o Quarto', 'Chamar encanador e limpar o quarto incluindo as luminarias', '2024-07-25', '2');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('4', 'Cortar Grama', 'Limpar o Jardim e Aparar a Grama', '2024-04-21', '3');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('5', 'Organização do Armário', 'Arrumar as roupas e sapatos separando nos devidos compartimentos', '2024-06-06', '4');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('6', 'Lavar a Louça', 'Lavar, Secar e Guardar a louça', '2024-03-30', '2');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao, <br />
fk_cas_cd_id)<br />
values ('7', 'Lavar Roupa', 'Lavar, Secar, Passar e Guardar as roupas', '2024-04-15', '3');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('8', 'Aspirar a Casa', 'Passar Aspirador de Pó no Quarto, Sala e no Cinema', '2024-04-18', '3');<br />
<br />
insert into tarefa (tar_cd_id, tar_tx_nometar, tar_tx_descricao, tar_dt_dataconclusao,<br />
fk_cas_cd_id)<br />
values ('9', 'Limpar Atrás do Armário', 'Varrer e Passar Pano Atrás do Armário e CUIDADO!', '2024-05-19', '5');</li>
<br />
<li>--Consulta para mostrar quantidade de tarefas por casa na ordem decrescente (de quem tem mais para quem tem menos)<br />
select fk_cas_cd_id, count (fk_cas_cd_id) as "qtd_de_tarefa"<br />
from tarefa<br />
group by fk_cas_cd_id<br />
order by qtd_de_tarefa desc;</li>
<br />
<li>--Consulta para mostrar quais tarefas tem a casa de código (cas_cod_id) = 3 (no caso, Casa da Dua Lipa)<br />
select *<br />
from tarefa<br />
where fk_cas_cd_id = 3</li>
<br />
<li>--Consulta para mostrar quais tarefas tem a casa de código (cas_cod_id) = 5 (no caso, Casa do Mario)<br />
select *<br />
from tarefa<br />
where fk_cas_cd_id = 5</li>
<br />
<li>--Consulta para mostrar em ordem alfabética o nome da casa e da(s) tarefa(s) que a pertence<br />
select cas_tx_nome, tar_tx_nometar <br />
from casa<br />
inner join tarefa on casa.cas_cd_id = tarefa.fk_cas_cd_id<br />
order by cas_tx_nome asc;</li>

  <h2>Tecnologias Utilizadas</h2>
 <div>
   <img src="TrabalhoFinal-Individual/Imagens-Para-O-README/DBeaver_logo.svg.png" height="40" width="40"> <a href="https://dbeaver.io/">DBeaver</a> 
 </div>
 <br />
 <div>
   <img src="TrabalhoFinal-Individual/Imagens-Para-O-README/Diagrams.net_Logo.png.png" height="40" width="40"> <a href="https://app.diagrams.net/">draw.io</a> 
 </div>
 <br />
 <div>
   <img src="TrabalhoFinal-Individual/Imagens-Para-O-README/276467639-ffb0b7a3-afec-44e5-a5bc-6075fe585e0d.png" height="40" width="40"> <a href="https://www.postgresql.org">PostgreSQL</a>
 </div>

<h2>Autora</h2>  
<div align="center">
<img src="TrabalhoFinal-Individual/Imagens-Para-O-README/sdk-img-github.png" width="400"> <br /><a href="https://github.com/rafaelacostamg">Rafaela Costa</a> 
  </div>
