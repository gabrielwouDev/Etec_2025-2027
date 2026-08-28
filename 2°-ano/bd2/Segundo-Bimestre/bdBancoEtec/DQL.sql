
/* a) Criar uma view vwSaldoTotal obtendo o nome do correntista, o saldo da
Conta corrente, o Saldo da Poupança e a soma dos dois saldos */
CREATE VIEW vwSaldoTotal AS
	SELECT nomeCorrentista 'Nome', saldoCC 'Saldo Corrente', saldoCP 'Saldo Poupanca', (saldoCC+saldoCP) 'Saldo Total' FROM tbCorrentista
		INNER JOIN tbContaCorrente ON tbCorrentista.codCorrentista = tbContaCorrente.codCorrentista
 			INNER JOIN tbContaPoupanca ON tbCorrentista.codCorrentista = tbContaPoupanca.codCorrentista

/* b) Utilizando a view vwSaldoTotal anterior, ordenar os correntistas por ordem
alfabética */
SELECT*FROM vwSaldoTotal
	ORDER BY 'Nome' ASC

/* c) Criar uma view vwProjecaoSaldoPoupanca informando o nome do correntista
e o saldo da poupança atualizado após acréscimo de 0.5% no próximo mês */
CREATE VIEW vwProjecaoSaldoPoupanca AS
	SELECT nomeCorrentista 'Nome', saldoCP 'Saldo Poupanca', (saldoCP*1.005) 'Saldo Atualizado' FROM tbCorrentista
		INNER JOIN tbContaPoupanca ON tbCorrentista.codCorrentista = tbContaPoupanca.codCorrentista

SELECT*FROM vwProjecaoSaldoPoupanca
	ORDER BY 'Nome'

/*d) Criar uma view vwExibeCorrentista que exiba todos os dados da conta
corrente ao lado do nome do correntista (exceto a senha numérica e
alfanumérica), com a data de abertura da conta corrente no formato
dd/mm/aaaa e o saldo da poupança */

CREATE VIEW vwExibeCorrentista AS
	SELECT nomeCorrentista 'Nome', numeroAgenciaCC 'Número da agencia', numeroCC 'Número da conta',digitoCC 'Dígito da conta',saldoCC 'Saldo Conta Corrente',dataAberturaCC 'Data de abertura CC',saldoCP 'Saldo conta poupança' FROM tbCorrentista
		INNER JOIN tbContaCorrente ON tbCorrentista.codCorrentista = tbContaCorrente.codCorrentista
 			INNER JOIN tbContaPoupanca ON tbCorrentista.codCorrentista = tbContaPoupanca.codCorrentista

SELECT*FROM vwExibeCorrentista
	ORDER BY 'Nome'

/* e) Criar uma view vwCorrentistaConta que exiba o nome dos correntistas, o
numero da conta corrente e o saldo na conta corrente, apenas daqueles que
possuam mais de R$ 500000,00 na conta corrente. Utilizar essa view para exibir
os dados ordenados por saldo da conta (do maior saldo para o menor saldo)*/

CREATE VIEW vwCorrentistaConta AS
	SELECT nomeCorrentista 'Nome', numeroCC 'Número da conta', saldoCC 'Saldo Conta Corrente' FROM tbCorrentista
		INNER JOIN tbContaCorrente ON tbCorrentista.codCorrentista = tbContaCorrente.codCorrentista
			WHERE saldoCC > 500000

SELECT*FROM vwCorrentistaConta
	ORDER BY 'Saldo Conta Corrente' DESC