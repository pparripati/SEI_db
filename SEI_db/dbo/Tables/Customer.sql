CREATE TABLE [dbo].[Customer] (
    [CustomerId]   UNIQUEIDENTIFIER NOT NULL,
    [CustomerName] NVARCHAR (255)   NOT NULL,
    [AddressLine1] NVARCHAR (255)   NULL,
    [AddressLine2] NVARCHAR (255)   NULL,
    [City]         NVARCHAR (255)   NULL,
    [State]        NVARCHAR (255)   NULL,
    [Zip]          NVARCHAR (15)    NULL,
    [Country]      NVARCHAR (60)    NULL, 
    [CreationDate] DATETIME NULL, 
    [CreationUser] NVARCHAR(255) NULL, 
    [LastUpdateDate] DATETIME NULL, 
    [LastUpdateUser] NVARCHAR(255) NULL, 
    CONSTRAINT [PK_Customer] PRIMARY KEY ([CustomerId])
);

