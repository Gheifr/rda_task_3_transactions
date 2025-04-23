
USE ShopDB; 


INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');
SET @order_id = LAST_INSERT_ID();

update Products set WarehouseAmount = @current_amount - 1 where Name = 'AwersomeProduct';

START TRANSACTION; 

SET @current_amount = (select WarehouseAmount from Products where Name = 'AwersomeProduct');
INSERT INTO OrderItems (OrderId, ProductId, Count) VALUES (
			@order_id,
			(SELECT id FROM Products WHERE Name = 'AwersomeProduct'),
			1);
            
            
COMMIT; 



