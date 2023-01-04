-- CREATE TABLE Artists
-- (
--     artist_ID   SERIAL PRIMARY KEY,
--     artist_Name VARCHAR NOT NULL
-- );


-- CREATE TABLE Albums
-- (
--     album_ID    SERIAL PRIMARY KEY,
--     album_Name  VARCHAR NOT NULL,
--     artist_ID   INTEGER NOT NULL REFERENCES Artists(artist_ID)
-- );

INSERT INTO Artists(artist_Name) VALUES ('Journy');
INSERT INTO Artists(artist_Name) VALUES ('Meat Loaf');
INSERT INTO Artists(artist_Name) VALUES ('Enya');
INSERT INTO Artists(artist_Name) VALUES ('Kate Wolf');
INSERT INTO Artists(artist_Name) VALUES ('Aerosmith');

INSERT INTO Albums(album_Name, artist_ID) VALUES ('Raised on Radio', 1);
INSERT INTO Albums(album_Name, artist_ID) VALUES ('Greatest Hits', 1);
INSERT INTO Albums(album_Name, artist_ID) VALUES ('Bat out of Hell', 2);
INSERT INTO Albums(album_Name, artist_ID) VALUES ('Dead Ringer', 2);
INSERT INTO Albums(album_Name, artist_ID) VALUES ('The Celts', 3);
INSERT INTO Albums(album_Name, artist_ID) VALUES ('Poet''s Heart', 4);