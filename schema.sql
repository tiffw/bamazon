CREATE DATABASE bamazon_DB;
USE bamazon_DB;
CREATE TABLE products (
  id INTEGER AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  department_name VARCHAR(100) NOT NULL,
  price DECIMAL (9, 2) NOT NULL,
  stock_quantity DECIMAL (5, 3) NOT NULL,
  PRIMARY KEY (id)
);