CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(15),
    direccion TEXT
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE SET NULL
);

CREATE TABLE Detalle_Venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE
);

INSERT INTO Clientes (nombre, correo, telefono, direccion) VALUES
('Juan Perez', 'juan@Gmail.com', '3001234567', 'Calle 123, Bogota'),
('Maria Gomez', 'maria@Gmail.com', '3109876543', 'Carrera 45, Medellin'),
('Carlos Rodriguez', 'carlos@Gmail.com', '3205678901', 'Avenida Siempre Viva, Cali');

INSERT INTO Productos (nombre, descripcion, precio, stock) VALUES
('Arroz', 'Paquete de 1kg', 5.500, 100),
('Leche', 'Botella de 1 litro', 3.750, 50),
('Pan', 'Paquete de 6 unidades', 2.250, 80);


INSERT INTO Ventas (id_cliente, total) VALUES
(1, 11.000), 
(2, 7.500),  
(3, 16.705); 

INSERT INTO Detalle_Venta (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 2, 5.500, 11.000),  
(2, 2, 2, 3.750, 7.500),   
(3, 3, 5, 2.250, 11.250);  


