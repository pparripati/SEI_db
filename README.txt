The database project is created in Visual Studio 2017 based of SQL Server 2016 SP1

Publishing the database project will create a new database called "SEI"

3 new Tables will be created Customer, Order, Product

The database project will also insert seed data

Note:
1) In order to publish the database project please provide a valid connection to SQL server.
2) If for any reason the database project cannot be published then please execute below scripts in order
	a) .\SEI_db\dbo\Tables\Customer.sql
	b) .\SEI_db\dbo\Tables\Product.sql
	c) .\SEI_db\dbo\Tables\Order.sql
	d) .\SEI_db\SeedData.sql