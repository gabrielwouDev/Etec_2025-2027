/*
a) Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo:
*/

CREATE PROCEDURE spInsere_categoria
	@nomeCategoriaProduto VARCHAR(20)
AS
	DECLARE @codCategoriaProduto INT
	IF EXISTS(SELECT @codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCategoriaProduto)
	BEGIN
		PRINT('ERRO Categoria '+@nomeCategoriaProduto+' já Existe!')
	END
	ELSE
	BEGIN
		INSERT INTO tbCategoriaProduto(nomeCategoriaProduto)
		VALUES
		(@nomeCategoriaProduto)
	END

EXEC spInsere_categoria 'Bolo Festa';
EXEC spInsere_categoria 'Bolo Simples';
EXEC spInsere_categoria 'Torta';
EXEC spInsere_categoria 'Salgado';


/*
b) Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá
antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja
duplicado:
*/

CREATE PROCEDURE spInsere_Produto
	@nomeProduto			VARCHAR(30),
	@precoKiloProduto		MONEY,
	@codCategoriaProduto	INT
AS
	DECLARE @codProduto INT
	IF EXISTS(SELECT @codProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
	BEGIN
		PRINT('ERRO Produto '+@nomeProduto+' já Existe!')
	END
	ELSE
	BEGIN
		INSERT INTO tbProduto(nomeProduto,precoKiloProduto,codCategoriaProduto)
		VALUES
		(@nomeProduto,@precoKiloProduto,@codCategoriaProduto)
	END	 	

EXEC spInsere_Produto 'Bolo Floresta Negra',42.00,1;
EXEC spInsere_Produto 'Bolo Prestígio',43.00,1;
EXEC spInsere_Produto 'Bolo Nutella',44.00,1;
EXEC spInsere_Produto 'Bolo Formigueiro',17.00,2;
EXEC spInsere_Produto 'Bolo de Cenoura',19.00,2;
EXEC spInsere_Produto 'Torta de Palmito',45.00,3;
EXEC spInsere_Produto 'Torta de Frango e Catupiry',47.00,3;
EXEC spInsere_Produto 'Torta de Escarola',44.00,3;
EXEC spInsere_Produto 'Coxinha Frango',25.00,4;
EXEC spInsere_Produto 'Esfiha carne',27.00,4;
EXEC spInsere_Produto 'Folhado Queijo',31.00,4;
EXEC spInsere_Produto 'Risoles Misto',29.00,4;



/*
c) Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão
ser feitas duas validações:
- Verificar pelo CPF se o cliente já existe. Caso já exista emitir a mensagem: “Cliente cpf XXXXX
já cadastrado”
- Verificar se o cliente é morador de Itaquera ou Guaianases, pois a confeitaria não realiza
entregas para clientes que residam fora desses bairros. Caso o cliente não seja morador desses
bairros enviar a mensagem “Não foi possível cadastrar o cliente XXXX pois o bairro XXXX não é
atendido pela confeitaria”
*/

CREATE PROCEDURE spInsere_Cliente
	@nomeCliente		VARCHAR(50),
	@dtNascCliente		DATE,
	@ruaCliente			VARCHAR(50),
	@numCasaCliente		INT,
	@cepCliente			VARCHAR(10),
	@bairroCliente		VARCHAR(35),
	@cidadeCliente		VARCHAR(30),
	@estadoCliente		VARCHAR(2),
	@cpfCliente			VARCHAR(14),
	@sexoCliente		VARCHAR(1)
AS
	DECLARE @codCliente INT
	IF EXISTS(SELECT @codCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	BEGIN 
		PRINT ('Impossível cadastrar Cliente CPF: '+@cpfCliente+' pois ja está cadastrado!')
	END
	ELSE
	IF @bairroCliente NOT LIKE '%guaianases%'
		AND @bairroCliente NOT LIKE '%itaquera%'
	BEGIN
		PRINT ('Impossível cadastrar Cliente '+@nomeCliente+' pois o bairro '+@bairroCliente+' não é atendido pela confeitaria!')
	END
	ELSE
	BEGIN
		INSERT INTO tbCliente(nomeCliente,dtNascCliente,ruaCliente,numCasaCliente,cepCliente,bairroCliente,cidadeCliente,estadoCliente,cpfCliente,sexoCliente)
		VALUES
		(@nomeCliente,@dtNascCliente,@ruaCliente,@numCasaCliente,@cepCliente,@bairroCliente,@cidadeCliente,@estadoCliente,@cpfCliente,@sexoCliente)
	END  

/*Código de erro para testar a validação*/
EXEC spInsere_Cliente 'Gabriel Penha','22/05/2009','Rua do cajú',1000,'04.590-001','Barro Branco','São Paulo','SP','222.333.444-67','M';
						  		
EXEC spInsere_Cliente 'Samira Fatah','05/05/1990','Rua Aguapeí',1000,'08.090-000','Guaianases','São Paulo','SP','533.893.230-07','F';
EXEC spInsere_Cliente 'Celia Nogueira','06/06/1992','Rua Andes',234,'08.456-090','Guaianases','São Paulo','SP','393.508.750-04','F';
EXEC spInsere_Cliente 'Paulo Cesar Siqueira','04/04/1984','Rua Castelo do Piauí',232,'08.109-000','Itaquera','São Paulo','SP','634.836.830-03','M';
EXEC spInsere_Cliente 'Rodrigo Favaroni','09/04/1991','Rua Sansão Castelo Branco',10,'08.431-090','Guaianases','São Paulo','SP','306.311.030-23','M';
EXEC spInsere_Cliente 'Rávia Regina Brito','22/04/1992','Rua Mariano Moro',300,'08.200.123','Itaquera','São Paulo','SP','753.967.280-35','F';

/*
d) Criar via stored procedure as encomendas abaixo relacionadas, fazendo as verificações abaixo:
- No momento da encomenda o cliente irá fornecer o seu cpf. Caso ele não tenha sido
cadastrado enviar a mensagem “não foi possível efetivar a encomenda pois o cliente xxxx não
está cadastrado”
- Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: “Encomenda XXX para
o cliente YYY efetuada com sucesso” sendo que no lugar de XXX deverá aparecer o número da
encomenda e no YYY deverá aparecer o nome do cliente;
*/

CREATE PROCEDURE spCriar_Encomenda
	@nomeCliente			VARCHAR(50),
	@cpfCliente				VARCHAR(14),
	@dataEncomenda			DATE,
	@valorTotalEncomenda	MONEY,
	@dataEntregaEncomenda	DATE
AS
	DECLARE @codCliente		INT
	DECLARE @codEncomenda	VARCHAR(1)
	IF EXISTS(SELECT @codCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		SELECT @codCliente = codCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente
		INSERT INTO tbEncomenda(dataEncomenda,codCliente,valorTotalEncomenda,dataEntregaEncomenda)
		VALUES
		(@dataEncomenda,@codCliente,@valorTotalEncomenda,@dataEntregaEncomenda)
		SELECT @codEncomenda = codEncomenda FROM tbEncomenda
		SELECT @nomeCliente = nomeCliente FROM tbCliente WHERE codCliente LIKE @codCliente
		PRINT('Encomenda '+@codEncomenda+' para o Cliente '+@nomeCliente+' efetuada com sucesso!')
	END
	ELSE
	BEGIN
		PRINT('Não foi possível efetuar a encomenda pois o cliente '+@nomeCliente+' não está cadastrado!')
	END			  

/*Código de erro para testar a validação*/
EXEC spCriar_Encomenda 'Gabriel Penha','222.333.444-04','12/07/2026',1000.00,'13/08/2077';  		

EXEC spCriar_Encomenda 'Samira Fatah','533.893.230-07','08/08/2026',450.00,'13/08/2026';
EXEC spCriar_Encomenda 'Celia Nogueira','393.508.750-04','10/10/2026',200.00,'15/10/2026';
EXEC spCriar_Encomenda 'Paulo Cesar Siqueira','634.836.830-03','10/10/2016',150.00,'10/12/2026';
EXEC spCriar_Encomenda 'Samira Fatah','533.893.230-07','05/10/2026',150.00,'12/10/2026';
EXEC spCriar_Encomenda 'Rodrigo Favaroni','306.311.030-23','06/10/2026',250.00,'12/10/2026';

/*
e) ao adicionar a encomenda, criar uma stored procedure, para que sejam inseridos os 
itens da encomenda conforme a tabela a seguir.
Itens da encomenda:
*/

CREATE PROCEDURE spItens_Encomenda
    @codEncomenda		INT,
    @codProduto			INT,
    @quantidadeKilos	FLOAT,
    @subTotal			MONEY
AS
	DECLARE @codItensEncomenda INT
	IF EXISTS(SELECT @codEncomenda FROM tbEncomenda WHERE codEncomenda = @codEncomenda)
		BEGIN
			INSERT INTO tbItensEncomenda(codEncomenda,codProduto,quantidadeKilos,subTotal)
			VALUES 
			(@codEncomenda,@codProduto,@quantidadeKilos,@subTotal)
		END
		ELSE
		BEGIN
			PRINT ('ERRO não foi possível adicionar o item pois a encomenda não existe!')
		END

EXEC spItens_Encomenda 1,1,2.5,105.00;
EXEC spItens_Encomenda 1,10,2.6,70.00;
EXEC spItens_Encomenda 1,9,6,150.00;
EXEC spItens_Encomenda 1,12,4.3,125.00;
EXEC spItens_Encomenda 2,9,8,200.00;
EXEC spItens_Encomenda 3,11,3.2,100.00;
EXEC spItens_Encomenda 3,9,2,50.00;
EXEC spItens_Encomenda 4,2,3.5,150.00;
EXEC spItens_Encomenda 4,3,2.2,100.00;
EXEC spItens_Encomenda 5,6,3.4,150.00;

--código para testar validação 
EXEC spItens_Encomenda 10,6,3.4,150.00;


/*
f)	Apos todos os cadastros crair stored procedures para alterar o que se pede:
1- O preço dos produtos da categoria "Bolo festa" sofream um aumento de 10%
2- O preço dos produtos categoria "bolo simples" estão em promoção e terão um desconto de 20% 
3- O preço dos produtos categoria "Torta" aumentaram em 20%
4- O preço dos produtos categoria "Salgado", com exceção da esfiha de carne, sofreram um aumento de 20%
*/

CREATE PROCEDURE spAumenta_BoloFesta
    @porcentagem FLOAT
AS
BEGIN
	UPDATE tbProduto
	SET precoKiloProduto = precoKiloProduto * (1 + @porcentagem/100)
		WHERE codCategoriaProduto = 1;
	
    PRINT ('Preços atualizados com sucesso!');
END

EXEC spAumenta_BoloFesta 10;



CREATE PROCEDURE spDiminui_BoloSimples
    @porcentagem FLOAT
AS
BEGIN
UPDATE tbProduto
	SET precoKiloProduto = precoKiloProduto * (1 - @porcentagem/100)
		WHERE codCategoriaProduto = 2;
		
    PRINT ('Preços atualizados com sucesso!');
END


EXEC spDiminui_BoloSimples 20;

select*from tbProduto

CREATE PROCEDURE spAumenta_Torta
    @porcentagem FLOAT
AS
BEGIN
	UPDATE tbProduto
	SET precoKiloProduto = precoKiloProduto * (1 + @porcentagem/100)
		WHERE codCategoriaProduto = 3;
		
    PRINT ('Preços atualizados com sucesso!');
END

EXEC spAumenta_Torta 20;
	

CREATE PROCEDURE spAumenta_Salgado
    @porcentagem FLOAT
AS
BEGIN
	UPDATE tbProduto
	SET precoKiloProduto = precoKiloProduto * (1 + @porcentagem/100)
		WHERE codCategoriaProduto = 4
			AND NOT (codProduto = 10);
	   
       PRINT ('Preços atualizados com sucesso!');
END	

EXEC spAumenta_Salgado 20;
 
/*
g)	Criar uma procedure para excluir clientes pelo CPF sendo que:
1- caso o cliente possua encomendas emitir a mensagem "Impossivel remover esse cliente pos o cliente XXXX possui encomendas;" onde XXXX é o nome do cliente. 
2- caso o cliente não possua encomendas realizar a remoção e emitir a mensagem "Cliente XXXX removido com sucesso", onde XXXX é o nome do cliente;
*/

CREATE PROCEDURE spDeletar_Clientes 
	@cpfCliente VARCHAR(14)
	AS 
		BEGIN 
			/* pega o código do cliente e o nome do cliente se o cpf cliente estiver cadastrado na tabela cliente */
			DECLARE @codCliente INT
			DECLARE @nomeCliente VARCHAR(50)
			SELECT @codCliente = codCliente, @nomeCliente = nomeCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente;
			IF @codCliente IS NOT NULL
				BEGIN
					/* pega o código da encomenda da tabela encomenda se o código do cliente existir na tabela encomenda */
					DECLARE @codEncomenda INT
					IF EXISTS(SELECT @codEncomenda FROM tbEncomenda WHERE codCliente LIKE @codCliente)
					BEGIN
						PRINT ('Impossivel remover esse cliente pois o cliente '+ @nomeCliente +' possui encomendas!');
					END
			ELSE
			BEGIN 
				/* deleta o cliente pelo cpf caso ele não tenha nenhuma encomenda */
				DELETE FROM tbCliente WHERE @cpfCliente = cpfCliente
				BEGIN
					PRINT ('Cliente '+ @nomeCliente +' removido com sucesso');
				END
			END 
		END
		ELSE 
		BEGIN 
			PRINT ('Esse cpf não existe na tabela Clientes')
		END
	END



-- caso 1
EXEC spDeletar_Clientes '533.893.230-07';
-- caso 2
EXEC spDeletar_Clientes '753.967.280-35';
-- caso 3
EXEC spDeletar_Clientes '333.444.666-87';

/*
h) criar uma procedure que permita excluir qualquer item de uma encomenda cuja data de entrega seja maior que a data atual. para tal o cliente devera fornecer o 
código da encomenda e o código do produto que será excluido da encomenda. A procedure deverá remover o item e atualizar o valor total da encomenda, do qual deverá 
ser subtraído do valor do item a ser removido. A procedure deverá remover apenas um item da encomenda de cada vez.
*/
CREATE PROCEDURE spDeletar_Item
	@dataAtual		DATE,
	@codEncomenda	INT,
    @codProduto		INT
AS	
	DECLARE @dtEntregaEncomenda DATE
	SELECT @dtEntregaEncomenda = dataEntregaEncomenda FROM tbEncomenda WHERE codEncomenda = @codEncomenda
	IF @dtEntregaEncomenda IS NOT NULL
	BEGIN
		IF @dtEntregaEncomenda > @dataAtual
			BEGIN
				DECLARE @codItensEncomenda INT
				DECLARE @subTotal MONEY
				SELECT @codItensEncomenda = codItensEncomenda, @subTotal  = subTotal FROM tbItensEncomenda WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto
				IF @codItensEncomenda IS NOT NULL
				BEGIN
					DELETE FROM tbItensEncomenda WHERE codItensEncomenda = @codItensEncomenda;
					UPDATE tbEncomenda 
					SET valorTotalEncomenda = valorTotalEncomenda - @subTotal
						WHERE codEncomenda = @codEncomenda
					PRINT ('Encomenda excluida com sucesso!')
				END
			END
			ELSE
			BEGIN
				PRINT ('Encomenda ja realizada ou atrasada, impossivel realizar a remoção')
			END
	END
	
-- caso 1 (sucesso)
EXEC spDeletar_Item '11/08/2026',1,9
--caso 2 (falha)
EXEC spDeletar_Item '15/08/2026',1,10
