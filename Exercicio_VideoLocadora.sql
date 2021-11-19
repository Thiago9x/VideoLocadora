#1
select concat(sinopse,'Saiba Mais...') as SinopseFilme from tblFilme;

#2
select insert(sinopse,locate(' ', sinopse),0,' <b>(videolocadora Acme)</b> ' ) as NomeLocadora from tblFilme;

#3
select insert(sinopse,locate('família', sinopse),7,' <strong>família</strong> ' ) as Destaque from tblFilme;

#4
select insert(sinopse,locate('(Marlon Brando)', sinopse),16,' (Marlon Brando) falecido em 2004 ' ) as Destaque from tblFilme;

#5
select concat(substr(sinopse,1,20), ' Saiba mais...') from tblFilme;