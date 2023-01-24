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

CREATE DOMAIN Transmission AS VARCHAR(50) CHECK (VALUE IN ('manual', 'automatic'));
CREATE DOMAIN Color AS VARCHAR(50) CHECK (VALUE IN ('blue', 'black', 'white', 'red'));

ALTER DOMAIN Color ADD CONSTRAINT ColorCheck CHECK (VALUE IN ('blue', 'black', 'white', 'red', 'green', 'yellow'));


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

