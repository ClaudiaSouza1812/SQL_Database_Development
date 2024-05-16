-- Mude o contexto do banco de dados


USE [Vacations_ClaudiaSouza];
GO


-- 12. Faça uma consulta de forma a produzir um resultado 'semelhante' à imagem do formulário em papel.

-- Usando a função ROW_NUBER junto com a cláusula OVER;
-- OVER devolve um conjunto de linhas ordenadas por vacationID (ORDER BY) para a função ROW_NUMBER;
-- ROW_NUMBER numera cada linha usando do resultado da cláusula OVER;
-- Usando IIF para deixar as linhas 2 e 3 em branco apenas onde há repetição de dados, ou seja,
-- se o número da linha for 1, mostra as 8 primeiras informações, se a linha não for 1, mostrar um string vazia


SELECT
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, CAST(r.RequestID AS varchar(1)), '') AS 'Request form nro',
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, FORMAT(r.RequestDate, 'dd-MM-yyyy'), '') AS 'Request date',
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, FORMAT(r.ApprovalDate, 'dd-MM-yyyy'), '') AS 'Approval date',
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, m.Code, '') AS 'Manager code',
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, CONCAT_WS(' ', m.FirstName, m.SecondName, m.LastName), '') AS 'Manager name',
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, e.Code, '') AS 'Employee code',
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, CONCAT_WS(' ', e.FirstName, e.SecondName, e.LastName), '') AS 'Employee name',
    IIF(ROW_NUMBER() OVER (ORDER BY v.VacationID) = 1, d.Name, '') AS 'Department',
	v.VacationID AS '#',
	FORMAT(v.StartDate, 'dd-MM-yyyy') AS 'Start date',
	FORMAT(v.EndDate, 'dd-MM-yyyy') AS 'End date',
	v.TotalDays AS 'Total days',
	v.Approved AS 'Approved?'
FROM
    [dbo].[Request] AS r
INNER JOIN
    [dbo].[Employee] AS e 
ON 
	r.EmployeeID = e.EmployeeID
INNER JOIN 
    [dbo].[Employee] AS m 
ON 
	e.Superior = m.EmployeeID
INNER JOIN 
    [dbo].[Department] AS d 
ON 
	e.DepartmentID = d.DepartmentID
INNER JOIN
    [dbo].[Vacation] AS v 
ON 
	r.RequestID = v.RequestID
WHERE
	r.RequestID = 1;
GO


-- Fim.