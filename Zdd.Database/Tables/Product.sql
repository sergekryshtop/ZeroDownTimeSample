﻿CREATE TABLE [dbo].[Product]
(
	[TenantId] BIGINT NOT NULL,
    [Id] BIGINT NOT NULL,
    [Name] NVARCHAR(128) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
    [Description] nvarchar(max),
    [CategoryId] BIGINT NOT NULL,
 	[MakeFlag] bit NOT NULL CONSTRAINT [DF_Product_MakeFlag]  DEFAULT ((1)),
	[FinishedGoodsFlag] bit NOT NULL CONSTRAINT [DF_Product_FinishedGoodsFlag]  DEFAULT ((1)),
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [int] NOT NULL,
	[ReorderPoint] [int] NOT NULL,
	[StandardCost] [decimal](8, 2) NOT NULL,
	[ListPrice] [decimal](8, 2) NOT NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nvarchar](3) NULL,
	[WeightUnitMeasureCode] [nvarchar](3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[DaysToManufacture] [int] NOT NULL,
	[ProductLine] [nvarchar](2) NULL,
	[Class] [nvarchar](2) NULL,
	[Style] [nvarchar](2) NULL,
	[ProductSubCategoryId] BIGINT NULL,
	[ProductModelId] BIGINT NULL,
	[SellStartDate] [datetime] NOT NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NOT NULL  CONSTRAINT [DF_Product_ModifiedDate]  DEFAULT (getdate()),
	CONSTRAINT [PK__Product] PRIMARY KEY CLUSTERED (TenantId ASC, Id ASC),
	CONSTRAINT [UQ__Product] UNIQUE (Id ASC),
	CONSTRAINT [FK__Product__ProductModel] FOREIGN KEY([ProductModelId], TenantId) REFERENCES dbo.[ProductModel] (Id, TenantId),
	CONSTRAINT [FK__Product__ProductSubcategory] FOREIGN KEY([ProductSubCategoryId], TenantId) REFERENCES dbo.[ProductSubCategory] (Id, TenantId),
	

) 

