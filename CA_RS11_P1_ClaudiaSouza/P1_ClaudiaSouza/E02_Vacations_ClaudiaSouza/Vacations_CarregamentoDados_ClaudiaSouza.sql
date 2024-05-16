-- Mude o contexto do banco de dados


USE [Vacations_ClaudiaSouza];
GO


-- Insira os dados nas tabelas baseada na normalização
-- 1. Insira os dados na tabela Departments


INSERT INTO [dbo].[Department]
(
	[Name]
)
VALUES
(
	'Tecnologias de Informação'
),
(
	'Recursos Humanos'
);
GO


-- 2. Insira os dados na tabela Employee


INSERT INTO [dbo].[Employee]
(
	[DepartmentID],
	[Code],
	[FirstName],
	[SecondName],
	[LastName],
	[Title],
	[Superior]
)
VALUES
(
	1,
	'PT-PRT-TI-000120',
	'Maria',
	'Antónia',
	'de Castro Sá',
	NULL,
	2
),
(
	2,
	'PT-PRT-HR-000012',
	'Carolina',
	'Franco',
	'de Lima',
	'Manager',
	NULL
);
GO


-- 3. Insira os dados na tabela Request


INSERT INTO [dbo].[Request]
(
	[EmployeeID],
	[RequestDate],
	[ApprovalDate]
)
VALUES
(
	1,
	'2019-02-25',
	'2019-03-04'
);
GO


-- 4. Insira os dados na tabela Vacation


INSERT INTO [dbo].[Vacation]
(
	[RequestID],
	[StartDate], 
	[EndDate],
	[TotalDays],
	[Approved]
)
VALUES
(
	1,
	'2019-03-04',
	'2019-03-08',
	'5',
	'Yes'
),
(
	1,
	'2019-07-29',
	'2019-08-16',
	'15',
	'Yes'
),
(
	1,
	'2019-12-23',
	'2020-01-03',
	'8',
	'No'
);
GO


-- 5. Insira os dados na tabela RequestDetail


INSERT INTO [dbo].[RequestDetail]
(
	[RequestID],
	[EmployeeID],
	[VacationID]
)
VALUES
(
	1,
	1,
	1
),
(
	1,
	1,
	2
),
(
	1,
	1,
	3
);
GO


-- Fim.