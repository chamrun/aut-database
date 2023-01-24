-- Phase 10: Triggers

-- Postgres
-- A database logging system, using triggers

CREATE TABLE BrandLog
(
    ID        SERIAL PRIMARY KEY,
    BrandID   int,
    OldName   varchar(255),
    NewName   varchar(255),
    ChangedAt timestamp
);

-- Insertion

CREATE OR REPLACE FUNCTION log_brand_insertion()
    RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO BrandLog (BrandID, OldName, NewName, ChangedAt)
    VALUES (NEW.BrandID, NULL, NEW.Title, NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_brand_insertion
    AFTER INSERT
    ON Brand
    FOR EACH ROW
EXECUTE PROCEDURE log_brand_insertion();

INSERT INTO Brand (BrandID, Title)
VALUES (12, 'BMW');

-- update

CREATE OR REPLACE FUNCTION log_brand_update()
    RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO BrandLog (BrandID, OldName, NewName, ChangedAt)
    VALUES (OLD.BrandID, OLD.Title, NEW.Title, NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_brand_update
    AFTER UPDATE
    ON Brand
    FOR EACH ROW
EXECUTE PROCEDURE log_brand_update();

UPDATE Brand
SET Title = 'BMW'
WHERE BrandID = 12;
