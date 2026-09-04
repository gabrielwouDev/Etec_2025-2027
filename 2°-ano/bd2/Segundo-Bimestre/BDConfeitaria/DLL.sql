CREATE DATABASE bdConfeitaria
GO
USE bdConfeitaria

CREATE TABLE tbCliente(
	codCliente		INT PRIMARY KEY IDENTITY(1,1),
	nomeCliente		VARCHAR(50),
	dtNascCliente	DATE,
	ruaCliente		VARCHAR(50),
	numCasaCliente	INT,
	cepCliente		VARCHAR(9),
	bairroCliente	VARCHAR(35),
	cidadeCliente	VARCHAR(30),
	estadoCliente	VARCHAR(30),
	cpfCliente		VARCHAR(14),
	sexoCliente		CHAR,
);


CREATE TABLE tbCategoriaProduto(
	codCategoriaProduto		INT PRIMARY KEY IDENTITY(1,1),
	nomeCategoriaProduto	VARCHAR(20),
);

CREATE TABLE tbEncomenda (
	codEncomenda			INT PRIMARY KEY IDENTITY(1,1),
	dataEncomenda			DATE,
	codCliente				INT FOREIGN KEY (codCliente) REFERENCES tbCliente (codCliente),
	valorTotalEncomenda		MONEY,
	dataEntregaEncomenda	DATE
);

CREATE TABLE tbProduto (
	codProduto			INT PRIMARY KEY IDENTITY(1,1),
	nomeProduto			VARCHAR(30),
	precoKiloProduto	MONEY,
	codCategoriaProduto INT FOREIGN KEY (codCategoriaProduto) REFERENCES tbCategoriaProduto (codCategoriaProduto)
);

CREATE TABLE tbItensEncomenda (
	codItensEncomenda	INT PRIMARY KEY IDENTITY(1,1),
	codEncomenda		INT FOREIGN KEY (codEncomenda) REFERENCES  tbEncomenda (codEncomenda),
	codProduto			INT FOREIGN KEY (codProduto) REFERENCES tbProduto (codProduto),
	quantidadeKilos		FLOAT,
	subTotal			FLOAT,
);