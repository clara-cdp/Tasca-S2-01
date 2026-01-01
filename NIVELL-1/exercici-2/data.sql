
INSERT INTO STORE (address, postal_code, city, province) 
VALUES 
('Calle Mayor 1', '28001', 'Madrid', 'Madrid'),
('Avinguda Diagonal 45', '08001', 'Barcelona', 'Barcelona'),
('Calle Betis 12', '41011', 'Sevilla', 'Sevilla');

INSERT INTO EMPLOYEE (name, surname, NIF, phone, STORE_idSTORE) 
VALUES 
('Carlos', 'Garcia', '12345678A', '+34 600111222', 1),
('Marta', 'Lopez', '87654321B', '+34 600333444', 1),
('Joan', 'Vila', '11223344X', '+34 611222333', 2),
('Sofia', 'Ruiz', '55667788Z', '+34 622444555', 2),
('Luis', 'Perez', '99887766Y', '+34 633555666', 3);

INSERT INTO CHEF (EMPLOYEE_idEMPLOYEE) 
VALUES (1), (3);

INSERT INTO DRIVER (EMPLOYEE_idEMPLOYEE) 
VALUES (2), (4), (5);

INSERT INTO PIZZA_TYPE (name) 
VALUES ('Classic'), ('Vegetarian'), ('Spicy');

INSERT INTO PRODUCT (name, price, image_url, description) 
VALUES 
('Margherita Pizza', 10.50, 'p_margherita.jpg', 'Tomato sauce, basil and mozzarella: for the classic ones.'),--1
('Pepperoni Pizza', 12.00, 'p_pepperoni.jpg', 'Classic pepperoni'),--2
('Veggie Pizza', 11.50, 'p_veggie.jpg', 'Fresh peppers, champis, and black olives'),--3

INSERT INTO PIZZA (PRODUCT_idPRODUCT, PIZZA_TYPE_idPIZZA_TYPE) 
VALUES 
(1, 1), (2, 3), (3, 2);

INSERT INTO PRODUCT (name, price, image_url, description) 
VALUES 
('Cheese Burger', 8.50, 'b_Cheese.jpg', 'Beef patty with cheddar'),--4
('Double Cheese Burger', 9.50, 'b_Double.jpg', 'Double Beef patty with cheddar: double the flavour!'),--5
('Classic',9.5,'Classic_b.jpg','BLT with cheese')--6

INSERT INTO BURGUER (PRODUCT_idPRODUCT)
VALUES 
(4),(5),(6);

('Coca-Cola', 2.50, 'coke.jpg', '330ml can'),--7
('Fanta', 2.50, 'coke.jpg', '330ml can'),--8
('Water', 1.50, 'water.jpg', '500ml still water');--9
INSERT INTO DRINK (PRODUCT_idPRODUCT) 
VALUES 
(7), (8),(9);


INSERT INTO CUSTOMER (name, surname, phone_number, address, postal_code, city, province) VALUES 
('Elena', 'Martínez', '+34 655123456', 'Calle Goya 5', '28001', 'Madrid', 'Mad'),
('Jordi', 'Puig', '+34 688987654', 'Carrer Balmes 10', '08001', 'Barcelona', 'Bcn'),
('Ana', 'Sanz', '+34 600555444', 'Calle Sierpes 2', '41011', 'Sevilla', 'Sev');
('Jorge', 'García', '+34 612345678', 'Calle Alcala 5', '28007', 'Madrid', 'Mad'),

