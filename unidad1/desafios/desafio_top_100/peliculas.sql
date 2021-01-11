DROP DATABASE IF EXISTS films;

CREATE DATABASE films;

\c films

CREATE TABLE movies(
    id SERIAL PRIMARY KEY, 
    title VARCHAR(200), 
    year INT, 
    Director VARCHAR(50)
);

CREATE TABLE casts(
    id int,
    actor_name VARCHAR(50),
   
    FOREIGN KEY (id) REFERENCES movies(id)
);

\copy movies FROM '/home/nico/Escritorio/desafio latam/intro_base_de_datos/unidad1/desafios/desafio_top_100/Apoyo Desafío 2 -  Top 100/peliculas.csv' csv header;

\copy casts FROM '/home/nico/Escritorio/desafio latam/intro_base_de_datos/unidad1/desafios/desafio_top_100/Apoyo Desafío 2 -  Top 100/reparto.csv' csv header;

--SELECT actor_name, title, year, director FROM (SELECT * FROM movies WHERE id=2) AS x INNER JOIN casts ON x.id=casts.id;

--SELECT * FROM (SELECT * FROM casts WHERE actor_name='Harrison Ford') AS x INNER JOIN movies ON X.id=movies.id;

--SELECT director, count(director) FROM movies GROUP BY director  ORDER BY count(director) DESC LIMIT 10;q

--SELECT DISTINCT actor_name FROM casts ORDER BY actor_name ASC;

--SELECT * FROM movies WHERE year > 1989 AND year < 2000 ORDER BY title ASC;

--SELECT actor_name,title, year FROM (SELECT * FROM movies WHERE year=2001) AS movies_2001 INNER JOIN casts ON movies_2001.id=casts.id;

--SELECT actor_name, title, year, director FROM (SELECT * FROM movies ORDER BY year DESC LIMIT 1) AS last_movie INNER JOIN casts ON last_movie.id=casts.id;

