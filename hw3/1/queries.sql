-- INSERT INTO users(id, first_name, enabled) VALUES (1, 'john smith', FALSE);
-- INSERT INTO users(id, first_name, enabled, last_login) VALUES (2, 'Harry Potter', True, '2018-01-01 00:00:00');

-- a
-- INSERT INTO users VALUES ('John Smith', True);

-- b
-- INSERT INTO users(id, enabled) VALUES (3, FALSE);

-- c
-- INSERT INTO users(id, first_name, enabled) VALUES (1, 'Alissa Jackson', True);

-- d
-- UPDATE User SET User.id = null WHERE User.id = 2;

-- e
DELETE FROM users WHERE first_name='john smith';
