-- Phase 6: Transactions


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
