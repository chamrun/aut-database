
-- Phase 7: Assertions
-- Postgres
-- 1. Add an assertion that checks if the quantity of a spare part is greater than 0
ALTER TABLE SparePart
    ADD CONSTRAINT QuantityGreaterThanZero
        CHECK (Quantity > 0);

-- 2. Add an assertion that checks there would not
ALTER TABLE orders
ADD CONSTRAINT check_car_is_sold
CHECK (NOT (EXISTS (SELECT 1 FROM Car WHERE Car.VIN = Orders.OrderID AND Car.IsSold = true)));