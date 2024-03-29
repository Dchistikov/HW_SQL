﻿##Таблицы users и roles связаны отношением многие ко многим через таблицу users_roles.
Получите всех программистов компании.
Выведите id пользователя, его имя и фамилию. Данные отсортируйте по фамилии.

Решение:
SELECT u.id, u.first_name,u.last_name 
FROM users_roles as us
JOIN users as u ON u.id = us.user_id
JOIN roles as r ON r.id = us.role_id 
WHERE r.name = 'Программист'
ORDER BY u.last_name;

##Таблицы users и roles связаны отношением многие ко многим через таблицу users_roles.
Получите список всех сотрудников, которые не выполняют ни одной роли.
Выведите id, имена и фамилии таких сотрудников. Данные отсортируйте по id.

Решение:
SELECT
users.*
FROM users
LEFT JOIN users_roles as ur ON ur.user_id = users.id
LEFT JOIN roles ON ur.role_id = roles.id
GROUP BY users.id
HAVING COUNT(roles.id) = 0
ORDER BY id

##Таблицы users и roles связаны отношением многие ко многим через таблицу users_roles.
В компании произошли небольшие изменения и вам необходимо внести соответствующие правки в таблицы:
    1. Уберите Светлану Иванову из менеджеров.
    2. Сделайте менеджером Анастасию Дейчман.
    3. Назначьте Александра Дмитриева программистом.

Решение: 
DELETE FROM users_roles WHERE role_id = 1 AND user_id = 2;
INSERT INTO users_roles (role_id, user_id) VALUES (1, 9);
INSERT INTO users_roles (role_id, user_id) VALUES (3, 10);

##Таблицы users, roles и projects связаны отношением многие ко многим через таблицу users_rp.
Такая «тройная» связь позволяет задавать роли пользователей в конкретных проектах.

Получите состав команды с указанием ролей для проекта «Сайт оконный»
Выведите id, имена и фамилии сотрудников, а также их роли в поле role.
Данные отсортируйте по фамилии.

Решение: 
SELECT u.*, r.name as role 
FROM users_rp as us
JOIN users as u ON u.id = us.user_id 
JOIN roles as r ON us.role_id = r.id
LEFT JOIN projects as pr ON pr.id = us.project_id 
WHERE pr.name ='Сайт Оконный'
ORDER BY u.last_name;

##1. Таблица orders содержит список заказов пользователей и связана с users отношением один ко многим через поле user_id.
2. Также orders связана отношением многие ко многим с таблицей products через таблицу orders_details, что дает возможность указывать какие именно товары находятся в заказе. Одна запись в orders_details соответствует одному заказанному товару.
3. Поле count в таблице products отвечает за количество товаров на складе.
Получите выполненные заказы с указанием количества и стоимости товаров в них.
Выведите три поля: id заказа, количество товаров в заказе (в поле products) и сумму заказа (в поле amount).
Данные отсортируйте по сумме заказа.

Решение: 
SELECT 
   o.id,
   COUNT(p.id) as products,
   SUM(p.price) as amount
FROM orders as o
JOIN orders_details as od ON od.order_id = o.id
JOIN products as p ON od.product_id = p.id
WHERE o.status = 'success'
GROUP BY o.id
ORDER BY amount