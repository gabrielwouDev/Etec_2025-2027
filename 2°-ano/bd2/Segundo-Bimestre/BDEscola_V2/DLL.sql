CREATE DATABASE bdEscola2
GO
USE bdEscola2

CREATE TABLE tbAluno (
	idAluno				INT PRIMARY KEY IDENTITY(1,1),
	nomeAluno			VARCHAR(60),
	dataNascimento		SMALLDATETIME,
	rgAluno				VARCHAR(12),
	naturalidadeAluno	VARCHAR(2)
);

CREATE TABLE tbCurso (
	idCurso				INT PRIMARY KEY IDENTITY(1,1),
	nomeCurso			VARCHAR(20),
	cargahorariaCurso	INT,
	valorCurso			MONEY
);

CREATE TABLE tbTurma (
	idTurma				INT PRIMARY KEY IDENTITY(1,1),
	nomeTurma			VARCHAR(5),
	idCurso				INT FOREIGN KEY (idCurso) REFERENCES tbCurso (idCurso),
	horarioTurma		SMALLDATETIME
);

CREATE TABLE tbMatricula (
	idMatricula			INT PRIMARY KEY IDENTITY(1,1),
	dataMatricula		SMALLDATETIME,
	idAluno				INT FOREIGN KEY (idAluno) REFERENCES tbAluno (idAluno),
	idTurma				INT FOREIGN KEY (idTurma) REFERENCES tbTurma (idTurma)
);