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
 'Paulo Santos',
 '2000-10-03 00:00:00',
 '82.292.122-0',
 'SP'