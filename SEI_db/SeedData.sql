/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements to insert SEED Data in Product, Customer, Order table that will be appended to the build script.		
		 Use SQLCMD syntax to include a file in the post-deployment script.			
		 Example:      :r .\myfile.sql								
		 Use SQLCMD syntax to reference a variable in the post-deployment script.		
		 Example:      :setvar TableName MyTable							
					   SELECT * FROM [$(TableName)]				
--------------------------------------------------------------------------------------
*/
IF NOT EXISTS( SELECT 1 FROM Product WHERE [ProductName] = 'Physlux')
	INSERT INTO Product ([ProductId], [ProductName], [PricePerItem], [AverageCustomerRating], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES('ED3098CD-2F92-420D-ABA7-0B50C46F5AEC', 'Physlux', 9.99, 4.4, GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

IF NOT EXISTS( SELECT 1 FROM Product WHERE [ProductName] = 'Roundtrax')
	INSERT INTO Product ([ProductId], [ProductName], [PricePerItem], [AverageCustomerRating], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES('A347DBA4-0E76-4ACE-A66F-31BBC68EB23B', 'Roundtrax', 14.99, 3.2, GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

IF NOT EXISTS( SELECT 1 FROM Product WHERE [ProductName] = 'Zerlam')
	INSERT INTO Product ([ProductId], [ProductName], [PricePerItem], [AverageCustomerRating], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES('303AFA15-B03F-4508-830F-53EDA4CC8573', 'Zerlam', 69.17, 4.8, GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

IF NOT EXISTS( SELECT 1 FROM Product WHERE [ProductName] = 'Ranflex')
	INSERT INTO Product ([ProductId], [ProductName], [PricePerItem], [AverageCustomerRating], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES('9B3BFF26-FFA3-4402-B0C4-A5F20EAE9917', 'Ranflex', 12.49, 3, GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

IF NOT EXISTS( SELECT 1 FROM Product WHERE [ProductName] = 'Kintip')
	INSERT INTO Product ([ProductId], [ProductName], [PricePerItem], [AverageCustomerRating], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES('D00CF1F0-F3AB-4336-930E-A8CB53C23A36', 'Kintip', 87.59, 3.5, GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')
----------------------------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM SEI.dbo.Customer WHERE [CustomerName] = 'John Doe')
	INSERT INTO SEI.dbo.Customer ([CustomerId], [CustomerName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [Country], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES ('4F4BB36A-5828-4428-A4FF-7DAF9501AA53', 'John Doe', '58 South 4th St.', NULL, 'Bethlehem', 'PA', 18015, 'U.S.A', GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

IF NOT EXISTS (SELECT 1 FROM SEI.dbo.Customer WHERE [CustomerName] = 'Lorie J. Hannah')
	INSERT INTO SEI.dbo.Customer ([CustomerId], [CustomerName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [Country], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES ('5ABB57F2-A153-4A24-82FA-D32C3F45FAB6', 'Lorie J. Hannah', '2128 Sherman Street', NULL, 'Lawrence', 'KS', 66044, 'U.S.A', GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

IF NOT EXISTS (SELECT 1 FROM SEI.dbo.Customer WHERE [CustomerName] = 'Ryan M. Kruse')
	INSERT INTO SEI.dbo.Customer ([CustomerId], [CustomerName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [Country], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES ('2208CD7A-7CA0-43D1-864D-F48C3D309CEA', 'Ryan M. Kruse', '3557 Duck Creek Road', NULL, 'Daly City', 'CA', 94015, 'U.S.A', GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

----------------------------------------------------------------------------------------------------------------------------------------

DECLARE @ProductId uniqueidentifier,
		@CustomerId uniqueidentifier,
		@ItemPrice float		

IF NOT EXISTS ( SELECT TOP 1 1 FROM SEI.dbo.[Order])
BEGIN

	SELECT @ProductId = ProductId, @ItemPrice = [PricePerItem] FROM SEI.dbo.Product WHERE ProductName= 'Physlux'
	SELECT @CustomerId = CustomerId FROM SEI.dbo.Customer WHERE CustomerName= 'John Doe'

	INSERT INTO SEI.dbo.[Order]([OrderId], [ProductId], [CustomerId], [OrderDate], [Quantity], [PricePaid], [ShippedDate], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES (NEWID(), @ProductId, @CustomerId, '09/01/2019', 5, 5 * @ItemPrice, '09/02/2019', GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')


	SELECT @ProductId = ProductId, @ItemPrice = [PricePerItem] FROM SEI.dbo.Product WHERE ProductName= 'Roundtrax'
	SELECT @CustomerId = CustomerId FROM SEI.dbo.Customer WHERE CustomerName= 'Lorie J. Hannah'

	INSERT INTO SEI.dbo.[Order]([OrderId], [ProductId], [CustomerId], [OrderDate], [Quantity], [PricePaid], [ShippedDate], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES (NEWID(), @ProductId, @CustomerId, '09/05/2019', 6, 6 * @ItemPrice, '09/7/2019', GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')


	SELECT @ProductId = ProductId, @ItemPrice = [PricePerItem] FROM SEI.dbo.Product WHERE ProductName= 'Zerlam'
	SELECT @CustomerId = CustomerId FROM SEI.dbo.Customer WHERE CustomerName= 'Ryan M. Kruse'

	INSERT INTO SEI.dbo.[Order]([OrderId], [ProductId], [CustomerId], [OrderDate], [Quantity], [PricePaid], [ShippedDate], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES (NEWID(), @ProductId, @CustomerId, '09/06/2019', 2, 2 * @ItemPrice, NULL, GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')


	SELECT @ProductId = ProductId, @ItemPrice = [PricePerItem] FROM SEI.dbo.Product WHERE ProductName= 'Kintip'
	SELECT @CustomerId = CustomerId FROM SEI.dbo.Customer WHERE CustomerName= 'John Doe'

	INSERT INTO SEI.dbo.[Order]([OrderId], [ProductId], [CustomerId], [OrderDate], [Quantity], [PricePaid], [ShippedDate], [CreationDate], [CreationUser], [LastUpdateDate], [LastUpdateUser])
	VALUES (NEWID(), @ProductId, @CustomerId, '09/06/2019', 3, 3 * @ItemPrice, NULL, GETDATE(), 'dbProject_seeddata', GETDATE(), 'dbProject_seeddata')

END