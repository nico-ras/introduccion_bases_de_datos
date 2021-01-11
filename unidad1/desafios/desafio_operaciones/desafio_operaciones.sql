DROP DATABASE IF EXISTS posts;

CREATE DATABASE posts;

\c posts

CREATE TABLE post(
  id SMALLINT PRIMARY KEY,
  username VARCHAR(25), 
  created_at DATE,
  content VARCHAR(25),
  description VARCHAR(50)
);

INSERT INTO post (id, username, created_at, content, description) 
VALUES (1, 'Pamela', '2019-03-06', 'post de pamela1', 'descripcion post1'),
       (2, 'Pamela', '2019-05-11', 'post de pamela2', 'descripcion post2'),
       (3, 'Carlos', '2019-06-21', 'post de Carlos', 'descripcion post3');



ALTER TABLE post ADD title VARCHAR(25);

UPDATE post SET title='titulopost1' WHERE id=1;

UPDATE post SET title='titulopost2' WHERE id=2;

UPDATE post SET title='titulopost3' WHERE id=3;


INSERT INTO post (id, username, created_at, content, description, title) 
VALUES (4, 'Pedro', '2019-06-21', 'post de Pedro4', 'descripcion post4', 'titulopost4'),
       (5, 'Pedro', '2019-06-22', 'post de Pedro5', 'descripcion post5', 'titulopost5');


DELETE FROM post WHERE id=3;

INSERT INTO post (id, username, created_at, content, description, title) 
VALUES (6, 'Carlos', '2019-07-07', 'post de Carlos6', 'descripcion post6', 'titulopost6');



CREATE TABLE comments(
    id  SMALLINT PRIMARY KEY, 
    created_at TIMESTAMP, 
    content VARCHAR(300),
    post_id INT,
    FOREIGN KEY (post_id) REFERENCES post(id)
);

INSERT INTO comments (id, created_at, content, post_id) 
VALUES (1, '2019-03-06 10:35:00', 'comentario es..', 1),
       (2, '2020-01-11 19:29:15', 'comentario es..', 1),
       (3, '2020-01-12 01:40:08', 'comentario es..', 6),
       (4, '2020-02-28 16:50:13', 'comentario es..', 6),
       (5, '2020-03-01 13:20:04', 'comentario es..', 6),
       (6, '2020-03-09 04:10:50', 'comentario es..', 6);

INSERT INTO post (id, username, created_at, content, description, title) 
VALUES (7, 'Margarita', '2020-03-10', 'post de margarita7', 'descripcion post7', 'titulopost7');

INSERT INTO comments (id, created_at, content, post_id) 
VALUES (7, '2020-04-11 19:29:15', 'comentario es..', 7),
       (8, '2020-04-12 01:40:08', 'comentario es..', 7),
       (9, '2020-04-28 16:50:13', 'comentario es..', 7),
       (10, '2020-05-01 13:20:04', 'comentario es..', 7),
       (11, '2020-05-09 04:10:50', 'comentario es..', 7);












