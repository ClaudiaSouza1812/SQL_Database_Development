-- Mude o contexto do banco de dados


USE [MarketDev_RS_P1];
GO


-- 21. Listagem dos produtos por cor, categoria e subcategoria (295 registos; consulte o ficheiro de resultados):
-- Resultado: 295 -- ok


SELECT
	IIF(p.Color IS NULL, '<...>', p.Color) AS 'Color',
	c.CategoryName AS 'Category',
	s.SubcategoryName AS 'Subcategory',
	p.ProductName AS 'Product',
	LOWER(IIF(p.SizeUnitMeasureCode IS NULL, '', p.SizeUnitMeasureCode)) AS 'Size unit'
FROM
	[Marketing].[Product] AS p
INNER JOIN
	[Marketing].[Subcategory] AS s
ON
	p.SubcategoryID = s.SubcategoryID
INNER JOIN
	[Marketing].[Category] AS c
ON
	s.CategoryID = c.CategoryID
ORDER BY
	p.Color,
	c.CategoryName,
	s.SubcategoryName;
GO

-- corrigido com COALESCE:


SELECT
	COALESCE(p.Color, '<...>') AS 'Color',
	c.CategoryName AS 'Category',
	s.SubcategoryName AS 'Subcategory',
	p.ProductName AS 'Product',
	LOWER(COALESCE(p.SizeUnitMeasureCode, '')) AS 'Size unit'
FROM
	[Marketing].[Product] AS p
INNER JOIN
	[Marketing].[Subcategory] AS s
ON
	p.SubcategoryID = s.SubcategoryID
INNER JOIN
	[Marketing].[Category] AS c
ON
	s.CategoryID = c.CategoryID
ORDER BY
	p.Color,
	c.CategoryName,
	s.SubcategoryName;
GO

-- 22. Listagem do tempo de venda dos produtos (86 registos; consulte o ficheiro de resultados):
-- Resultado: 86 -- ok


SELECT
	DATEDIFF(YEAR, p.SellStartDate, p.SellEndDate) AS 'Sell years',
	DATEDIFF(MONTH, p.SellStartDate, p.SellEndDate) AS 'Sell months',
	DATEDIFF(DAY, p.SellStartDate, p.SellEndDate) AS 'Sell days',
	FORMAT(p.SellStartDate, 'd', 'pt-pt') AS 'Sell start',
	FORMAT(p.SellEndDate, 'd', 'pt-pt') AS 'Sell end',
	p.ProductName AS 'Product',
	FORMAT(p.ListPrice, 'c', 'pt-pt') AS 'List price'
FROM
	[Marketing].[Product] AS p
WHERE
	p.SellEndDate IS NOT NULL AND
	p.Color IS NOT NULL
ORDER BY
	'Sell years' DESC,
	p.ProductName;
GO


-- 23. Estatísticas dos preços dos produtos mais representativos, pelo menos 10, agrupados por cor: (5 registos):
-- Resultado: 5 -- ok


SELECT
	COUNT(p.Color) AS 'Total',
	p.Color AS 'Color',
	FORMAT(MIN(p.ListPrice), 'c', 'pt-pt') AS 'Minimum list price',
	FORMAT(MAX(p.ListPrice), 'c', 'pt-pt') AS 'Maximun list price',
	FORMAT(AVG(p.ListPrice), 'c', 'pt-pt') AS 'Average list price'
FROM
	[Marketing].[Product] AS p
WHERE
	p.Color IS NOT NULL
GROUP BY
	p.Color
HAVING
	COUNT(p.Color) > 10
ORDER BY
	'Total' DESC;
GO


-- 24. Listagem dos vendedores europeus com e-mail automático (3 registos):
-- Resultado: 3 -- ok


DECLARE @separatorOne AS nvarchar(1) = '.';
DECLARE @separatorTwo AS nvarchar(1) = '_';
DECLARE @separatorThree AS nvarchar(1) = '@';
DECLARE @emailDomain AS nvarchar(11) = 'restart.com';

SELECT
	CONCAT_WS(' ', s.FirstName, UPPER(s.LastName)) AS 'Salesperson',
	LOWER(CONCAT(s.FirstName, @separatorOne, REPLACE(s.LastName, ' ', ''), @separatorTwo, REPLACE(st.Country, ' ', ''), @separatorOne, REPLACE(st.Region, ' ', ''), @separatorThree, @emailDomain)) AS 'E-mail',
	st.Country AS 'Country',
	st.Region AS 'Region'
FROM
	[Marketing].[Salesperson] s
INNER JOIN
	[Marketing].[SalesTerritory] AS st
ON
	s.SalesTerritoryID = st.SalesTerritoryID
WHERE
	st.Region = 'Europe'
ORDER BY
	s.FirstName,
	s.LastName;
GO


-- 25. Contagem dos vendedores por país e por região (6 registos):
-- Resultado: 6 -- ok


SELECT
	st.Region AS 'Region',
	st.Country AS 'Country',
	COUNT(s.SalespersonID) AS 'Total salesperson'
FROM
	[Marketing].[Salesperson] AS s
INNER JOIN
	[Marketing].[SalesTerritory] AS st
ON
	s.SalesTerritoryID = st.SalesTerritoryID
GROUP BY
	st.Region,
	st.Country
ORDER BY
	st.Region;
GO


-- 26. Prospetores que têm de atualizar, por telefone, o email (5.189 registos; consulte o ficheiro de resultados):
-- Resultado: 5189 -- ok

-- entregue:
SELECT
	CONCAT_WS(' ', p.FirstName, p.MiddleName, p.LastName) AS 'Prospecter',
	IIF(p.CellPhoneNumber IS NOT NULL, p.CellPhoneNumber, 
	IIF(p.HomePhoneNumber IS NOT NULL, p.HomePhoneNumber, p.WorkPhoneNumber)) AS 'Contact number',
	CASE
		WHEN p.EmailAddress IS NULL THEN '<to be updated>'
	END AS 'E-mail'
FROM
	[Marketing].[Prospect] AS p
WHERE
	p.EmailAddress IS NULL
ORDER BY
	'Prospecter';
GO

-- correção usando COALESCE:
 
SELECT
	CONCAT_WS(' ', p.FirstName, p.MiddleName, p.LastName) AS 'Prospecter',
	COALESCE(p.CellPhoneNumber, p.HomePhoneNumber, p.WorkPhoneNumber) AS 'Contact number',
	COALESCE(p.EmailAddress, '<to be updated>') AS 'E-mail'
FROM
	[Marketing].[Prospect] AS p
WHERE
	p.EmailAddress IS NULL
ORDER BY
	'Prospecter';
GO


-- 27. Quais os modelos que não têm produtos (1 registo):
-- Resultado: 1 -- ok
-- tras todos os resultados da tabela da esquerda (ProductModel) em que o ProductModelID seja igual na segunda tabela, ProductDescription. Neste caso, Rear brakes é retornado como único modelo que não possui produto na tabela ProductDescription, e como não há produto, não pode haver descrição, desta forma a coluna vazia é retornada com o valor de NULL.


SELECT
	pm.ProductModel AS 'Product Model',
	pm.Description AS 'Product description'
FROM
	[Marketing].[ProductModel] AS pm 
LEFT OUTER JOIN
	[Marketing].[ProductDescription] AS pd 
ON
	pm.ProductModelID = pd.ProductModelID 
WHERE 
	pd.ProductModelID IS NULL; 
GO


-- 28. Listagem multilíngua das bicicletas (30 registos; consulte o ficheiro de resultados):
-- Resultado: 30 -- ok


SELECT
	pm.ProductModel AS 'Product model',
	p.ProductName AS 'Product',
	p.ProductNumber AS 'Product nr.',
	l.LanguageName AS 'Language',
	pd.Description AS 'Product Description'
FROM
	[Marketing].[Product] AS p
INNER JOIN
	[Marketing].[ProductModel] AS pm
ON
	p.ProductModelID = pm.ProductModelID
INNER JOIN
	[Marketing].[ProductDescription] AS pd
ON
	pm.ProductModelID = pd.ProductModelID
INNER JOIN
	[Marketing].[Language] AS l
ON
	pd.LanguageID = l.LanguageID
WHERE
	p.ProductName LIKE '%bike%'
ORDER BY
	'Product model',
	'Language';
GO


-- 29. Listagens das línguas e respetivo código ISO (7 registos):
-- Resultado: 7 -- ok


SELECT
	l.LanguageName AS 'Language name',
	CONCAT_WS('-', LEFT(l.LanguageID, 2),
		CASE l.LanguageID
			WHEN 'ar' THEN 'AE'
			WHEN 'zh-cht' THEN 'CN'
			WHEN 'en' THEN 'US'
			WHEN 'fr' THEN UPPER(LEFT(l.LanguageID, 2))
			WHEN 'he' THEN 'IL'
			WHEN 'es' THEN UPPER(LEFT(l.LanguageID, 2))
			WHEN 'th' THEN UPPER(LEFT(l.LanguageID, 2))
		END) AS 'ISO language code'
FROM
	[Marketing].[Language] AS l
WHERE 
	LEN(l.LanguageID) > 0
ORDER BY
	l.LanguageName;
GO


-- 30. Data prevista de entrega dos produtos (104 registos; consulte o ficheiro de resultados):
-- Resultado: 104 -- ok


DECLARE @chosenDate AS date = '2023-11-01'

SELECT 
	p.ProductName AS 'Product',
	p.DaysToManufacture AS 'Days to manufacture',
	FORMAT(DATEADD(d, p.DaysToManufacture, @chosenDate), 'd', 'pt-pt') AS 'Delivery date'
FROM
	[Marketing].[Product] AS p
WHERE
	p.DaysToManufacture > 1
ORDER BY
	p.ProductName;
GO