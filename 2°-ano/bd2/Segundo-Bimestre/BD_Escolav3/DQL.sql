
/*
1.Crie uma visão Preço_Baixo que exiba o cédigo, nome do curso, carga
horária e o valor do curso de todos os cursos que tenha preço inferior ao
preço médio.
  */

CREATE VIEW vwPreco_Baixo AS
	SELECT idCurso 'Código', nomeCurso 'Curso', cargahorariaCurso 'Carga horária', valorCurso 'Preço' FROM tbCurso
		WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso);
		
SELECT * FROM vwPreco_Baixo
	ORDER BY 'Código';

/* 2.Usando a visão Preço_Baixo, mostre todos os cursos ordenados por carga
horária. */
SELECT * FROM vwPreco_Baixo
	ORDER BY 'Carga horária' ;

SELECT * FROM vwPreco_Baixo
	ORDER BY 'Carga horária' DESC;

/* 3. Crie uma visão Alunos_Turma que exiba o curso e a quantidade de alunos
por turma. */
CREATE VIEW vwAlunos_Turma AS
	SELECT nomeCurso 'Curso', quantidadeAlunos 'Capacidade de alunos' FROM tbTurma
		INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso;
        
SELECT*FROM vwAlunos_Turma
	ORDER BY 'Curso'

/* 4. Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos. */
SELECT * FROM vwAlunos_Turma 
	WHERE [Capacidade de alunos] = (SELECT MAX([Capacidade de alunos]) FROM vwAlunos_Turma);
		
	
/* 5. Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.*/

CREATE VIEW vwTurma_Curso AS 
	SELECT nomeCurso 'Curso', quantidadeTurmas 'Número De Turmas' FROM tbCurso;

SELECT * FROM vwTurma_Curso 
	ORDER BY 'Curso';
    
/*6. Usando a visão “Turma_Curso exiba o curso com menor número de turmas. */

SELECT * FROM vwTurma_Curso 
	WHERE [Curso] = (SELECT MIN([Curso]) FROM vwTurma_Curso);

		
    
    