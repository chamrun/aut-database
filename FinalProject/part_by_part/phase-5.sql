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