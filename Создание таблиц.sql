﻿
##Создайте таблицу users с полем id типа INT и двумя текстовыми полями, которые будут хранить имя (first_name) и фамилию (last_name). Длина имени и фамилии не превышает 50 символов.
##Добавьте в таблицу трех пользователей: Дмитрия Иванова, Анатолия Белого и Дениса Давыдова.

Решение:
CREATE TABLE users (
id INT,
first_name VARCHAR (50),
last_name VARCHAR (50) 
);
INSERT INTO users (id, first_name, last_name) VALUES (1, 'Дмитрий', 'Иванов'), (2, 'Анатолий', 'Белый'), (3, 'Денис', 'Давыдов');

##Создайте таблицу clients со следующими полями:
id — автоинкрементальный первичный ключ.
first_name — имя, строка до 50 символов. NULL запрещен.
last_name — фамилия, строка до 50 символов. NULL запрещен.
email — электронный адрес, строка до 100 символов. NULL запрещен, все значения уникальные.
passport — серия и номер паспорта, строка до 10 символов. NULL запрещен, все значения уникальные.
Все уникальные ключи должны иметь те же имена, что и поля, для которых они создаются.

Решение: 
CREATE TABLE clients ( 
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR (50) NOT NULL, 
last_name VARCHAR (50) NOT NULL, 
email VARCHAR (100) NOT NULL, 
passport VARCHAR (10) NOT NULL, 
UNIQUE email (email), UNIQUE passport (passport));

##Создайте таблицу passports для хранения паспортов пользователей.
id — автоинкрементальный первичный ключ.
user_id — идентификатор пользователя, беззнаковый INT, NULL запрещен.
series — серия паспорта, строка до 4 символов, NULL запрещен.
number — номер паспорта, строка до 6 символов, NULL запрещен.
state — статус паспорта. Поле выбора одного из 2 вариантов: active (активный), expired (истекший). NULL запрещен, по умолчанию active.
Создайте уникальный ключ passport по двум полям: series и number.

Решение:
CREATE TABLE passports (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL, 
series VARCHAR (4) NOT NULL, 
number VARCHAR (6) NOT NULL,
state ENUM ('active','expired') NOT NULL DEFAULT 'active',
UNIQUE KEY passport (series,number));
