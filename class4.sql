-- Создать схему task_4
create schema if not exists task_4;


-- Создать таблицы:
-- 1) Собака (task_4.dog): поля - автоинкрементируемый dog_id (см. SERIAL) - primary key,
--                                breed - порода (строка, не может быть NULL),
--                                name - кличка (строка)

create table if not exists task_4.dog(
    dog_id serial primary key,
    breed varchar not null,
    name varchar
);

-- 2) Владелец собаки (task_4.owner): поля - автоинкрементируемый owner_id,
--                                           name - имя ,
--                                           dog_id - id собаки, владельцем которой является (см. FOREIGN KEY)
--    При удалении собаки из таблицы dog все строки из owner с удаленными id также должны автоматически удалиться (см. CASCADE)

create table if not exists task_4.owner(
    owner_id serial,
    name varchar,
    dog_id serial references task_4.dog(dog_id)  on delete cascade
);

-- 3) Ветеринарная клиника (task_4.vet): поля - автоинкрементируемый vet_id,
--                                              date - дата визита (НЕ строка, почитайте про типы данных для дат),
--                                              dog_id - id собаки, которая была на приеме (см. FOREIGN KEY),
--                                              price - счет за прием (должен быть всегда > 0, см. CHECK).
--    Добавить ограничение RESTRICT на удаление из родительской таблицы

create table if not exists task_4.vet(
    vet_id serial primary key,
    date date not null,
    dog_id serial references task_4.dog(dog_id) on delete cascade,
    price numeric check(price > 0)
);

-- Запустить операции вставки
-- dog
INSERT INTO task_4.dog (breed, name) VALUES ('Золотистый ретривер', 'Майлз'),
                                            ('Лабрадор', 'Нала'),
                                            ('Корги', 'Джек'),
                                            ('Немецкая овчарка', 'Алтай'),
                                            ('Хаски', 'Раст');

-- Посмотреть, как работает автоинкремент, выведя все строки из таблицы dog :)

select *
from task_4.dog;

-- Запустить операции вставки
-- owner
INSERT INTO task_4.owner (name, dog_id) VALUES ('Михеева Татьяна', '1'),
                                               ('Иванов Иван', '3'),
                                               ('Дмитриев Дмитрий', '5'),
                                               ('Рудин Богдан', '2'),
                                               ('Коноплева Карина', '4');

INSERT INTO task_4.vet (date, dog_id, price) VALUES ('2023-03-15', 2, 500),
                                                    ('2023-03-11', 1, 750),
                                                    ('2022-09-13', 4, 899),
                                                    ('2022-11-15', 5, 4560),
                                                    ('2023-02-16', 3, 999);

-- Попробовать удалить строку с именем собаки Джек из таблицы dog. Что произойдет и почему?

delete from task_4.dog where name = 'Джек';
select *
from task_4.dog;

select *
from task_4.owner;

-- Ваш ответ:
-- как показал селект, удаляются и связанные данные из-за cascade. Иванов Иван удалился из таблицы так как он был вязан с Джеком.

-- Попробовать добавить в таблицу owner строку ниже. Что произойдет и почему?
INSERT INTO task_4.owner (name, dog_id) VALUES ('Имя Именное', 999);

-- Ваш ответ:
-- Нет собаки с id = 999, при таком инсерте, будет почти тоже самое как UB, то есть, нет собаки с таким ключом, и это будет нарушением ключа.
-- Попробовать добавить в таблицу vet строку ниже. Что произойдет и почему?

INSERT INTO task_4.vet (date, dog_id, price) VALUES ('2021-04-17', 1, -999);

-- Ваш ответ:
-- ломается условие цены, т.е. check(price < 0) выдаст false