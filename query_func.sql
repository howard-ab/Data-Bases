-- 11.Агрегирующая функция - get_average_time_by_distance(style varchar, distance integer) - возвращает среднее время всех участников в заезде, имеющих заданный стиль и дистанцию.
create or replace function get_average_time_by_distance(style varchar, distance integer)
returns numeric as $$
begin
    return (
        select avg(distance_time)
        from competition
        where style = $1 and distance = $2
    );
end;
$$ language plpgsql;
--Эта функция принимает два параметра: "style" - стиль, и "distance" - дистанцию.
--Внутри функции выполняется запрос на выборку среднего значения (avg) времени (distance_time) из таблицы соревнований (competition), где значение поля "style" равно переданному параметру "style" и значение 
--поля "distance" равно переданному параметру "distance".
--В итоге, функция возвращает числовое значение - среднее время всех участников в заезде с заданным стилем и дистанцией.



-- 12. Функция смещения: (описание функции внизу)
create or replace function get_competition_by_distance(style varchar, distance integer, offset_val integer)
returns table (
swimmer_name varchar,
distance_time date
) as $$
begin
return query select swimmer_name, distance_time
from competition
where style = $1 and distance = $2
order by distance_time
offset offset_val
limit 10;
end;

--13. Функция ранжирования: (описание внизу)
create or replace function get_competition_rank_by_distance(style varchar, distance integer)
returns table (
swimmer_name varchar,
distance_time date,
rank integer
) as $$
begin
returns query select swimmer_name, distance_time, rank() over (order by distance_time asc )
from competition
where style = $1 and distance = $2;
end;
$$ LANGUAGE plpgsql;
-- Обе функции принимают два параметра: стиль и дистанцию, которые используются для фильтрации записей в таблице competition. Функция смещения также принимает третий параметр - смещение (offset_val), который используется для определения смещения относительно первой записи, возвращаемой запросом. Функция смещения возвращает первые 10 записей, начиная с указанного смещения. Функция ранжирования возвращает ранг каждого участника в заезде, основываясь на их времени на дистанции.
