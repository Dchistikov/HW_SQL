-- ДОБАВЛЕНИЕ ДАННЫХ

-- Добавьте в таблицу users нового пользователя Антона Пепеляева с датой рождения 12 июля 1992 года        
-- Решение:
INSERT INTO users (id, first_name, last_name, birthday)
VALUES (9, 'Антон', 'Пепеляев', '1992-07-12');

-- Новые записи в таблицу можно добавить не только с помощью VALUES, но и с помощью SET.
-- Решение:
INSERT INTO users
SET id = 10, first_name = 'Никита', last_name = 'Петров';

##Добавьте одним SQL запросом в таблицу products следующие товары:
* iPhone 7, цена 59990, 1 шт.
* iPhone 8, цена 64990, 3 шт.
* iPhone X, цена 79900, 2 шт.
Решение:
INSERT INTO products (id, name, count, price)
VALUES 
         (8, 'iPhone 7', 1, 59990), 
         (9, 'iPhone 8', 3, 64990), 
         (10, 'iPhone X', 2, 79900);

#ОБНОВЛЕНИЕ ДАННЫХ# 

##Увеличьте в таблице users сотрудникам, у которых зарплата менее 20 000 рублей, зарплату (salary) на 10%.
Решение:
UPDATE users 
SET salary = salary * 1.1 
WHERE salary < 20000;

##Измените статус (status) заказа под номером (id) 5 с delivery на success.
Решение: 
UPDATE orders 
SET  status = 'success' 
Where id = 5;

##Увеличьте цену 5 самых дешевых товаров на 5%.
Решение: 
UPDATE products 
SET price = price * 1.05 
ORDER BY price ASC 
LIMIT 5;

##Уменьшите цену 5 самых дорогих товаров на 5000 рублей.
Решение: 
UPDATE products
SET price=price -5000
ORDER BY price DESC
LIMIT 5;

##В магазин привезли 2 упаковки Сникерса и 2 упаковки Марса. В каждой упаковке по 20 шоколадок. 
Обновите данные так, чтобы они отражали правильное количество шоколадок.
Решение: 
UPDATE products 
SET count = count + (2*20) 
WHERE id in (3,5);

#УДАЛЕНИЕ ДАННЫХ#

##Удалите из таблицы cars все автомобили начиная с 2010 года и старше
Решение:
DELETE FROM cars 
WHERE year <= 2010;

##Удалите из таблицы cars все корейские (country = "KR") автомобили, а также все автомобили мощностью (power) меньше 80 лс.
Решение:
DELETE FROM cars 
WHERE country = 'KR' OR power < 80;

##Удалите из таблицы cars все японские автомобили мощностью менее 80 и более 130 лс. (включая крайние значения).
Решение: 
DELETE FROM cars 
WHERE country = 'JP' and (power <= 80 or power >= 130);

##Удалите из таблицы cars все даннные с помощью инструкции TRUNCATE.
Решение:
TRUNCATE TABLE cars
