CREATE DATABASE bd_ComercioLivros
GO
USE bd_ComercioLivros

CREATE TABLE tb_Autor(
	codAutor INT PRIMARY KEY IDENTITY(1,1),
	nomeAutor VARCHAR(80)
);

CREATE TABLE tb_Editora(
	codEditora INT PRIMARY KEY IDENTITY(1,1),
	nomeEditora VARCHAR(80)
);

CREATE TABLE tb_Livro(
	codLivro INT PRIMARY KEY IDENTITY(1,1),
	nomeLivro VARCHAR(80),
	isbn INT,
	numPaginas INT,
	codAutor INT FOREIGN KEY (codAutor) REFERENCES tb_Autor (codAutor),
	codEditora INT FOREIGN KEY (codEditora) REFERENCES tb_Editora (codEditora),
);