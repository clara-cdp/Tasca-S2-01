USE `PizzaPlanet`;

-- 1. Botigues
INSERT INTO STORE (address, postal_code, city, province) 
VALUES 
('Carrer 1', '28001', 'Madrid', 'Mad'),
('Avinguda Diagonal 45', '08001', 'Barcelona', 'Bcn'),
('Calle Betis 12', '41011', 'Sevilla', 'Sev');

-- 2. Empleats
INSERT INTO EMPLOYEE (name, surname, NIF, phone, STORE_idSTORE) 
VALUES 
('Carlos', 'Garcia', '12345678A', '+34 600111222', 1),
('Marta', 'Lopez', '87654321B', '+34 600333444', 2),
('Georgio', 'Milano', '12457896C', '+34 600123456', 3),
('Joan', 'Vila', '11223344X', '+34 611222333', 1),
('Sofia', 'Ruiz', '55667788Z', '+34 622444555', 2),
('Luis', 'Perez', '99887766Y', '+34 633555666', 3);

-- 3. Rols
INSERT INTO CHEF (EMPLOYEE_idEMPLOYEE) VALUES (1), (2), (3);
INSERT INTO DRIVER (EMPLOYEE_idEMPLOYEE) VALUES (4), (5), (6);

-- 4. PRODUCTES 
INSERT INTO PRODUCT (idPRODUCT, name, price, product_type, description) 
VALUES 
(1, 'Margherita Pizza', 10.50, 'pizza', 'Classic tomato and mozzarella'),
(2, 'Veggie Pizza', 11.50, 'pizza', 'Fresh veggies'),
(3, 'Pepperoni Pizza', 12.00, 'pizza', 'Classic pepperoni'),
(4, 'Cheese Burger', 8.50, 'burger', 'Beef patty with cheddar'),
(7, 'Coca-Cola', 2.50, 'drink', '330ml can'),
(8, 'Fanta Taronja', 2.50, 'drink', '330ml can'), 
(9, 'Aigua Mineral', 1.50, 'drink', '500ml water');  

-- 5. CATEGORIES 
INSERT INTO PIZZA_TYPE (name, PRODUCT_idPRODUCT) 
VALUES 
('Classic', 1), 
('Vegetarian', 2), 
('Spicy', 3);

-- 6. Clients
INSERT INTO CUSTOMER (name, surname, phone_number, address, postal_code, city, province) 
VALUES 
('Elena', 'Martínez', '+34 655123456', 'Calle Goya 5', '28001', 'Madrid', 'Mad'),
('Jorge', 'García', '+34 612345678', 'Calle Alcala 5', '28007', 'Madrid', 'Mad'),
('Jordi', 'Puig', '+34 688987654', 'Carrer Balmes 10', '08001', 'Barcelona', 'Bcn'),
('Ana', 'Sanz', '+34 600555444', 'Calle Sierpes 2', '41011', 'Sevilla', 'Sev');

-- 7. COMANDES
-- Comanda 1 (Lliurament a domicili)
INSERT INTO `ORDER` (order_type, date_time, order_total_amount, delivery_time, CUSTOMER_idCUSTOMER, STORE_idSTORE, DRIVER_EMPLOYEE_idEMPLOYEE, CHEF_EMPLOYEE_idEMPLOYEE) 
VALUES ('delivery', NOW(), 0.00, NOW(), 1, 1, 4, 1); 
SET @order1 = LAST_INSERT_ID(); 

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES (@order1, 1, 2, 10.50, 0), (@order1, 8, 4, 2.50, 0); 

-- Comanda 2 (Recollida en botiga, sense repartidor)
INSERT INTO `ORDER` (order_type, date_time, order_total_amount, delivery_time, CUSTOMER_idCUSTOMER, STORE_idSTORE, DRIVER_EMPLOYEE_idEMPLOYEE, CHEF_EMPLOYEE_idEMPLOYEE) 
VALUES ('pickup', NOW(), 0.00, NOW(), 2, 1, NULL, 1); 
SET @order2 = LAST_INSERT_ID();

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES (@order2, 4, 1, 8.50, 0); 

-- Comanda 3
INSERT INTO `ORDER` (order_type, date_time, order_total_amount, delivery_time, CUSTOMER_idCUSTOMER, STORE_idSTORE, DRIVER_EMPLOYEE_idEMPLOYEE, CHEF_EMPLOYEE_idEMPLOYEE) 
VALUES ('delivery', NOW(), 0.00, NOW(), 3, 2, 5, 2); 
SET @order3 = LAST_INSERT_ID();

INSERT INTO ORDER_DETAILS (ORDER_idORDER, PRODUCT_idPRODUCT, product_quanity, unit_price, line_total) 
VALUES (@order3, 2, 3, 12.00, 0), (@order3, 9, 4, 1.50, 0);