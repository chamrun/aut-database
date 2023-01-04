CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    enabled    BOOLEAN                  DEFAULT TRUE,
    last_login TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

