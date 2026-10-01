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
	codFabricante		INT FOREIGN KEY (codFabricante) REFERENCES tbFabricante (codFabricante),
	codFornecedor		INT FOREIGN KEY (codFornecedor) REFERENCES tbFornecedor (codFornecedor)
);
	
CREATE TABLE tbSaidaProduto(
	codSaidaProduto				INT PRIMARY KEY IDENTITY(1,1),
	dataSaidaProduto			DATE,
	codProduto					INT FOREIGN KEY (codProduto) REFERENCES tbProduto (codProduto),
	quantidadeSaidaProduto		INT
);

CREATE TABLE tbEntradaProduto(
	codEntrada					INT PRIMARY KEY IDENTITY(1,1),
	dataEntradaProduto			DATE,
	codProduto					INT FOREIGN KEY (codProduto) REFERENCES tbProduto (codProduto),
	quantidadeEntradaProduto	INT
);

CREATE TABLE tbVenda(
	codVenda			INT PRIMARY KEY IDENTITY(1,1),
	dataVenda			DATE,
	valorTotalVenda		MONEY,
	codCliente			INT FOREIGN KEY (codCliente) REFERENCES tbCliente (codCliente),
);

CREATE TABLE tbItensVenda(
	codItensVenda			INT PRIMARY KEY IDENTITY(1,1),
	codVenda				INT FOREIGN KEY (codVenda) REFERENCES tbVenda (codVenda),
	codProduto				INT FOREIGN KEY (codProduto) REFERENCES tbProduto (codProduto),
	quantidadeItensVenda	INT,
	subTotalItensVenda		MONEY
);

DROP TABLE 
DROP TABLE tbProduto
DROP TABLE tbSaidaProduto
DROP TABLE tbEntradaProduto
DROP TABLE tbVenda
DROP TABLE tbItensVenda







