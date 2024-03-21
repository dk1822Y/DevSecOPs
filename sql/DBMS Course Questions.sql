/*
Some of the questions I was asked during my database management to solve. (Database Systems Management - DBMS)
Author: Khalid Diriye
*/

/*
Writing a store procedure that returns all store values.
*/
CREATE PROC sp_TotalSales
	@EmployeeID INT,
	@OrderID INT
AS 
BEGIN
	DECLARE @TotalPrice INT
	SELECT @TotalPrice = SUM(UnitPrice * Quantity)
	FROM OrderDetail od
	JOIN [Order] o
	ON od.OrderID = o.OrderID
	JOIN Employee e
	ON o.EmployeeID = e.EmployeeID
	WHERE e.EmployeeID = @EmployeeID

	RETURN @TotalPrice;
END;
			
EXEC sp_TotalSales
	@EmployeeID = 1, @OrderID = 1
--------------------------------------
/*
2. Creating a trigger on the OrderDetail table that updates the number of units in stock.
*/

CREATE TRIGGER dbo.TR_OrderDetailUnits ON OrderDetail
AFTER UPDATE, INSERT, DELETE
AS
   DECLARE @Event as char(1);
   DECLARE @Quantity as INT;
   DECLARE @UnitInStock as INT;

   SET @Quantity = (SELECT Quantity FROM OrderDetail);
   SET @UnitInStock = (SELECT UnitsInStock FROM Product);

   SET @Event = (case when EXISTS(select * 
                                     from inserted)
                            AND EXISTS(select * 
							             from deleted) then 
					      'U'  
                       when EXISTS(select * from inserted) then 
					      'I'  
                       when EXISTS(select * from deleted) then 
					      'D'
                   end);

   IF(@Event = 'U')
   BEGIN

		IF (@Quantity > @UnitInStock) 
		BEGIN
			PRINT('Sorry you cant do that')
		END
		ELSE
		BEGIN
			PRINT('Inserted')
		END
	  
   END;

   IF(@Event = 'I')
   BEGIN
		IF (@Quantity > @UnitInStock) 
		BEGIN
			PRINT('Sorry you cant do that')
		END
		ELSE
		BEGIN
			PRINT('Inserted')
		END
	  
   END;

   IF(@Event = 'D')
   BEGIN
		IF (@Quantity > @UnitInStock) 
		BEGIN
			PRINT('Sorry you cant do that')
		END
		ELSE
		BEGIN
			PRINT('Inserted')
		END
	  
   END;

UPDATE OrderDetail
SET Quantity = 2
WHERE ProductID = 75;

SELECT * FROM Product

SELECT * FROM OrderDetail
--------------------------------------
/*
3.	From problem 2 use a stored procedure instead of a trigger. (20pts)
*/

CREATE PROC sp_OrderDetailUnits
AS
BEGIN 
	declare @count int
	set @count = @@TRANCOUNT 
	if @count > 0 --Already in a transaction
	begin
		save transaction flag -- create save-point
	end
	else
	begin
		begin transaction-- define new transaction
	end
	begin try
		BEGIN

			BEGIN
				UPDATE OrderDetail
				SET Quantity = (SELECT Quantity FROM OrderDetail)
				WHERE OrderID IN (SELECT od.OrderID
									FROM OrderDetail i
									JOIN OrderDetail od
									ON i.ProductID = od.ProductID
									JOIN [Order] o
									ON od.OrderID = o.OrderID
									WHERE o.ShippedDate IS NULL);
			END;

		   if @count = 0
		      commit transaction;
		   end
		end try
		begin catch
		if @count > 0		
			begin
				raiserror('rollback to save proc',16,1)
				rollback transaction flag
			end
		else
			begin
				 DECLARE 	@ErrorNo 	int,
   		        @Message	nvarchar(4000)
                SELECT
   	               @ErrorNo 	= ERROR_NUMBER(),
   	               @Message 	= ERROR_MESSAGE()
	            	RAISERROR (@Message, 16, 1);
	            	rollback transaction;
			end
		end catch
end;
--------------------------------------
/*
4. Write a trigger that saves all the changes made to a product table
*/

create table ProductAudit (
	ProductID INT,
	ProductName VARCHAR(250),
	SupplierID INT,
	CategoryID INT,
	QuantityPerUnit VARCHAR(250),
	UnitPrice NUMERIC(10,2),
	UnitsInStock INT,
	UnitsOnOrder INT,
	ReOrderLevel INT,
	Discountined INT,
	--SUSER_SNAME VARCHAR(250),
	--getdate VARCHAR(250),

);
go


CREATE TRIGGER dbo.TR_Productdeleteinsertupdate
ON Product	
AFTER INSERT,Update, DELETE
AS
   DECLARE @Event as char(1);
   SET @Event = (case when EXISTS(select * 
                                     from inserted)
                            AND EXISTS(select * 
							             from deleted) then 
					      'U'  
                       when EXISTS(select * from inserted) then 
					      'I'  
                       when EXISTS(select * from deleted) then 
					      'D'
                   end);

   IF(@Event = 'U')
   BEGIN
		PRINT 'Product Updated'
		insert into [ProductAudit]
		select * from inserted;
	  
   END;

   IF(@Event = 'I')
   BEGIN
		PRINT 'Product Inserted'
		insert into [ProductAudit]
		select * from inserted;
   END;

   IF(@Event = 'D')
   BEGIN
	PRINT 'Product Deleted'
      delete from Product
      where ProductID IN (select ProductID from Deleted);
      
      insert into [ProductAudit]
	  select * from deleted;
   END;


go

SELECT * 
FROM Product

UPDATE Product
SET ProductName = 'GG'
WHERE ProductName = 'Chang';

UPDATE Product
SET ProductName = 'NCS'
WHERE ProductName = 'Northwoods Cranberry Sauce';

DELETE FROM Product
WHERE ProductName = 'Sam';

SELECT * 
FROM ProductAudit

/*
ProductID   ProductName                                                                                                                                                                                                                                                SupplierID  CategoryID  QuantityPerUnit                                                                                                                                                                                                                                            UnitPrice                               UnitsInStock UnitsOnOrder ReOrderLevel Discontinued
----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------- ----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------- ------------ ------------ ------------ ------------
2           GG                                                                                                                                                                                                                                                         1           1           24 - 12 oz bottles                                                                                                                                                                                                                                         19.00                                   17           40           25           0
8           NCS                                                                                                                                                                                                                                                        3           2           12 - 12 oz jars                                                                                                                                                                                                                                            40.00                                   6            0            0            0

(2 row(s) affected)
*/
--------------------------------------
/*
5.	Write a user defined function that takes in the following input variable:
'{8} (One Day Delivery) |(507) 888-4444|' 
*/
USE [Sales] --CompanyName
GO
CREATE FUNCTION [dbo].[fn_ParenthesesCName](@String VARCHAR(250))
	RETURNS VARCHAR(250)
AS 
BEGIN 
	DECLARE @CompanyName VARCHAR(250);
	SELECT @CompanyName= SUBSTRING(@String, 
									CHARINDEX('(',@String) +1,
									CHARINDEX(')',@String) -CHARINDEX('(',@String) -1
									);
	RETURN @CompanyName 
END;


-----------------------------------------------------------------

USE [Sales] --ShipperID
GO
CREATE FUNCTION [dbo].[fn_ParenthesesShipID](@String VARCHAR(250))
	RETURNS VARCHAR(250)
AS 
BEGIN 
	DECLARE @ShipperID VARCHAR(250);
	SELECT @ShipperID = SUBSTRING(@String, 
									CHARINDEX('{',@String) +1,
									CHARINDEX('}',@String) -CHARINDEX('{',@String) -1
									);
	RETURN @ShipperID 
END;


-----------------------------------------------------------------

USE [Sales] --Phone
GO
CREATE FUNCTION [dbo].[fn_ParenthesesPhone](@String VARCHAR(250))
	RETURNS VARCHAR(250)
AS 
BEGIN 
	DECLARE @Phone VARCHAR(250);
	SELECT @Phone = SUBSTRING(@String, 
									CHARINDEX('|',@String) +1,
									CHARINDEX('|',@String) -CHARINDEX('',@String) -1
									);
	RETURN @Phone
END;


SELECT dbo.fn_ParenthesesShipID('{4} (One Day Delivery) |(507) 888-4444|') AS ShipperID, dbo.fn_ParenthesesCName('{4} (One Day Delivery) |(507) 888-4444|') AS CompanyName, dbo.fn_ParenthesesPhone('{4} (One Day Delivery) |(507) 888-4444|') AS Phone


/*
ShipperID                                                                                                                                                                                                                                                  CompanyName                                                                                                                                                                                                                                                Phone
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4                                                                                                                                                                                                                                                          One Day Delivery                                                                                                                                                                                                                                           (507) 888-4444|

(1 row(s) affected)
*/

