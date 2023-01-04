-- SELECT *
-- FROM Albums INNER JOIN Artists ON
-- Albums.artist_ID = Artists.artist_ID

-- SELECT *
-- FROM Artists LEFT OUTER JOIN Albums ON
-- Artists.artist_ID = Albums.artist_ID

-- SELECT *
-- FROM Artists RIGHT OUTER JOIN Albums ON
-- Artists.artist_ID = Albums.artist_ID

SELECT *
FROM Artists FULL OUTER JOIN Albums ON
Artists.artist_ID = null OR Albums.artist_ID = null