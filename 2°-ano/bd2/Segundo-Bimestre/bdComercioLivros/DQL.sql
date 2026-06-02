-- a)Criar uma consulta em que seja possível identificar todo autores pelo nome, inclusive aqueles autores que ainda não tiveram livros cadastrados;

SELECT nomeAutor,nomeLivro from tb_Livro
	RIGHT JOIN tb_Autor ON 
		tb_Livro.codAutor = tb_Autor.codAutor

-- b)Criar uma consulta em que seja possível identificar todas as editoras pelo nome, inclusive aquelas que ainda não publicaram livros

SELECT nomeEditora,nomeLivro from tb_Livro
	RIGHT JOIN tb_Editora ON 
		tb_Livro.codEditora = tb_Editora.codEditora

-- c)Criar uma consulta em que seja possível identificar todos os livros pelo nome, inclusive aqueles que não tem autor cadastrado

SELECT nomeLivro,nomeAutor from tb_Livro
	LEFT JOIN tb_Autor ON 
		tb_Livro.codAutor = tb_Autor.codAutor

-- d)Criar uma consulta em que seja possível mostrar todos os livros pelo nome, inclusive aqueles que ainda não foram publicados por nenhuma editora

SELECT nomeLivro,nomeEditora from tb_Livro
	LEFT JOIN tb_Editora ON 
		tb_Livro.codEditora = tb_Editora.codEditora

-- e)Criar uma consulta que exiba todos os nomes de livros ao lado dos nomes das editoras, inclusive as editoras que ainda não fizeram nenhuma publicação e aqueles livros publicados ainda não possuem nenhuma editora relacionada


SELECT nomeLivro,nomeEditora from tb_Livro
	FULL JOIN tb_Editora ON 
		tb_Livro.codEditora = tb_Editora.codEditora

--  f)A Cia das Letras quer publicar TODOS os livros cadastrados. Criar uma consulta que apresenta o nome do livro ao lado do nome da editora Cia das Letras

SELECT nomeLivro,nomeEditora from tb_Livro
	FULL JOIN tb_Editora ON 
		tb_Livro.codEditora = tb_Editora.codEditora
			WHERE nomeEditora LIKE 'Cia das Letras'

--  g)Caso todas as editoras queiram publicar todos os livros, criar uma consulta para relacionar todas as editoras com todos os livros

SELECT tb_Editora.nomeEditora, tb_Livro.nomeLivro FROM tb_Livro
	CROSS JOIN tb_Editora

--  h) Criar uma consulta que apresente apenas os livros que não tem autor cadastrado
SELECT nomeLivro,nomeAutor from tb_Livro
	LEFT JOIN tb_Autor ON 
		tb_Livro.codAutor = tb_Autor.codAutor
			WHERE tb_Livro.codAutor IS null

--  i)Criar uma consulta que apresente os nomes das editoras que ainda não tem um livro publicado
SELECT nomeEditora,nomeLivro from tb_Livro
	RIGHT JOIN tb_Editora ON 
		tb_Livro.codEditora = tb_Editora.codEditora
			WHERE tb_Livro.codLivro IS null

--  j)Criar uma consulta que apresente apenas os nomes dos autores que ainda não escreveram nenhum livro
SELECT nomeAutor,nomeLivro from tb_Livro
	RIGHT JOIN tb_Autor ON 
		tb_Livro.codAutor = tb_Autor.codAutor
			WHERE tb_Livro.codLivro IS null
