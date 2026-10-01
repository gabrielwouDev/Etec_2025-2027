INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente)
VALUES				  				
('joão oliveira santos','123.456.789-02','joaoO@gmail.com','MASC','22/06/1990'),
('Mariana costa almeida','987.654.321-20','marii@gmail.com','FEM','14/10/2000'),
('Lucas souza','234.532.678-93','lucas.souza67@aluno.cps.gov.br','MASC','07/05/1995');
					  			
					  				
INSERT INTO tbFabricante(nomeFabricante)
VALUES
('Samsung'),
('Motorola'),
('PlayStation');

INSERT INTO tbFornecedor(nomeFornecedor, contatoFornecedor)
VALUES
('Amazon','amazonsupport@gmail.com'),
('Mercado Livre','(11) 11345-4342'),
('Pichau','pombo correio');

INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente)
VALUES
('12/12/2025',20000,1),
('01/03/2026',5788,2),							
('05/05/2024',15000,3);
						
INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor)
VALUES
('Monitor Samsung Odyssey 4k',7800.87,10,1,3),
('Motorola moto g86',1788.34,20,2,2),
('Playstation 5',4000,5,3,1);
					  
SELECT*FROM tbProduto
SELECT*FROM tbVenda



					  		