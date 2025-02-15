CREATE DATABASE CarSell;

SHOW TABLES;

SELECT * FROM car_details;


USE CarSell;


CREATE TABLE car_details (
    carId INT AUTO_INCREMENT PRIMARY KEY,
    carName VARCHAR(500),
    price DECIMAL(10, 0),
    carCategory VARCHAR(45),
    year VARCHAR(255),
    photo VARCHAR(45),
    quantity INT
);

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(45),
    password VARCHAR(45),
    role INT
);


CREATE TABLE cart (
    cId INT AUTO_INCREMENT PRIMARY KEY,
    carId INT,
    uId INT,
    total_price FLOAT,
    quantity INT,
    FOREIGN KEY (carId) REFERENCES car_details(carId),
    FOREIGN KEY (uId) REFERENCES user(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(45),
    uId INT,
    address VARCHAR(500),
    car_name VARCHAR(500),
    quantity INT,
    price DECIMAL(10, 0),
    payment VARCHAR(45),
    date DATE,
    FOREIGN KEY (uId) REFERENCES user(id)
);

-- Chèn dữ liệu vào bảng user
INSERT INTO user (id, name, email, phone, password, role) VALUES 
(1, 'Nguyen Van A', 'a@example.com', '0987654321', 'password123', 1),
(2, 'Tran Thi B', 'b@example.com', '0977123456', 'password456', 2),
(3, 'Le Van C', 'c@example.com', '0968345678', 'password789', 1);


-- Chèn dữ liệu vào bảng car_details
INSERT INTO car_details (carId, carName, price, carCategory, year, photo, quantity) VALUES 
(1, 'Lexus R570', 520000000, 'New', '2010', 'new1.jpg', 1),
(2, 'BMW320I', 550000000, 'New', '2014', 'new2.jpg', 2),
(3, 'MercedesC200', 520000000, 'New', '2015', 'new3.jpg', 4),
(4, 'Raptor', 850000000, 'New', '2020', 'new4.png', 1),
(10, 'Toyota Camry', 450000000, 'New', '2012', 'new5.jpg', 3),
(11, 'Honda Accord', 480000000, 'New', '2013', 'new6.jpg', 2),
(12, 'Ford Mustang', 2000000000, 'New', '2018', 'new7.jpg', 1),
(13, 'Nissan GTR', 2200000000, 'New', '2021', 'new8.jpg', 1),
(14, 'Chevrolet Corvette', 5200000000, 'New', '2019', 'new9.jpg', 1),
(15, 'Audi A4', 600000000, 'New', '2016', 'new10.jpg', 2),
(34, 'LandRover', 400000000, 'Sale', '2008', 'sale1.jpg', 1),
(37, 'Toyota Vios', 280000000, 'Sale', '2012', 'sale2.jpg', 6),
(38, 'Honda Civic', 800000000, 'Trend', 'newYear', 'trend1.jpg', 0),
(39, 'Ford Everest', 350000000, 'Trend', '2015', 'trend2.jpg', 2),
(40, 'Toyota Hilux', 550000000, 'Trend', '2018', 'trend3.jpg', 2),
(41, 'VinfastLuxA', 500000000, 'New', '2020', 'sale3.jpg', 1);

-- Chèn dữ liệu vào bảng orders
INSERT INTO orders (id, order_id, uId, address, car_name, quantity, price, payment, date) VALUES 
(1, 'ORD-503', 3, 'hoa lac', 'Honda Civic', 2, 1600000000, 'COD', '2024-07-14'),
(2, 'ORD-217', 3, 'thai hoa town', 'VinfastLuxA', 1, 500000000, 'COD', '2024-07-14'),
(3, 'ORD-280', 3, 'nghe an', 'Nissan GTR', 1, 2200000000, 'COD', '2024-07-15'),
(4, 'ORD-126', 3, 'hoa lac', 'Honda Civic', 1, 800000000, 'COD', '2024-07-19'),
(5, 'ORD-407', 3, 'hoa lac', 'Honda Civic', 2, 1600000000, 'COD', '2024-07-19'),
(6, 'ORD-581', 3, 'fpt', 'VinfastLuxA', 2, 1000000000, 'COD', '2024-07-19');
