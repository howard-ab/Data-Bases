
-- #1
-- Функция, которая возвращает количество пловцов, зарегистрированных в заданном году:
create function GetSwimmerCountByYear(@year int)
returns int int
as
begin
    declare @SwimmerCount int;
    select @SwimmerCount = count(*)
    from swimmer
    where year(birth_date) = @year;
    return @SwimmerCount;
end;

-- "тестируем" следующим образом:
-- Тесты для первой функции:
-- проверяем, что функция возвращает корректное количество пловцов
-- зарегистрированных в заданном году
declare @year int = 2000;
declare @expectedCount int = 2;
declare @actualCount int = dbo.GetSwimmerCountByYear(@year);
if @expectedCount <> @actualCount
raiserror('Test failed: Expected %d, but got %d', 16, 1, @expectedCount, @actualCount);
else
PRINT 'Test passed';

-- Дальше:
-- проверяем, что функция возвращает 0, если в заданном году
-- не было зарегистрировано ни одного пловца
set @year = 1999;
set @expectedCount = 0;
set @actualCount = dbo.GetSwimmerCountByYear(@year);
if @expectedCount <> @actualCount
raiserror('Test failed: Expected %d, but got %d', 16, 1, @expectedCount, @actualCount);
else
print 'Test passed';
-- Этот код вызывает функцию GetSwimmerCountByYear с параметром 2000 и сохраняет результат в переменную @SwimmerCount. Затем он выводит значение переменной @SwimmerCount в консоль.

-- вторая версия:
-- проверяем, что функция возвращает 0, если в заданном году
-- не было зарегистрировано ни одного пловца
SET @year = 1999;
SET @expectedCount = 0;
SET @actualCount = dbo.GetSwimmerCountByYear(@year);
IF @expectedCount <> @actualCount
RAISERROR('Test failed: Expected %d, but got %d', 16, 1, @expectedCount, @actualCount);
ELSE
PRINT 'Test passed';



-- #2
-- процедура для получения списка всех соревнований в заданном году.

create function GetCompetitionsByYear(@year int)
returns table
as
return (
select *
from competition c
join olympiad o on c.olympiad_id = o.olympiad_id
where extract(year from o.olymp_date) = @year
);

-- Тесты для первой функции:
-- проверяем, что функция возвращает корректное количество пловцов
-- зарегистрированных в заданном году
declare @year int = 2000;
declare @expectedCount int = 2;
declare @actualCount int = dbo.GetSwimmerCountByYear(@year);
if @expectedCount <> @actualCount
raiserror('Test failed: Expected %d, but got %d', 16, 1, @expectedCount, @actualCount);
else
print 'Test passed';


-- Тесты для второй процедуры:
-- для функции GetCompetitionsByYear:
-- проверяем, что функция возвращает корректное количество соревнований
-- проведенных в заданном году
declare @year int = 2020;
declare @expectedCount int = 2;
declare @actualCount int = (select count(*) from dbo.GetCompetitionsByYear(@year));
if @expectedCount <> @actualCount
raiserror('Test failed: Expected %d, but got %d', 16, 1, @expectedCount, @actualCount);
else
PRINT 'Test passed';

-- проверяем, что функция возвращает 0, если в заданном году
-- не было проведено ни одного соревнования
set @year = 2022;
set @expectedCount = 0;
set @actualCount = (select count(*) from dbo.GetCompetitionsByYear(@year));
if @expectedCount <> @actualCount
raiserror('Test failed: Expected %d, but got %d', 16, 1, @expectedCount, @actualCount);
else
print 'Test passed';


