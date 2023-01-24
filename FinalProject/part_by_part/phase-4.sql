INSERT INTO Address (AddressID, Street, City, Province)
VALUES (11, '212 Baker Street', 'London', 'London');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (11, 'sherlock', 'holmes', '123456781011', 11, '+44796268462');

INSERT INTO Orders (OrderID, CustomerID)
VALUES (4, 11);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (4, 17, 38);

UPDATE Customer
SET PhoneNumber = '+447342780080'
WHERE CustomerID = 11;

DELETE
FROM Customer
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
