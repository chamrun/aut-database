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

-- Each car, has two options:
-- Options
-- 1. color: Blue, Black, White...
-- 2. transmission: manual, automatic

CREATE DOMAIN Transmission AS VARCHAR(50) CHECK (VALUE IN ('manual', 'automatic'));
CREATE DOMAIN Color AS VARCHAR(50) CHECK (VALUE IN ('blue', 'black', 'white', 'red'));
ALTER DOMAIN Color ADD CONSTRAINT ColorCheck CHECK (VALUE IN ('blue', 'black', 'white', 'red', 'green', 'yellow'));


CREATE TABLE Car
(
    VIN          int NOT NULL PRIMARY KEY,
    Color        VARCHAR(50),
    Transmission Transmission,
    ModelID      int NOT NULL,
    FOREIGN KEY (ModelID) REFERENCES Model (ModelID)
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

CREATE TABLE SparePart
(
    SparePartID int NOT NULL PRIMARY KEY,
    Title       VARCHAR(50),
    Price       int,
    Quantity    int,
    SupplierID  int NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
);

CREATE TABLE ModelSparePart
(
    ModelID     int NOT NULL,
    SparePartID int NOT NULL,
    FOREIGN KEY (ModelID) REFERENCES Model (ModelID),
    FOREIGN KEY (SparePartID) REFERENCES SparePart (SparePartID)
);


-- Each order has a customer. There are just 2 type of orders:
-- 1. Buy one or more cars
-- 2. Buy one or more spare parts

CREATE TABLE Orders
(
    OrderID    int NOT NULL PRIMARY KEY,
    CustomerID int NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE CarOrder
(
    OrderID  int NOT NULL,
    VIN      int NOT NULL,
    Quantity int NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (VIN) REFERENCES Car (VIN)
);

CREATE TABLE SparePartOrder
(
    OrderID     int NOT NULL,
    SparePartID int NOT NULL,
    Quantity    int NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (SparePartID) REFERENCES SparePart (SparePartID)
);



-- Phase 3: Insert Data

-- 10 addresses
INSERT INTO Address (AddressID, Street, City, Province) VALUES (1, 'Street 1', 'City 1', 'Province 1');
INSERT INTO Address VALUES (2, 'Street 2', 'City 2', 'Province 2');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (3, 'Street 3', 'City 3', 'Province 3');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (4, 'Street 4', 'City 4', 'Province 4');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (5, 'Street 5', 'City 5', 'Province 5');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (6, 'Street 6', 'City 6', 'Province 6');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (7, 'Street 7', 'City 7', 'Province 7');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (8, 'Street 8', 'City 8', 'Province 8');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (9, 'Street 9', 'City 9', 'Province 9');
INSERT INTO Address (AddressID, Street, City, Province) VALUES (10, 'Street 10', 'City 10', 'Province 10');

-- 10 customers
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (1, 'FirstName 1', 'LastName 1', 'NationalID 1', 1, 'PhoneNumber 1');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (2, 'FirstName 2', 'LastName 2', 'NationalID 2', 2, 'PhoneNumber 2');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (3, 'FirstName 3', 'LastName 3', 'NationalID 3', 3, 'PhoneNumber 3');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (4, 'FirstName 4', 'LastName 4', 'NationalID 4', 4, 'PhoneNumber 4');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (5, 'FirstName 5', 'LastName 5', 'NationalID 5', 5, 'PhoneNumber 5');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (6, 'FirstName 6', 'LastName 6', 'NationalID 6', 6, 'PhoneNumber 6');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (7, 'FirstName 7', 'LastName 7', 'NationalID 7', 7, 'PhoneNumber 7');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (8, 'FirstName 8', 'LastName 8', 'NationalID 8', 8, 'PhoneNumber 8');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (9, 'FirstName 9', 'LastName 9', 'NationalID 9', 9, 'PhoneNumber 9');
INSERT INTO Customer (CustomerID, FirstName, LastName, NationalID, AddressID, PhoneNumber) VALUES (10, 'FirstName 10', 'LastName 10', 'NationalID 10', 10, 'PhoneNumber 10');


