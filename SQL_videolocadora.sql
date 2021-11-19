/*comentario em bloco*/
#PK = Primary Key
#FL = Foreign Key

#comentario em linha

#Permite criar um database
create database dbVideoLocadora20212;

#permite visualizar os databases exeistentes
show databases;

#permite apagar um database
drop database dbVideoLocadora20212;

#premite ativar o database que sera utilizado
use dbVideoLocadora20212;

#permite visualizar as tabelas existentes no database
show tables;

#premite visualizar a descrição (estutura) de uma tabela 
desc tblIdioma;

select * from tblFilme;
#Tabela de Classificação
create table tblClassificacao (
	idClassificacao int not null auto_increment,
    faixaEtaria varchar(6) not null,
    unique index(idClassificacao),
    primary key (idClassificacao)
);

/*Tabela de Filme*/
create table tblFilme(
	idFilme int not null auto_increment primary key,
    nome varchar(80) not null,
    dataLancamento date not null,
    sinopse text not null,
    duracao time not null,
    idClassificacao int not null,
    
    #nome do relacionamento
    constraint FK_Classificacao_Filme 
    #definição de quem será a FK nesta tabela
    foreign key(idClassificacao) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblClassificacao (idClassificacao),
    
    unique index (idFilme)
);


#Modificar um atributo da tabela
/*alter table tblClassificacao
	modify column faixaEtaria varchar(6) not null;
*/

/*Tabela de Genero*/
create table tblGenero(
	idGenero int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idGenero)
);
#Tabela de ligação entre genero e filme
create table tblFilmeGenero(
	idFilme_Genero int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeGenero
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idGenero int not null,
     #nome do relacionamento
    constraint FK_Genero_FilmeGenero 
    #definição de quem será a FK nesta tabela
    foreign key(idGenero) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblGenero (idGenero)
);




/*Tabela de Legenda*/
create table tblLegenda(
	idLegenda int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idLegenda)
);

#Tabela de ligação entre legenda e filme
create table tblFilmeLegenda(
	idFilme_Legenda int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeLegenda
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idLegenda int not null,
     #nome do relacionamento
    constraint FK_Legenda_FilmeLegenda
    #definição de quem será a FK nesta tabela
    foreign key(idLegenda) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblLegenda (idLegenda)
);

#tabela idioma
create table tblIdioma (
	idIdioma int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idIdioma)
);

#Tabela de ligação entre idioma e filme
create table tblFilmeIdioma(
	idFilme_Idioma int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeIdioma
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idIdioma int not null,
     #nome do relacionamento
    constraint FK_Idioma_FilmeIdioma 
    #definição de quem será a FK nesta tabela
    foreign key(idIdioma) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblIdioma (idIdioma)
);



#Alterar uma tabela para apagar uma constraint
alter table tblFilme drop foreign key FK_Classificacao_Filme;

#Alterar uma tabela para apagar um atributo
alter table tblFilme drop column idClassificacao;
#Alterar uma tabela para adicionar um novo atributo e adicionar esse atributo com uma constrantint
alter table tblFilme add column idClassificacao int not null, 
add constraint FK_Classificacao_Filme 
foreign key (idClassificacao) 
references tblClassificacao (idClassificacao);



/*Tabela de Sexo*/
create table tblSexo(
	idSexo int not null auto_increment primary key,
    nome varchar(15) not null,
    unique index(idSexo)
);

/*Tabela de Nacionalidade*/
create table tblNacionalidade(
	idNacionalidade int not null auto_increment primary key,
    nome varchar(50) not null,
    unique index(idNacionalidade)
);

#Tabela Ator
create table tblAtor(
	idAtor int not null auto_increment primary key,
    nome varchar(80) not null,
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    biografia text,
    
	idSexo int not null,
    constraint FK_Sexo_Ator foreign key (idSexo) references tblSexo(idSexo)
);


#Tabela de ligação entre Ator e Nacionalidade
create table tblAtorNacionalidade(
	idAtor_Nacionalidade int not null auto_increment primary key,
    idAtor int not null,
     #nome do relacionamento
    constraint FK_Ator_AtorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idAtor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblAtor(idAtor),
    idNacionalidade int not null,
     #nome do relacionamento
    constraint FK_Nacionalidade_AtorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idNacionalidade) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblNacionalidade (idNacionalidade)
);

#Tabela de ligação entre ator e filme
create table tblFilmeAtor(
	idFilme_Ator int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeAtor
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idAtor int not null,
     #nome do relacionamento
    constraint FK_Ator_FilmeAtor
    #definição de quem será a FK nesta tabela
    foreign key(idAtor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblAtor (idAtor)
);
show tables;

#Tabela Diretor
create table tblDiretor(
	idDiretor int not null auto_increment primary key,
    nome varchar(80) not null,
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    biografia text,
    
	idSexo int not null,
    constraint FK_Sexo_Diretor foreign key (idSexo) references tblSexo(idSexo)
);

#Tabela de ligação entre diretor e filme
create table tblFilmeDiretor(
	idFilme_Diretor int not null auto_increment primary key,
    idFilme int not null,
     #nome do relacionamento
    constraint FK_Filme_FilmeDiretor
    #definição de quem será a FK nesta tabela
    foreign key(idFilme) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblFilme(idFilme),
    idDiretor int not null,
     #nome do relacionamento
    constraint FK_Diretor_FilmeAtor
    #definição de quem será a FK nesta tabela
    foreign key(idDiretor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblDiretor (idDiretor)
);

#Tabela de ligação entre Diretor e Nacionalidade
create table tblDiretorNacionalidade(
	idDiretor_Nacionalidade int not null auto_increment primary key,
    idDiretor int not null,
     #nome do relacionamento
    constraint FK_Diretor_DiretorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idDiretor) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblDiretor(idDiretor),
    idNacionalidade int not null,
     #nome do relacionamento
    constraint FK_Nacionalidade_DiretorNacionalidade
    #definição de quem será a FK nesta tabela
    foreign key(idNacionalidade) 
    #Referencia da tabela que tem a PK para virar a FK
    references tblNacionalidade (idNacionalidade)
);


show tables;

insert into tblGenero (nome)values('Romantico'),
									('Comedia');
                                    
#Como deletar todos os dados da tabela
delete from tblAtor where idAtor=4;
	
insert into tblClassificacao (faixaEtaria)values('Livre'),
									('+10'),
                                    ('+12'),
                                    ('+14'),
                                    ('+16'),
                                    ('+18');

        
select * from tblGenero;

#MASCULINO E FEMININO NO SEXO
 insert into tblSexo (nome) values	('Masculino'),
									('Feminino');

#FILME PODEROSO CHEFÃO
insert into tblFilme (nome,
 dataLancamento,
 duracao,
 sinopse,
 idClassificacao) 
 values ('O SENHOR DOS ANÉIS - O RETORNO DO REI',
 '2003-12-25',
 '03:21:00',
'Sauron planeja um grande ataque a Minas Tirith, capital de Gondor, o que faz com que Gandalf (Ian McKellen) e Pippin (Billy Boyd) partam para o local na intenção de ajudar a resistência. Um exército é reunido por Theoden (Bernard Hill) em Rohan, em mais uma tentativa de deter as forças de Sauron. Enquanto isso Frodo (Elijah Wood), Sam (Sean Astin) e Gollum (Andy Serkins) seguem sua viagem rumo à Montanha da Perdição, para destruir o Um Anel.',
4);

#INSERT DO GENERO
insert into tblGenero(nome) values('Fantasia');
 #LIGAÇÃO DO FILME E GENERO
 select * from tblGenero;
  insert into tblFilmeGenero(idFilme, idGenero)
		values (5,14),
				(5,19);
                

                                    
#IDIOMA DO FILME
	select * from tblFilmeIdioma;
    insert into tblFilmeIdioma (idFilme,idIdioma) values(5,1),(5,2),(5,3);
    
#Legenda    
insert into tblLegenda(nome)values	('inglês'),
									('português'),
                                    ('espanhol');
                                    
insert into tblFilmeLegenda(idLegenda, idFilme)values(1,5),
													(2,5),
                                                    (3,5);
    
    
#DIRETOR DO FILME PODEROSO CHEFÃO
insert into tblNacionalidade (nome) values ('Neo-Zelandês');
select * from tblNacionalidade;
 insert into tblDiretor(nome, nomeArtistico,dataNascimento,dataFalecimento,biografia,idSexo)
 values('Peter Robert Jackson','PETER JACKSON','1961-10-31',null,
'- Fez os modelos de látex de "Trash - Náusea Total" no fogão da cozinha de sua mãe, forçando por diversas vezes sua família a comer salsichas no jantar devido a impossibilidade de utilizar o fogão da casa.',
1);
 select * from tblDiretor;
 #LIGAÇÃO DO FILME E DIRETOR
 insert tblFilmeDiretor(idFilme, idDiretor)values(5,5);
 select * from tblFilmeDiretor;
 delete from tblDiretorNacionalidade where idDiretor_Nacionalidade=2;
 #LIGAÇÃO DO NACIONALIDADE E DIRETOR
 insert tblDiretorNacionalidade(idDiretor, idNacionalidade) values(5,3);
select * from tblDiretorNacionalidade;


#atores
 insert into tblAtor(nome,nomeArtistico,dataNascimento,dataFalecimento,biografia,idSexo)
 values('Sean Patrick Astin','SEAN ASTIN','1971-02-25',null,
'- É formado na Universidade de Los Angeles em História',1);
 
 #LIGAÇÃO DE ATOR E NACIONALIDADE
insert into tblAtorNacionalidade(idAtor,idNacionalidade)values(11,1);
select * from tblFilmeAtor;
delete from tblFilmeAtor where idFilme_Ator=6;
#LIGAÇÃO DE ATOR E NACIONALIDADE
insert into tblFilmeAtor(idFilme, idAtor)values(5,11);


show databases;
 

#Alterar a escrita de uma atributo ou modificar o tipo de dados
alter table tblFilme change column dataLancamento data_Lancamento date not null;


desc tblFilme;


