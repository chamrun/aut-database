-- Postgres

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
