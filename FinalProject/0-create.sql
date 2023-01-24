-- Postgres

-- Phase 2

-- Customer(first_name, last_name, national_id, address(street, city, province, country), phone_number)

CREATE TABLE Address
(
    AddressID int NOT NULL PRIMARY KEY,
    Street    VARCHAR(50),
    City      VARCHAR(50),
    Province  VARCHAR(50)
);

CREATE TABLE Customer
(
    CustomerID  int NOT NULL PRIMARY KEY,
    FirstName   VARCHAR(50),
    LastName    VARCHAR(50),
    NationalID  VARCHAR(50),
    AddressID   int NOT NULL,
    PhoneNumber VARCHAR(50),
    FOREIGN KEY (AddressID) REFERENCES Address (AddressID)
);

-- A Bad idea is to save all the addresses in the Customer table, which is not


-- Supplier(full_name, contract_start, contract_end, manager, address)

CREATE TABLE Supplier
(
    SupplierID    int NOT NULL PRIMARY KEY,
    ContractStart DATE,
    ContractEnd   DATE,
    ManagerName   VARCHAR(50),
    AddressID     int NOT NULL,
    FOREIGN KEY (AddressID) REFERENCES Address (AddressID)
);

CREATE TABLE Brand
(
    BrandID int NOT NULL PRIMARY KEY,
    Title   VARCHAR(50)
);

CREATE TABLE Model
(
    ModelID int NOT NULL PRIMARY KEY,
    BrandID int NOT NULL,
    Title   VARCHAR(50),
    FOREIGN KEY (BrandID) REFERENCES Brand (BrandID)
);



-- Each order has a customer. There are just 2 type of orders:
-- 1. Buy one or more cars
-- 2. Buy one or more spare parts

-- CREATE TABLE Orders
-- (
--     OrderID    int NOT NULL PRIMARY KEY,
--     CustomerID int NOT NULL,
--     FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
-- );

-- CREATE TABLE CarOrder
-- (
--     OrderID  int NOT NULL,
--     VIN      int NOT NULL,
--     Quantity int NOT NULL,
--     FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
--     FOREIGN KEY (VIN) REFERENCES Car (VIN)
-- );

-- CREATE TABLE SparePartOrder
-- (
--     OrderID     int NOT NULL,
--     SparePartID int NOT NULL,
--     Quantity    int NOT NULL,
--     FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
--     FOREIGN KEY (SparePartID) REFERENCES SparePart (SparePartID)
-- );

-- CREATE TABLE Orders
-- (
--     OrderID    int NOT NULL PRIMARY KEY,
--     CustomerID int NOT NULL,
--     Quantity   int NOT NULL,
--     ProductID  int NOT NULL,
--     FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
-- );
--
-- CREATE TABLE Product
-- (
--     ProductID   int NOT NULL PRIMARY KEY,
--     ProductType VARCHAR(50) CHECK (VALUE IN ('Car', 'SparePart'))
-- );

CREATE DOMAIN ProductType AS VARCHAR(50) CHECK (VALUE IN ('Car', 'SparePart'));

CREATE TABLE Product
(
    ProductID   int NOT NULL PRIMARY KEY,
    ProductType ProductType
);

CREATE TABLE Orders
(
    OrderID    int NOT NULL PRIMARY KEY,
    CustomerID int NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE OrderProduct
(
    OrderID   int NOT NULL,
    ProductID int NOT NULL,
    Quantity  int NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

-- Each car, has two options:
-- Options
-- 1. color: Blue, Black, White...
-- 2. transmission: manual, automatic

CREATE DOMAIN Transmission AS VARCHAR(50) CHECK (VALUE IN ('manual', 'automatic'));
CREATE DOMAIN Color AS VARCHAR(50) CHECK (VALUE IN ('blue', 'black', 'white', 'red'));

-- We can add any color, in this way:
ALTER DOMAIN Color ADD CONSTRAINT ColorCheck CHECK (VALUE IN ('blue', 'black', 'white', 'red', 'green', 'yellow'));


-- CREATE TABLE Car
-- (
--     VIN          int NOT NULL PRIMARY KEY,
--     Color        Color,
--     Transmission Transmission,
--     ModelID      int NOT NULL,
--     FOREIGN KEY (ModelID) REFERENCES Model (ModelID)
-- );

CREATE TABLE Car
(
    VIN          int NOT NULL PRIMARY KEY,
    Color        Color,
    Transmission Transmission,
    ModelID      int NOT NULL,
    ProductID    int NOT NULL,
    FOREIGN KEY (ModelID) REFERENCES Model (ModelID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);



-- CREATE TABLE SparePart
-- (
--     SparePartID int NOT NULL PRIMARY KEY,
--     Title       VARCHAR(50),
--     ModelID     int NOT NULL,
--     FOREIGN KEY (ModelID) REFERENCES Model (ModelID)
-- );

--  This is not good, because each SparePart can be used in different models, so:
-- 1. We should have a table that contains all the spare parts
-- 2. We should have a table that contains the relation between the spare parts and the models

-- CREATE TABLE SparePart
-- (
--     SparePartID int NOT NULL PRIMARY KEY,
--     Title       VARCHAR(50),
--     Price       int,
--     Quantity    int,
--     SupplierID  int NOT NULL,
--     FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
-- );

CREATE TABLE SparePart
(
    SparePartID int NOT NULL PRIMARY KEY,
    Title       VARCHAR(50),
    Price       int,
    Quantity    int,
    SupplierID  int NOT NULL,
    ProductID   int NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

CREATE TABLE ModelSparePart
(
    ModelID     int NOT NULL,
    SparePartID int NOT NULL,
    FOREIGN KEY (ModelID) REFERENCES Model (ModelID),
    FOREIGN KEY (SparePartID) REFERENCES SparePart (SparePartID)
);


-- Phase 3: Insert Data

-- 10 addresses
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (1, 'Street 1', 'City 1', 'Province 1');
INSERT INTO Address
VALUES (2, 'Street 2', 'City 2', 'Province 2');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (3, 'Street 3', 'City 3', 'Province 3');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (4, 'Street 4', 'City 4', 'Province 4');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (5, 'Street 5', 'City 5', 'Province 5');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (6, 'Street 6', 'City 6', 'Province 6');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (7, 'Street 7', 'City 7', 'Province 7');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (8, 'Street 8', 'City 8', 'Province 8');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (9, 'Street 9', 'City 9', 'Province 9');
INSERT INTO Address (AddressID, Street, City, Province)
VALUES (10, 'Street 10', 'City 10', 'Province 10');

-- 10 customers
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (1, 'FirstName 1', 'LastName 1', 'NationalID 1', 1, 'PhoneNumber 1');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (2, 'FirstName 2', 'LastName 2', 'NationalID 2', 2, 'PhoneNumber 2');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (3, 'FirstName 3', 'LastName 3', 'NationalID 3', 3, 'PhoneNumber 3');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (4, 'FirstName 4', 'LastName 4', 'NationalID 4', 4, 'PhoneNumber 4');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (5, 'FirstName 5', 'LastName 5', 'NationalID 5', 5, 'PhoneNumber 5');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (6, 'FirstName 6', 'LastName 6', 'NationalID 6', 6, 'PhoneNumber 6');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (7, 'FirstName 7', 'LastName 7', 'NationalID 7', 7, 'PhoneNumber 7');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (8, 'FirstName 8', 'LastName 8', 'NationalID 8', 8, 'PhoneNumber 8');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (9, 'FirstName 9', 'LastName 9', 'NationalID 9', 9, 'PhoneNumber 9');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (10, 'FirstName 10', 'LastName 10', 'NationalID 10', 10, 'PhoneNumber 10');

-- 4 suppliers
INSERT INTO Supplier (SupplierID, ContractStart, ContractEnd, ManagerName, AddressID)
VALUES (1, '2020-01-01', '2020-10-29', 'ManagerName 1', 1);
INSERT INTO Supplier (SupplierID, ContractStart, ContractEnd, ManagerName, AddressID)
VALUES (2, '2020-01-01', '2020-11-29', 'ManagerName 2', 2);
INSERT INTO Supplier (SupplierID, ContractStart, ContractEnd, ManagerName, AddressID)
VALUES (3, '2020-01-01', '2020-12-29', 'ManagerName 3', 3);
INSERT INTO Supplier (SupplierID, ContractStart, ContractEnd, ManagerName, AddressID)
VALUES (4, '2020-01-01', '2020-12-29', 'ManagerName 4', 4);

-- 8 SpareParts (and Products)
INSERT INTO Product (ProductID, ProductType)
VALUES (1, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (1, 'SparePart 1', 100, 10, 1, 1);

INSERT INTO Product (ProductID, ProductType)
VALUES (2, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (2, 'SparePart 2', 200, 20, 2, 2);

INSERT INTO Product (ProductID, ProductType)
VALUES (3, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (3, 'SparePart 3', 300, 30, 3, 3);

INSERT INTO Product (ProductID, ProductType)
VALUES (4, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (4, 'SparePart 4', 400, 40, 4, 4);

INSERT INTO Product (ProductID, ProductType)
VALUES (5, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (5, 'SparePart 5', 500, 50, 1, 5);

INSERT INTO Product (ProductID, ProductType)
VALUES (6, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (6, 'SparePart 6', 600, 60, 2, 6);

INSERT INTO Product (ProductID, ProductType)
VALUES (7, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (7, 'SparePart 7', 700, 70, 3, 7);

INSERT INTO Product (ProductID, ProductType)
VALUES (8, 'SparePart');
INSERT INTO SparePart (SparePartID, Title, Price, Quantity, SupplierID, ProductID)
VALUES (8, 'SparePart 8', 800, 80, 4, 8);

-- 2 Brands
INSERT INTO Brand (BrandID, Title)
VALUES (1, 'Brand 1');
INSERT INTO Brand (BrandID, Title)
VALUES (2, 'Brand 2');

-- 4 Models
INSERT INTO Model (ModelID, Title, BrandID)
VALUES (1, 'Model 1', 1);
INSERT INTO Model (ModelID, Title, BrandID)
VALUES (2, 'Model 2', 2);
INSERT INTO Model (ModelID, Title, BrandID)
VALUES (3, 'Model 3', 1);
INSERT INTO Model (ModelID, Title, BrandID)
VALUES (4, 'Model 4', 2);

-- 12 Cars
INSERT INTO Product (ProductID, ProductType)
VALUES (9, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (11111111, 'blue', 'manual', 1, 9);

INSERT INTO Product (ProductID, ProductType)
VALUES (10, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (22222222, 'red', 'manual', 2, 10);

INSERT INTO Product (ProductID, ProductType)
VALUES (11, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (33333333, 'black', 'manual', 3, 11);

INSERT INTO Product (ProductID, ProductType)
VALUES (12, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (44444444, 'blue', 'manual', 4, 12);

INSERT INTO Product (ProductID, ProductType)
VALUES (13, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (55555555, 'red', 'automatic', 1, 13);

INSERT INTO Product (ProductID, ProductType)
VALUES (14, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (66666666, 'black', 'automatic', 2, 14);

INSERT INTO Product (ProductID, ProductType)
VALUES (15, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (77777777, 'blue', 'automatic', 3, 15);

INSERT INTO Product (ProductID, ProductType)
VALUES (16, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (88888888, 'red', 'automatic', 4, 16);

INSERT INTO Product (ProductID, ProductType)
VALUES (17, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (99999999, 'black', 'manual', 1, 17);

INSERT INTO Product (ProductID, ProductType)
VALUES (18, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (10101010, 'blue', 'manual', 2, 18);

INSERT INTO Product (ProductID, ProductType)
VALUES (19, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (12121212, 'red', 'manual', 3, 19);

INSERT INTO Product (ProductID, ProductType)
VALUES (20, 'Car');
INSERT INTO Car (VIN, Color, Transmission, ModelID, ProductID)
VALUES (13131313, 'white', 'manual', 4, 20);


-- 3 Orders
INSERT INTO Orders (OrderID, CustomerID)
VALUES (1, 1);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (1, 1, 3);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (1, 2, 2);

INSERT INTO Orders (OrderID, CustomerID)
VALUES (2, 2);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (2, 3, 1);

INSERT INTO Orders (OrderID, CustomerID)
VALUES (3, 3);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (3, 4, 5);


-- Phase 4: Queries

INSERT INTO Address (AddressID, Street, City, Province)
VALUES (11, '212 Baker Street', 'London', 'London');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber)
VALUES (11, 'sherlock', 'holmes', '123456781011', 11, '+44796268462');

INSERT INTO Orders (OrderID, CustomerID)
VALUES (4, 11);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (4, 17, 38);

-- Update phone number of sherlock holmes to +447342780080
UPDATE Customer
SET PhoneNumber = '+447342780080'
WHERE CustomerID = 11;

-- Delete all customers who have no orders
DELETE
FROM Customer
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

-- Phase 5: Views

-- supplier_supplies view: a view that shows the supplies and the suppliers
CREATE VIEW supplier_supplies AS
SELECT Supplier.SupplierID,
       ContractStart,
       ContractEnd,
       ManagerName,
       AddressID,
       ProductID,
       SparePartID,
       Title,
       Price,
       Quantity
FROM Supplier,
     SparePart
WHERE Supplier.SupplierID = SparePart.SupplierID;

SELECT *
FROM supplier_supplies;

-- customer_orders view: a view that shows the orders and the customers
CREATE VIEW customer_orders AS
SELECT Customer.CustomerID,
       FirstName,
       LastName,
       NationalID,
       AddressID,
       PhoneNumber,
       Orders.OrderID,
       OrderProduct.ProductID,
       Quantity
FROM Customer,
     Orders,
     OrderProduct
WHERE Customer.CustomerID = Orders.CustomerID
  AND Orders.OrderID = OrderProduct.OrderID;

SELECT *
FROM customer_orders;

-- car_brand_model view: a view that shows the cars and the brands and the models
CREATE VIEW car_brand_model AS
SELECT VIN,
       Color,
       Transmission,
       ProductID,
       Model.ModelID,
       Model.Title as ModelTitle,
       Brand.BrandID,
       Brand.Title as BrandTitle
FROM Car,
     Model,
     Brand
WHERE Car.ModelID = Model.ModelID;

SELECT *
FROM car_brand_model;

-- Phase 6: Transactions

-- Postgres
-- 1. Add column "IsSold" to Car table, default value is false
ALTER TABLE Car
    ADD COLUMN IsSold boolean DEFAULT false;

-- 2. Update IsSold to true for all cars that have been ordered
UPDATE Car
SET IsSold = TRUE
WHERE ProductID IN (SELECT ProductID FROM OrderProduct);

SELECT ProductID
FROM OrderProduct;


-- A transaction that creates an order (for a car that has not been sold yet) and updates the IsSold column to true
BEGIN;
INSERT INTO Orders (OrderID, CustomerID)
VALUES (5, 1);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (5, 15, 1);
UPDATE Car
SET IsSold = TRUE
WHERE ProductID = 15;
COMMIT;

-- A transaction that creates an order (for a spare part) and updates the quantity of the spare part

BEGIN;
INSERT INTO Orders (OrderID, CustomerID)
VALUES (6, 1);
INSERT INTO OrderProduct (OrderID, ProductID, Quantity)
VALUES (6, 5, 1);
UPDATE SparePart
SET Quantity = Quantity - 1
WHERE SparePartID = 5;
COMMIT;


-- Phase 7: Assertions
-- Postgres
-- 1. Add an assertion that checks if the quantity of a spare part is greater than 0
ALTER TABLE SparePart
    ADD CONSTRAINT QuantityGreaterThanZero
        CHECK (Quantity > 0);

-- 2. Add an assertion that checks there would not
-- ALTER TABLE orders
-- ADD CONSTRAINT check_car_is_sold
-- CHECK (NOT (EXISTS (SELECT 1 FROM Car WHERE Car.VIN = Orders.OrderID AND Car.IsSold = true)));

-- Phase 8: index

-- index contractend on supplier table
CREATE INDEX ContractEnd
    ON Supplier (ContractEnd);

-- index quantity on sparepart table
CREATE INDEX Quantity
    ON SparePart (Quantity);

-- index phone number on customer table

CREATE INDEX PhoneNumber
    ON Customer (PhoneNumber);

-- index title of brands
CREATE INDEX BrandTitle
    ON Brand (Title);

