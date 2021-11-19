#update
update tblFilme set nome = 'Rei Leão' where idFilme=2;

#delete
delete from tblFilme where idFilme=3;

#select
/*	select(coloca-se os campos que serão exibidos no filtro)
	from (colocas-se as tabelas que serão utilizadas no filtro)
	where (coloca-se o crit´rio de busca que será aplicado na consulta)
*/
#registros da tabela
#(*) significa todos os campos
select * from tblFilme;

#Select especificando atributos
select nome,sinopse from tblFilme;

#Colocando o nome da tabela com o campo
select tblFilme.nome, tblFilme.sinopse from tblFilme;

#colocando o nome da tabela para trazer todos os campos
select tblFilme.* from tblFilme;

#as = permite criar um nome virtual a uma coluna ou uma tabela
select nome as nomeFilme,sinopse,duracao from tblFilme;

select * from tblFilme where nome = 'O Rei Leão';

#like - funciona como se fosse "="
select * from tblFilme where nome like 'O Rei Leão';

#like % no inicio - localizamos todos os itens que temrinam com aquela palavra
select * from tblFilme where nome like '%Leão';

#like % no final - localizamos todos os itens que terminam com aquela palavra
select * from tblFilme where nome like 'O%';

#like % % no comço e no final- localizamos todos os intens que tenham a palavra em qualquer parte do campo
select * from tblFilme where nome like '%morte%' or sinopse like '%morte%';

select * from tblFilme where (nome like'%morte%' or sinopse like'%morte%') and dataLancamento >= '1980-01-01';

/*Operadores logicos 
	OR
	AND
    NOT
    ()
    PRIORIDADES DE SEQUENCIA:(),NOT,AND,OR
*/
/*Operadores de Comparação
	=
    like
    >
    <
    <=
    >=
    <> diferente*/
    
    #Modifica apenas a estrutura do atributo
alter table tblFilme 	add column qtde int,
						add column valor float;

update tblFilme set qtde = 6,
					valor = '9.50'
				where idFilme = 4;

select * from tblFilme where qtde >5 and nome like '%rei%';

#exemplo de como usar operadores logicos diferentes no mesmo criterio
select * from tblFilme where (qtde = 1 or qtde = 5 or qtde = 6 or qtde = 7) and nome like '%rei%';

#in() - permite fazer uma busca de varios valores, subtituindo a utilização do or(como o exmplo acima )
#not in () - inverte o resultado da busca
select nome, qtde from tblFilme where qtde in (1,5,6,7) and nome like '%rei%';

#order by atributo asc - permite ordenar de forma crescente
#order by atributo desc - permite ordenar de forma decrescente
select * from tblFilme order by nome asc, duracao desc;

#limit permite limitar a qtde de itens no resultado do select
select * from tblFilme order by idFilme asc limit 2;

#count- conta a quantidade de itens levando como referência apenas valores não nulos
select count(nome), count(nomeArtistico) from tblAtor;
select count(*) as qtdeator from tblAtor;

#min() - retorna o menor valor de uma coluna 
#max() - retorna o maior valor  de uma coluna

select min(qtde) as qtdeMinima, nome from tblFilme;

select max(qtde) as qtdeMaxima from tblFilme;

#sum- soma todos os dados da coluna qtde de filmes
select sum(qtde) as totalFilmes from tblFilme;
