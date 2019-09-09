CREATE TABLE [dbo].[Product] (
    [ProductId]             UNIQUEIDENTIFIER NOT NULL,
    [ProductName]           NVARCHAR (255)   NOT NULL,
    [PricePerItem]          FLOAT (53)       NOT NULL,
    [AverageCustomerRating] FLOAT (53)       NULL, 
    [CreationDate] DATETIME NULL, 
    [CreationUser] NVARCHAR(255) NULL, 
    [LastUpdateDate] DATETIME NULL, 
    [LastUpdateUser] NVARCHAR(255) NULL, 
    CONSTRAINT [PK_Product] PRIMARY KEY ([ProductId])
);

