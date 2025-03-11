-- Таблица категорий товаров  
CREATE TABLE IF NOT EXISTS Categories (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД категории  
  name VARCHAR(50) UNIQUE NOT NULL  -- Название категории  
);  

-- Таблица поставщиков  
CREATE TABLE IF NOT EXISTS Suppliers (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД поставщика  
  name VARCHAR(50) NOT NULL,  -- Название поставщика  
  email VARCHAR(50) UNIQUE,  -- Электронная почта поставщика  
  phone CHAR(15)  -- Номер телефона поставщика  
);  

-- Таблица товаров  
CREATE TABLE IF NOT EXISTS Products (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД товара  
  name VARCHAR(100) NOT NULL,  -- Название товара  
  article VARCHAR(50) UNIQUE NOT NULL,  -- Артикул товара (SKU)  
  price DECIMAL(10, 2) NOT NULL,  -- Цена товара  
  unit VARCHAR(20),  -- Единица измерения товара  
  description TEXT,  -- Описание товара  
  category_id INT NOT NULL,  -- ИД категории товара  
  supplier_id INT NOT NULL,  -- ИД поставщика  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Дата и время создания товара  
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Дата и время последнего обновления товара  
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE RESTRICT,  
  CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE RESTRICT  
);  

-- Таблица статусов  
CREATE TABLE IF NOT EXISTS Status (  
  id SERIAL PRIMARY KEY,  -- ИД статуса  
  type VARCHAR(50),  -- Тип сущности для статуса (product, order, cart)  
  description TEXT  -- Описание статуса  
);  

-- Таблица корзин  
CREATE TABLE IF NOT EXISTS Carts (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД корзины  
  user_id INT NOT NULL,  -- ИД пользователя, которому принадлежит корзина  
  price DECIMAL(10, 2) NOT NULL,  -- Общая цена товара в корзине  
  discount_price DECIMAL(10, 2) NOT NULL,  -- Общая цена товара в корзине с примененной скидкой  
  status VARCHAR(50) NOT NULL,  -- Статус корзины  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP  -- Дата и время создания корзины  
);  

-- Таблица заказов  
CREATE TABLE IF NOT EXISTS Orders (  
  id INT PRIMARY KEY,  -- Уникальный ИД заказа  
  user_id INT NOT NULL,  -- ИД пользователя, сделавшего заказ  
  cart_id INT,  -- ИД корзины пользователя  
  price DECIMAL(10, 2) NOT NULL,  -- Общая сумма заказа  
  status VARCHAR(50) NOT NULL,  -- Статус заказа  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Дата и время оформления заказа  
  CONSTRAINT fk_cart FOREIGN KEY (cart_id) REFERENCES Carts(id) ON DELETE RESTRICT  
);  

-- Таблица скидок  
CREATE TABLE IF NOT EXISTS Discounts (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД скидки  
  value INT NOT NULL CHECK (value >= 0),  -- Кол-во процентов скидки  
  description VARCHAR(20) NOT NULL  -- Тип скидки  
);  

-- Таблица позиций в корзине  
CREATE TABLE IF NOT EXISTS Cart_Items (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД позиции в корзине  
  cart_id INT NOT NULL,  -- ИД корзины  
  product_id INT NOT NULL,  -- ИД товара  
  quantity INT NOT NULL,  -- Количество товара в данной позиции заказа  
  price DECIMAL(10, 2) NOT NULL,  -- Цена товара на момент покупки  
  discount_id INT NOT NULL,  -- ИД применяемой скидки  
  discount_price DECIMAL(10, 2) NOT NULL,  -- Цена товара со скидкой клиента  
  CONSTRAINT fk_cart_item_cart FOREIGN KEY (cart_id) REFERENCES Carts(id) ON DELETE RESTRICT,  
  CONSTRAINT fk_cart_item_product FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE RESTRICT,  
  CONSTRAINT fk_cart_item_discount FOREIGN KEY (discount_id) REFERENCES Discounts(id) ON DELETE RESTRICT  
);  

-- Таблица остатков товаров на складе  
CREATE TABLE IF NOT EXISTS Stocks (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД записи  
  product_id INT NOT NULL,  -- ИД товара  
  quantity INT NOT NULL,  -- Количество товара на складе  
  CONSTRAINT fk_stock_product FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE RESTRICT  
);  

-- Таблица поставок товаров  
CREATE TABLE IF NOT EXISTS Supplier_orders (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД поставки  
  supplier_id INT NOT NULL,  -- ИД поставщика  
  created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Дата и время создания заказа на поставку  
  delivery_date TIMESTAMP NOT NULL,  -- Дата поставки товара  
  status VARCHAR(50) NOT NULL,  -- Статус поставки  
  CONSTRAINT fk_supplier_order FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE RESTRICT  
);  

-- Таблица позиций в поставках товаров  
CREATE TABLE IF NOT EXISTS Supplier_order_items (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД позиции в поставке  
  supplier_orders_id INT NOT NULL,  -- ИД поставки  
  product_id INT NOT NULL,  -- ИД товара  
  quantity INT NOT NULL,  -- Количество поставляемого товара  
  order_price DECIMAL(10, 2) NOT NULL,  -- Себестоимость товара  
  purchasing_price DECIMAL(10, 2) NOT NULL,  -- Закупочная цена 1 ед товара  
  CONSTRAINT fk_supplier_order_item FOREIGN KEY (supplier_orders_id) REFERENCES Supplier_orders(id) ON DELETE RESTRICT,  
  CONSTRAINT fk_product_order_item FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE RESTRICT  
);  

-- Таблица отзывов о товарах  
CREATE TABLE IF NOT EXISTS Reviews (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД отзыва  
  product_id INT NOT NULL,  -- ИД товара, на который оставлен отзыв  
  user_id INT NOT NULL,  -- ИД пользователя, оставившего отзыв  
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),  -- Оценка товара (например, от 1 до 5)  
  comment TEXT,  -- Текст отзыва  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Дата и время оставления отзыва  
  CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE RESTRICT  
);  

-- Таблица логов заказов  
CREATE TABLE IF NOT EXISTS Order_Log (  
  id SERIAL PRIMARY KEY,  -- Уникальный ИД записи в логе заказа  
  order_id INT NOT NULL,  -- ИД заказа  
  status_id INT NOT NULL,  -- Статус заказа в логах  
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Дата и время изменения статуса  
  user_id INT,  -- ИД пользователя, осуществившего действие (если применимо)  
  CONSTRAINT fk_order_log_order FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE RESTRICT,  
  CONSTRAINT fk_order_log_status FOREIGN KEY (status_id) REFERENCES Status(id) ON DELETE RESTRICT  
);  
