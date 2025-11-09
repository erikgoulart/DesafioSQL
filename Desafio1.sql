--1 - Listar o nome do cliente, nome do produto e o valor total da venda.
USE [BancoTreino]

SELECT 
a.Nome as 'Nome Cliente',
c.NomeProduto as 'Nome Produto',
SUM(b.Quantidade*C.preco) as 'Valor Total de Venda'
FROM [BancoTreino]..Clientes a
JOIN [BancoTreino]..Vendas b
ON A.IdCliente = b.IdCliente
JOIN [BancoTreino]..Produtos c
ON B.IdProduto = c.IdProduto 
Group by a.Nome, c.NomeProduto


--2 - Mostrar o total gasto por cada cliente, ordenado do maior para o menor.

SELECT
a.Nome as 'Nome do Cliente',
SUM(B.quantidade*C.preco) as 'Valor gasto'
FROM [BancoTreino]..Clientes a
JOIN [BancoTreino]..Vendas b
ON a.IdCliente = b.IdCliente
JOIN [BancoTreino]..Produtos C
ON b.IdProduto = C.IdProduto
GROUP BY a.Nome
ORDER BY 'Valor Gasto' desc


--3 - Exibir os 3 produtos mais vendidos (em quantidade total).

SELECT
TOP 3 
B.NomeProduto,
sum (a.Quantidade) as 'Quantidade'
FROM [BancoTreino]..Vendas a
JOIN [BancoTreino]..Produtos b
ON a.IdProduto = b.IdProduto
group by  b.NomeProduto
order by Quantidade desc

--4- Mostrar o faturamento total de cada cidade.

SELECT
A.Cidade,
SUM(B.Quantidade*C.Preco) AS 'FATURAMENTO'
FROM [BancoTreino]..Clientes A
JOIN [BancoTreino]..Vendas B
ON A.IdCliente = B.IdCliente
join [BancoTreino]..Produtos C
ON B.IdProduto = C.IdProduto
GROUP BY A.Cidade


--5 - Encontrar o cliente que mais comprou em valor total.

SELECT 
TOP 1
a.Nome as 'Nome Cliente',
SUM(b.quantidade *c.preco) as 'Maior Venda'
FROM [BancoTreino]..Clientes a
JOIN [BancoTreino]..Vendas b
ON A.IdCliente = b.IdCliente
JOIN [BancoTreino]..Produtos c
ON b.IdProduto = C.IdProduto
GROUP BY a.NOME

--Extra (nível bônus) Crie uma view chamada vw_FaturamentoMensal que mostre: O mês (MM/YYYY), O total faturado no mês

CREATE VIEW vw_FaturamentoMensal AS
SELECT
FORMAT(a.DataVenda, 'MM/yyyy') AS 'Mes Ano',
SUM(a.quantidade*b.preco) as 'Total Faturado no Mes'
FROM [BancoTreino]..Vendas A
JOIN [BancoTreino]..Produtos B
ON A.IdProduto = B.IdProduto

GROUP BY A.DataVenda;
