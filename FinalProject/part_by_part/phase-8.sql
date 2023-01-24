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

