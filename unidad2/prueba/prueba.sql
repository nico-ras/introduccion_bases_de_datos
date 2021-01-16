DROP DATABASE IF EXISTS prueba;

CREATE DATABASE prueba;

\c prueba

CREATE TABLE category(
    id SERIAL PRIMARY KEY,
    kinds VARCHAR(30),
    descriptions VARCHAR(50)
);

CREATE TABLE product(
    id SERIAL PRIMARY KEY,
    names VARCHAR(30),
    descriptions VARCHAR(50),
    unit_price INT,
    category_id INT,
    FOREIGN KEY(category_id) REFERENCES category(id)
);

CREATE TABLE client(
    id SERIAL PRIMARY KEY,
    rut VARCHAR(10),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    client_address VARCHAR(50)
);

CREATE TABLE bill(
    id SERIAL PRIMARY KEY,
    client_id INT,
    issued_date DATE,
    FOREIGN KEY(client_id) REFERENCES client(id)

);



CREATE TABLE purchase(
    id SERIAL PRIMARY KEY,
    client_id INT,
    product_id INT,
    bill_id INT,
    cuantity INT,
    unit_price INT,
    total_price INT,
    FOREIGN KEY(product_id) REFERENCES 
    product(id),
    FOREIGN KEY(bill_id) REFERENCES
    bill(id),
    FOREIGN KEY(client_id) REFERENCES
    client(id)
);


CREATE TABLE price(
    id SERIAL PRIMARY KEY,
    client_id INT,
    bill_id INT,
    sub_total INT,
    IVA FLOAT,
    grand_total INT,
    FOREIGN KEY(bill_id) REFERENCES bill(id),
    FOREIGN KEY(client_id) REFERENCES client(id)
);


INSERT INTO client(rut, first_name, last_name, client_address)
VALUES ('13892648-4', 'Francisco', 'Gonzalez', 'Los coipos #506'),
       ('17332721-k', 'Willy', 'Pacheco', 'San Genaro #18364'),
       ('18957872-6', 'Jimena', 'Urrutia', 'Los olmos #2053'),
       ('13987961-8', 'Alex', 'Cremento', 'Pasaje la estrella #44'),
       ('15824771-1', 'Macarena', 'Poblete', 'Av. Los Andes #871');

INSERT INTO category( kinds, descriptions)
VALUES ('Perros', 'Alimentos organicos especializados para uso canino'),
       ('Gatos', 'Alimentos organicos y accesorios felinos'),
       ('Exoticos', 'Alimentos exoticos de diversas especies');

INSERT INTO product( names, descriptions, unit_price, category_id)
VALUES ('Cannisboom', 'alimento para perros 1 KG', 14990, 1),
        ('kittykat', 'Alimento para gatos premium 2kg', 24990, 2),
        ('Tortocrunch', 'Alimento para tortugas 3 kg', 12990, 3),
        ('Dogball', 'Pelota saltarina para perros', 4990, 1),
        ('Pecera led', 'Pecera 60*40*40 iluminada', 49990, 3),
        ('Rascador mural', 'Rascador para gato de pared', 24990, 2),
        ('Freshpuppy', 'Masticable para perros', 3990, 1),
        ('tickie arne', 'Arnes de paseo', 9990, 1);      

INSERT INTO bill(client_id, issued_date)
VALUES ( 1, '22-08-2020'),
       ( 1, '29-08-2020'),
       ( 2, '21-08-2020'),
       ( 2, '22-08-2020'),
       ( 2, '27-08-2020'),
       ( 3, '22-08-2020'),
       ( 4, '20-08-2020'),
       ( 4, '22-08-2020'),
       ( 4, '09-09-2020'),
       ( 4, '12-09-2020'); 

INSERT INTO purchase(client_id, product_id, bill_id, cuantity)      
VALUES ( 1, 5, 1, 1),
       ( 1, 3, 1, 1),
       ( 1, 2, 2, 2),
       ( 1, 6, 2, 1), 
       ( 1, 8, 2, 1), 
       ( 2, 7, 3, 5),
       ( 2, 1, 3, 2),
       ( 2, 4, 3, 2),
       ( 2, 2, 4, 2),
       ( 2, 6, 4, 1),
       ( 2, 8, 5, 1),
       ( 2, 4, 5, 1),
       ( 2, 1, 5, 1), 
       ( 3, 8, 6, 1), 
       ( 4, 2, 7, 1),
       ( 4, 7, 7, 2),
       ( 4, 4, 8, 1),
       ( 4, 6, 8, 1),
       ( 4, 8, 8, 1),
       ( 4, 1, 9, 2),
       ( 4, 3, 9, 1),
       ( 4, 7, 9, 1),
       ( 4, 2, 9, 2),
       ( 4, 5, 10, 1); 



       --interpretacion de 'productos' en el enunciado como 'tipo de productos' y no 'cantidad de productos', basado en la misma intruccion de: 'insertar 8 productos' como 8 'tipo de productos'.




UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=1) 
WHERE product_id = 1;

UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=2) 
WHERE product_id = 2;

UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=3) 
WHERE product_id = 3;

UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=4) 
WHERE product_id = 4;

UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=5) 
WHERE product_id = 5;

UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=6) 
WHERE product_id = 6;

UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=7) 
WHERE product_id = 7;

UPDATE purchase 
SET unit_price = (SELECT unit_price FROM product WHERE id=8) 
WHERE product_id = 8;


UPDATE purchase SET total_price = cuantity*unit_price;


INSERT INTO price( client_id, bill_id, IVA)
VALUES ( 1, 1, 19),
       ( 1, 2, 19),
       ( 2, 3, 19),
       ( 2, 4, 19),
       ( 2, 5, 19),
       ( 3, 6, 19),
       ( 4, 7, 19),
       ( 4, 8, 19),
       ( 4, 9, 19),
       ( 4, 10, 19);

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=1) WHERE bill_id=1;       
 
UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=2) WHERE bill_id=2; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=3) WHERE bill_id=3; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=4) WHERE bill_id=4; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=5) WHERE bill_id=5; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=6) WHERE bill_id=6; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=7) WHERE bill_id=7; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=8) WHERE bill_id=8; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=9) WHERE bill_id=9; 

UPDATE price SET sub_total = (SELECT SUM(total_price) FROM purchase WHERE bill_id=10) WHERE bill_id=10; 




UPDATE price SET grand_total = sub_total+(sub_total*(IVA/100));


--¿Que cliente realizó la compra más cara?

SELECT client.rut, client.first_name, client.last_name, price.grand_total FROM client INNER JOIN price ON client.id=price.client_id WHERE
grand_total IN (SELECT max(grand_total) FROM price);

--¿Que cliente pagó sobre 100.000 de monto?

SELECT client.rut, client.first_name, client.last_name, price.grand_total FROM client INNER JOIN price ON client.id=price.client_id WHERE
grand_total > 100000 ORDER BY grand_total DESC;

--¿Cuantos clientes han comprado el producto 6?


SELECT client.rut, client.first_name, client.last_name, purchase.cuantity  FROM client INNER JOIN purchase ON client.id=purchase.client_id WHERE purchase.product_id=6;