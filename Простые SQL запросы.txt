##Получите из таблицы products имена (name) товаров, которые закончились.
Решение:
SELECT name 
FROM products 
WHERE count = 0;

##Выберите из таблицы products название (name) и цены (price) товаров, стоимостью до 4000 включительно.
Решение:
SELECT name, price 
FROM products 
WHERE price <= 4000;

##Выберите из таблицы orders все заказы содержащие более 3 товаров (products_count).
##Вывести нужно только номер (id) и сумму (sum) заказа.
Решение
SELECT id, sum 
FROM orders 
WHERE products_count > 3;

##Выберите из таблицы orders все отмененные (cancelled) и возвращенные (returned) товары.
##Используйте IN.
Решение:
SELECT * 
FROM orders 
WHERE status in ('cancelled','returned');

##Выберите из таблицы orders все заказы, у которых сумма (sum) больше 3000 или количество товаров (products_count) от 3 и больше.
Решение:
SELECT *
FROM orders WHERE sum > 3000 or products_count >= 3;

##Выберите из таблицы orders все заказы, у которых сумма (sum) от 3000 и выше, а количество товаров (products_count) меньше 3.
Решение: 
SELECT * 
FROM orders 
WHERE sum >= 3000 and products_count < 3;

##Выберите из таблицы orders все отмененные заказы исключая заказы стоимостью от 3000 до 10000 рублей включительно.
Решение:
SELECT * 
FROM orders 
WHERE status = 'cancelled' AND (sum < 3000 or sum > 10000);

##Выберите из таблицы products все товары стоимостью 5000 и выше в порядке убывания цены (price).
Решение: SELECT * 
FROM products 
WHERE price >= 5000 
ORDER BY price desc;

##Выберите из таблицы products все товары стоимостью до 3000 рублей отсортированные в алфавитном порядке. Вывести нужно только имя (name), количество (count) и цену (price).
Решение:
SELECT name, count, price 
FROM products 
WHERE price < 3000 order by name;

##Выберите из таблицы users всех пользователей с зарплатой от 40 000 рублей и выше. Данные нужно сначала отсортировать по убыванию зарплаты (salary), а затем в алфавитном порядке по имени (first_name).
РЕШЕНИЕ:
SELECT * 
FROM users 
WHERE salary >= 40000 
ORDER BY salary DESC, first_name ASC;

##Выберите из таблицы products название и цены трех самых дешевых товаров, которые есть на складе.
Решение:
SELECT name, price 
FROM products 
WHERE count != 0 
ORDER BY price ASC 
LIMIT 3;

##В таблице products 17 записей. Сайт выводит название (name) и цену (price) товаров в алфавитном порядке, по 6 записей на страницу. Напишите SQL запрос для получения списка товаров для формирования последней страницы каталога.
##Товары, которых нет на складе, выводить не надо (таких товаров 3).
Решение:
SELECT name, price 
FROM products 
WHERE count != 0 
ORDER BY name, price 
LIMIT 12,5;
