/*
1.Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga
horária e o valor do curso de todos os cursos que tenha preço inferior ao
preço médio.  */create view vwPreco_Baixo as
	select idCurso 'Código', nomeCurso 'Curso', cargahorariaCurso 'Carga horária', valorCurso 'Preço'from tbCurso
		where valorCurso < (select AVG(valorCurso) from tbCurso)
		
select * from vwPreco_Baixo
	order by 'Código'

/* 2. */
