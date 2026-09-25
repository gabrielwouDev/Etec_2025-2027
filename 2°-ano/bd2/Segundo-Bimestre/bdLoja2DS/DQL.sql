CREATE DATABASE bdLoja2DS
USE bdLoja2DS

CREATE TABLE tbCliente(
	codCliente				INT PRIMARY KEY IDENTITY(1,1),
	nomeCliente				VARCHAR(50),
	cpfCliente				VARCHAR(14),
	emailCliente			VARCHAR(50),
	sexoCliente				VARCHAR(20),
	dataNascimentoCliente	DATE
);

CREATE TABLE tbFabricante(
	codFabricante		INT PRIMARY KEY IDENTITY(1,1),
	nomeFabricante		VARCHAR(50),
);

CREATE TABLE tbFornecedor(
	codFornecedor		INT PRIMARY KEY IDENTITY(1,1),
	nomeFornecedor		VARCHAR(50),
	contatoFornecedor	VARCHAR(30)
);

CREATE TABLE tbProduto(
	codProduto			INT PRIMARY KEY IDENTITY(1,1),
	descricaoProduto	VARCHAR(50),
	valorProduto		MONEY,
	quantidadeProduto	INT,
	codFabricante
);
	


