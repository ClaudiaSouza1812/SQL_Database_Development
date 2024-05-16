-- Mude o contexto da banco de dados


USE [Vacations_ClaudiaSouza];
GO


-- 14. Inserir dois departamentos da empresa: Comercial e Administração. 


INSERT INTO [dbo].[Department]
(
	[Name]
)
VALUES
(
	'Comercial'
),
(
	'Administração'
);
GO


-- 16. inserir dois novos formulários.


-- Vacation Request Form nº 2


-- Insira os dados na tabela [Department]


INSERT INTO [dbo].[Department]
(
	[Name]
)
VALUES
(
	'Financeiro'
);
GO


-- Insira os dados na tabela [Employee]


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
	2,
	'PT-PRT-HR-000003',
	'Mário',
	NULL,
	'Ramos',
	'Manager',
	NULL
),
(
	5,
	'PT-LIS-FI-00083',
	'Rui',
	'Pina',
	'de Oliveira',
	NULL,
	3
);
GO


-- Insira os dados na tabela [Request]


INSERT INTO [dbo].[Request]
(
	[EmployeeID], 
	[RequestDate], 
	[ApprovalDate]
)
VALUES
(
	4,
	'2019-02-26',
	'2019-03-06'
);


-- Insira os dados na tabela [Vacation]


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
	2,
	'2019-04-15',
	'2019-04-19',
	'6',
	'No'
),
(
	2,
	'2019-07-29',
	'2019-08-21',
	'27',
	'Yes'
);
GO


-- Insira os dados na tabela [RequestDetail]


INSERT INTO [dbo].[RequestDetail]
(
	[RequestID],
	[EmployeeID],
	[VacationID]
)
VALUES
(
	2,
	4,
	6
),
(
	2,
	4,
	7
);
GO


-- Vacation Request Form nº 3


-- Insira os dados na tabela [Department]


INSERT INTO [dbo].[Department]
(
	[Name]
)
VALUES
(
	'Administrativo'
);
GO


-- Insira os dados na tabela [Employee]


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
	6,
	'PT-BRG-AD-000100',
	'Maria',
	'Teresa',
	'Vale dos Santos',
	NULL,
	3
);
GO


-- Insira os dados na tabela [Request]


INSERT INTO [dbo].[Request]
(
	[EmployeeID], 
	[RequestDate], 
	[ApprovalDate]
)
VALUES
(
	5,
	'2019-03-04',
	'2019-03-13'
);
GO


-- Insira os dados na tabela [Vacation]


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
	3,
	'2019-02-04',
	'2019-02-15',
	NULL,
	'Yes'
),
(
	3,
	'2019-07-29',
	'2019-07-31',
	NULL,
	'Yes'
),
(
	3,
	'2019-12-23',
	'2019-12-31',
	NULL,
	'No'
);
GO


-- Insira os dados na tabela [RequestDetail]


INSERT INTO [dbo].[RequestDetail]
(
	[RequestID],
	[EmployeeID],
	[VacationID]
)
VALUES
(
	3,
	5,
	8
),
(
	3,
	5,
	9
),
(
	3,
	5,
	10
);
GO


-- Fim.