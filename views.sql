-- Тест для этих представлений лежит в ветке testing_brach, и для первых 6 тестов
-- имя файла - test_{соответствующий номер}view.py
-- то есть, тест написан без учета разделения представлений по пунктам 9.1 и 9.2.

-- 9.1:
-- 2-3 получаются сокрытием полей с персональными данными клиентов из таблицы, а
-- также сокрытием технических полей. Для сокрытия полей с персональными данными
-- недостаточно просто целиком удалить столбец с данными. Например, для поля
-- CARD_NO можно использовать маскировку вида 4276********0000.
-- Бонусом вместе с кодом можно приложить тесты для представлений.

-- #1
-- Представление всех участников соревнований, сокрытие поля с номером карты (CARD_NO).

create view participant_view as
select
    swimmer_id,
    swimmer_name,
    to_char(birth_date, 'DD-MM-YYYY') as birth_date,
    country_nm,
  case
    when card_no is not null
      then concat(substring(card_no, 1, 4), '********', substring(card_no, -4))
    else null
  end as masked_card_no
from swimmer;

-- #2
-- Представление медицинского персонала для каждой олимпиады, без отображения технических полей.
create view medical_staff_view as
select
    m.medstaff_name,
    o.country,
    o.olymp_date,
    m.priority
from medical_staff m
join olympiad o on m.olympiad_id = o.olympiad_id;

-- #3
-- Представление всех участников команд и их тренеров, сокрытие технических полей.
create view team_view as
select
    s.swimmer_id,
    s.swimmer_name,
    s.country_nm,
    c.name as coach_name
from team t
join swimmer s on t.swimmer_id = s.swimmer_id
join coach c on t.coach_id = c.coach_id;

-- #4
-- Представление всех участников и результатов на каждой олимпиаде.
create view competition_results_view as
select
    c.competition_id,
    s.swimmer_name,
    o.country,
    o.olymp_date,
    c.style,
    c.distance,
    c.distance_time
from competition c
join swimmer s on c.swimmer_id = s.swimmer_id
join olympiad o on c.olympiad_id = o.olympiad_id;

-- #5
-- Представление сводной статистики участников на каждой олимпиаде, включая их результаты.
create view olympiad_stats_view as
select
    o.country,
    o.olymp_date,
    count(c.competition_id) as num_competitions,
    min(c.distance_time) as min_time,
    max(c.distance_time) as max_time,
    avg(c.distance_time) as avg_time
from competition c
join olympiad o on c.olympiad_id = o.olympiad_id
group by o.country, o.olymp_date;

-- #6
-- Представление списка участников и их результатов в конкретной стране на всех олимпиадах.
create view country_results_view as
select
    s.swimmer_name,
    o.country,
    o.olymp_date,
    c.style,
    c.distance,
    c.distance_time
from competition c
join swimmer s on c.swimmer_id = s.swimmer_id
join olympiad o on c.olympiad_id = o.olympiad_id
where o.country = 'Russia';

-- 9.2
-- 3-4 получаются соединением нескольких таблиц с целью получения осмысленной
-- сводной таблицы, например, хранящей некоторую статистику продаж/частот
-- обращения клиента и т.д.
-- Бонусом вместе с кодом можно приложить быть тесты для представлений.

-- Представление 7:
-- Получение статистики по количеству медицинских работников на каждой олимпиаде.
create view medical_staff_count as
select
    o.olympiad_id,
    o.olymp_date,
    count(m.med_id) as med_staff_count
from olympiad o
join medical_staff m on o.olympiad_id = m.olympiad_id
group by o.olympiad_id, o.olymp_date;


-- Представление 8:
-- Получение списка всех плавцов, их тренеров и номеров команд на каждой олимпиаде.
create view team_roster as
select
    t.swimmer_id,
    s.swimmer_name,
    t.coach_id,
    c.name as coach_name,
    t.contruct_nom,
    o.olympiad_id,
    o.olymp_date
from team t
join swimmer s on t.swimmer_id = s.swimmer_id
join coach c on t.coach_id = c.coach_id
join competition comp on t.swimmer_id = comp.swimmer_id
join olympiad o on comp.olympiad_id = o.olympiad_id;

-- Представление 9:
-- Получение списка всех участников соревнований, их стиля плавания и результатов на каждой олимпиаде.
create view competition_results as
select c.competition_id, s.swimmer_name, s.birth_date, s.country_nm, o.olympiad_id, o.olymp_date, c.style, c.distance, c.distance_time
from competition c
join swimmer s on c.swimmer_id = s.swimmer_id
join olympiad o on c.olympiad_id = o.olympiad_id;