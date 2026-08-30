/*
1. Criar uma stored procedure “Busca_Aluno” que receba o código do
aluno e retorne seu nome e data de nascimento.
*/

CREATE PROCEDURE spBusca_Aluno 
	@idAluno INT
AS
	SELECT nomeAluno, dataNascimento FROM  tbAluno WHERE idAluno LIKE @idAluno

EXEC spBusca_Aluno 
	3

/*
2. Criar uma stored procedure “Insere_Aluno” que insira um registro na
tabela de Alunos, verificando pelo cpf se o aluno já existe ou não
*/

CREATE PROCEDURE spInsere_Aluno
	@nomeAluno			VARCHAR(60),
	@dataNascimento		SMALLDATETIME,
	@rgAluno			VARCHAR(12),
	@naturalidadeAluno	VARCHAR(2)
AS
	DECLARE @idAluno INT
	IF EXISTS(SELECT @idAluno FROM tbAluno WHERE rgAluno LIKE @rgAluno)
	BEGIN 
		PRINT ('Impossivel cadastrar aluno '+@rgAluno+'rg ja existe!')
	END 
	ELSE
	BEGIN 
		INSERT INTO tbAluno (nomeAluno,dataNascimento,rgAluno,naturalidadeAluno)
		VALUES
		(@nomeAluno,@dataNascimento,@rgAluno,@naturalidadeAluno)	
	END

EXEC spInsere_Aluno 
 'Paulo Santos',
 '2000-10-03 00:00:00',
 '82.292.122-0',
 'SP'

EXEC spInsere_Aluno 
 'Gabriel Penha',
 '2000-10-03 00:00:00',
 '67.282.122-0',
 'SP'

 /*
 3. Criar uma stored procedure “Aumenta_Preco” que, dados o nome do
curso e um percentual, aumente o valor do curso com a porcentagem 
informada.
 */

 CREATE PROCEDURE spAumenta_Preco
	@nomeCurso VARCHAR(15),
	@percentual INT
AS
	SELECT nomeCurso, (valorCurso*((@percentual*0.01)+1)) 'Valor aumentado' FROM tbCurso
		WHERE nomeCurso LIKE @nomeCurso

EXEC spAumenta_Preco
	'Libras',
	15

/*
4. Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma
exiba todas as informações dela.
*/

CREATE PROCEDURE spExibe_Turma
	@nomeTurma VARCHAR(3)
AS
	SELECT * FROM tbTurma
		WHERE nomeTurma LIKE @nomeTurma


EXEC spExibe_Turma
	'1RA'

/*
5. Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome
da turma exiba os seus alunos.
*/
CREATE PROCEDURE spExibe_AlunosdaTurma
	@nomeTurma VARCHAR(3)
AS
	SELECT nomeTurma 'Turma', nomeAluno 'Aluno' FROM tbMatricula
		INNER JOIN tbAluno ON tbMatricula.idAluno = tbAluno.idAluno
			INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
				WHERE nomeTurma LIKE @nomeTurma

EXEC spExibe_AlunosdaTurma
	'1JA'