-- a)
SELECT descricaoProduto,nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON
		tbProduto.idFabricante = tbFabricante.idFabricante

-- b)
SELECT descricaoProduto,nomeFornecedor FROM tbProduto
	INNER JOIN tbFornecedor ON
		tbProduto.idFornecedor = tbFornecedor.idFornecedor

-- c)
SELECT nomeFabricante, SUM(quantidadeProduto) as 'Total quantidade de produtos' FROM tbProduto
	INNER JOIN tbFabricante ON
		tbProduto.idFabricante = tbFabricante.idFabricante
			GROUP BY tbFabricante.nomeFabricante
--exercício 2
--1)
INSERT INTO tbFornecedor (nomeFornecedor,contatoFornecedor)
VALUES
('Bom Preço','Socrátes'),
('Negreiros','Platão'),
('Extra','Júlio César');

--2)
SELECT nomeFornecedor,descricaoProduto FROM tbProduto
	INNER JOIN tbFornecedor ON 
		tbProduto.idFornecedor = tbFornecedor.idFornecedor

--3)
SELECT nomeFornecedor,descricaoProduto FROM tbProduto
	LEFT JOIN tbFornecedor ON 
		tbProduto.idFornecedor = tbFornecedor.idFornecedor


SELECT nomeFornecedor,descricaoProduto FROM tbProduto
	RIGHT JOIN tbFornecedor ON 
		tbProduto.idFornecedor = tbFornecedor.idFornecedor

--4)
INSERT INTO tbProduto (descricaoProduto,valorProduto,quantidadeProduto,idFabricante)
VALUES
('Coca-Cola 2L',9.50,2200,4),
('Pepsi twist 2L',11.25,1600,5),
('Doritos',5.00,280,5);

--5)
SELECT nomeFornecedor,descricaoProduto FROM tbProduto
	FULL JOIN tbFornecedor ON 
		tbProduto.idFornecedor = tbFornecedor.idFornecedor

--6)
SELECT tbProduto.descricaoProduto, tbFabricante.nomeFabricante FROM tbProduto
	CROSS JOIN tbFabricante
		WHERE tbFabricante.idFabricante = 2
--Resposta: A consulta retornou 13 registros, O que aconteceu foi que o CROSS JOIN criou uma tabela virtual onde todos os produtos são da fabricante P&G.


