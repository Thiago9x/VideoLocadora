Select * from tblFilme;

#concat() - permite concatenar strings
select concat('O nome do filme é: ', nome) as nomeFilme,nome,
	concat('Filme: ',nome, '- duração:',duracao)as nomeFilme2 from tblFilme;
    
    #concat_ws() - permite concatenar, utilizando um separador como padrão
    select concat_ws(' - ',nome,duracao, dataLancamento,sinopse) as nomeFilmePersonalizado from tblFilme;
    
    #locate() - retorna a posição inicial da palavra chave que foi solicitado 
    select locate('morte',sinopse)as posicaoPalavra from tblFilme;
    
    #reverse() - Permite inverter a escrita de um conteudo
    select reverse (nome) from tblFilme;
    
    #lenght() - Retorna a quantidade de caracteris de um conteudo
    select length(nome) as qtdeLetras from tblFilme;
    
    #insert() - permite insetrir uma string dentro de um conteudo
    #1ºParametro: onde vai tentar colocar a palvra(atributo do banco)
    #2ºParametro: em qual posição ela vai entrar(posição que sera inserida)
    #3ºParametro: o que ela vai substituir(qtde de caracteris de devera apagar caso queira substituir uma palavra ou se não quiser substituir colocar o "0")
    #4ºParametro: o que voce vai colocar la(a nova string que será inserida)
    
    select insert(sinopse, 1, 0 , 'Filme ')as sinopseFilmes from tblFilme;
    
    #substr() - permite cortar um pedaço de uma string 
    select substr('animação',1,5) as resultado;
    select substr('animação',5,4) as resultado;
    select concat(substr('superação',1,5), '-',substr('superação',6,4) ) as resultado;