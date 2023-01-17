-- create table persons  (
--   name VARCHAR(50),
--   dad VARCHAR(50)
-- );

-- INSERT INTO persons VALUES ('a', 'b');
--
-- INSERT INTO persons VALUES ('b', 'c');
--
-- INSERT INTO persons VALUES ('c', 'd');

-- INSERT INTO persons VALUES ('d', 'e');
--
-- INSERT INTO persons VALUES ('e', 'f');
--

-- select all direct and indirect father (for a, it is b, c, d, e, f) using self join

select * from persons p1, persons p2 where p1.dad = p2.name;

-- above, only gives us first and second father. To get all, we need to do it recursively like this:

select * from persons p1, persons p2, persons p3 where p1.dad = p2.name and p2.dad = p3.name;