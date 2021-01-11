 -- TE ASEGURAS CON EL "IF" DE QUE EXISTA EL ARCHIVO
DROP DATABASE IF EXISTS filmstudios;

CREATE DATABASE filmstudios;

\c filmstudios;

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    year INT,
    director VARCHAR(100)
);

CREATE TABLE casting (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    movie_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies (id)
);

copy movies(name, year, director) FROM '/Users/bea/Desktop/SQL/peliculas.csv' DELIMITER ',' CSV header;
copy casting(movie_id, name) FROM '/Users/bea/Desktop/SQL/reparto.csv' DELIMITER ',' CSV header;

SELECT movies.name, year, director, casting.name FROM movies 
INNER JOIN casting ON movies.id = casting.movie_id 
WHERE movies.name = 'Titanic';

SELECT  year, movies.name FROM movies  
INNER JOIN casting ON movies.id = casting.movie_id 
WHERE casting.name = 'Harrison Ford'
ORDER BY year;

SELECT director, count(director) AS "movies" FROM movies
GROUP BY director
ORDER BY "movies" DESC 
LIMIT 10;

SELECT count(DISTINCT name) AS "Numeros de Actores" FROM casting;

SELECT year, name FROM movies
WHERE year > 1989 AND year < 2000
ORDER BY name;

SELECT year, casting.name, movies.name AS "movie" FROM movies
INNER JOIN casting ON movies.id = casting.movie_id
WHERE year = 2001; 

SELECT casting.name, movies.name FROM casting
INNER JOIN movies ON movies.id = casting.movie_id 
WHERE year IN (SELECT max(year) FROM movies);

