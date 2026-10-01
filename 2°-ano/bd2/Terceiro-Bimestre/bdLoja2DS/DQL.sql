/*
1)- Criar um trigger que, ao ser feita uma venda (Insert na tabela
	tbItensVenda), todos os produtos vendidos tenham sua quantidade
	atualizada na tabela tbProduto. Exemplo, se foi feita uma venda de 5
	unidades do produto código 01, na tabela tbProduto a quantidade desse
	produto será a quantidade atual – 5;
*/
CREATE TRIGGER tgAtualizaProduto
	ON tbItensVenda
	AFTER INSERT
	AS
		BEGIN
			DECLARE @codProduto INT
			DECLARE @quantidade INT
			DECLARE @nomeProduto VARCHAR(50)
			SET @quantidade = (SELECT quantidadeItensVenda FROM inserted)
			SET @codProduto = (SELECT codProduto FROM inserted)
			SET @nomeProduto = (
				SELECT descricaoProduto FROM inserted
					INNER JOIN tbProduto ON inserted.codProduto = tbProduto.codProduto
			)
			UPDATE tbProduto 
				SET quantidadeProduto = quantidadeProduto - @quantidade FROM tbProduto
				WHERE @codProduto = codProduto
				PRINT('O estoque do produto '+@nomeProduto+' foi diminuido na tabela de Produtos')
		END


/*
2) - Criar um trigger que, quando for inserida uma nova entrada de produtos
	 na tbEntradaProduto, a quantidade desse produto seja atualizada e
	 aumentada na tabela tbProduto;
*/
CREATE TRIGGER tgAumentaProduto
	ON tbEntradaProduto
	AFTER INSERT
	AS
		BEGIN
			DECLARE @codProduto INT
			DECLARE @quantidade INT
			DECLARE @nomeProduto VARCHAR(50)
			SET @quantidade = (SELECT quantidadeEntradaProduto FROM inserted)
			SET @codProduto = (SELECT codProduto FROM inserted)
			SET @nomeProduto = (
				SELECT descricaoProduto FROM inserted
					INNER JOIN tbProduto ON inserted.codProduto = tbProduto.codProduto
			)
			UPDATE tbProduto
				SET quantidadeProduto = quantidadeProduto + @quantidade FROM tbProduto
				WHERE @codProduto = codProduto
				PRINT('O estoque do produto '+@nomeProduto+' foi aumentado na tabela de Produtos')
		END
						
/*
3) - Criar uma trigger que, quando for feita uma venda de um determinado
	 produto, seja feito um Insert na tbSaidaProduto.
*/
CREATE TRIGGER tgRegistraSaida
	ON tbItensVenda
	AFTER INSERT
	AS
		BEGIN
			DECLARE @dataVenda			DATE
			DECLARE @codProduto			INT
			DECLARE @quantidadeVendida	INT
			DECLARE @nomeProduto		VARCHAR(50)
			SET @dataVenda = (
				SELECT dataVenda FROM inserted
					INNER JOIN tbVenda ON inserted.codVenda = tbVenda.codVenda
			)
			SET @codProduto = (SELECT codProduto FROM inserted)
			SET @quantidadeVendida = (SELECT quantidadeItensVenda FROM inserted)
			SET @nomeProduto = (
				SELECT descricaoProduto FROM inserted
					INNER JOIN tbProduto ON inserted.codProduto = tbProduto.codProduto
			)
			INSERT INTO tbSaidaProduto(dataSaidaProduto,codProduto,quantidadeSaidaProduto)
			VALUES
			(@dataVenda,@codProduto,@quantidadeVendida)
			PRINT ('Saída do produto '+@nomeProduto+'registrada com sucesso!')
		END

INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda)
VALUES					 				
(2,3,3,12788)						 	
						 		
SELECT*FROM tbProduto
SELECT*FROM tbItensVenda
SELECT*FROM tbSaidaProduto