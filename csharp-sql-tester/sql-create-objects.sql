CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[Versioning] [timestamp] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL
) ON [PRIMARY]

GO

create proc [dbo].[GetData](
	@Var1 char(1) = 'N'
)
as
SELECT * FROM [dbo].[Item]
GO

INSERT INTO [dbo].[Item] ([Name], [CreatedAt], [UpdatedAt])
     VALUES ('Item 1', getdate(), null)
GO

INSERT INTO [dbo].[Item] ([Name], [CreatedAt], [UpdatedAt])
     VALUES ('Item 2', getdate(), null)
GO

INSERT INTO [dbo].[Item] ([Name], [CreatedAt], [UpdatedAt])
     VALUES ('Item 3', getdate(), null)
GO

INSERT INTO [dbo].[Item] ([Name], [CreatedAt], [UpdatedAt])
     VALUES ('Item 4', getdate(), null)
GO
