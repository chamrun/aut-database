-- Phase 9: Users and Roles

-- No write access to the database
-- read access to the database

CREATE USER
    john_doe
    WITH PASSWORD 'johndoe2000johndoe';

GRANT CONNECT ON DATABASE car_dealership TO john_doe;

GRANT USAGE ON SCHEMA public TO john_doe;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO john_doe;
