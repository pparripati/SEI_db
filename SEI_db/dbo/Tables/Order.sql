CREATE TABLE [dbo].[Order] (
    [OrderId]     UNIQUEIDENTIFIER NOT NULL,
    [ProductId]   UNIQUEIDENTIFIER NOT NULL,
    [CustomerId]  UNIQUEIDENTIFIER NOT NULL,
    [OrderDate]   DATETIME         NULL,
    [Quantity]    INT       NULL,
    [PricePaid]   FLOAT (53)       NULL,
    [ShippedDate] DATETIME         NULL, 
    [CreationDate] DATETIME NULL, 
    [CreationUser] NVARCHAR(255) NULL, 
    [LastUpdateDate] DATETIME NULL, 
    [LastUpdateUser] NVARCHAR(255) NULL, 
    CONSTRAINT [PK_Order] PRIMARY KEY ([OrderId]), 
    CONSTRAINT [FK_Order_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId]), 
    CONSTRAINT [FK_Order_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId])
);

