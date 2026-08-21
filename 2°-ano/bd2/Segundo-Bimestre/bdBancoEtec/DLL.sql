CREATE DATABASE bdBancoEtec
GO 
USE bdBancoEtec

CREATE TABLE tbCorrentista(
	codCorrentista			INT PRIMARY KEY IDENTITY(1,1),
	nomeCorrentista			VARCHAR(30),
	DtNascCorrentista		DATETIME,
	cpfCorrentista			VARCHAR(15),
	rgCorrentista			VARCHAR(15)
);
drop table tbCorrentista
drop table tbContaCorrente
drop table tbContaPoupanca

CREATE TABLE tbContaCorrente(
	codContaCorrente		INT PRIMARY KEY IDENTITY(1,1),
	numeroAgenciaCC			INT,
	numeroCC				VARCHAR(7),
	digitoCC				INT,
	senhaNumericaCC			INT,
	senhaAlfaNumericaCC		VARCHAR(6),
	saldoCC					MONEY,
	dataAberturaCC			DATETIME,
	codCorrentista			INT FOREIGN KEY (codCorrentista) REFERENCES tbCorrentista (codcorrentista),
);
/**/

CREATE TABLE tbContaPoupanca(
	codContaPoupanca		INT PRIMARY KEY IDENTITY(1,1),
	numeroAgenciaCP			INT,
	numeroCP				INT,
	digitoCP				INT,
	saldoCP					MONEY,
	dataAberturaCP			DATETIME,
	codCorrentista			INT FOREIGN KEY (codCorrentista) REFERENCES tbCorrentista (codcorrentista),
);

