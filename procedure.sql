
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
-- Процедура, которая добавляет нового пловца в таблицу swimmer и возвращает его ID:
create procedure AddNewSwimmer
@swimmer_name varchar,
@birth_date char
as
begin
declare @swimmer_id int;
insert into swimmer (swimmer_name, birth_date)
values (@swimmer_name, @birth_date);
select @swimmer_id = scope_identity();
return @swimmer_id;
end;

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
-- проверяем, что процедура корректно добавляет нового пловца
declare @swimmer_name varchar(50) = 'John Doe';
declare @birth_date char(10) = '1990-05-12';
declare @expectedSwimmerId int = (select MAX(swimmer_id) from swimmer) + 1;
declare @actualSwimmerId int = dbo.AddNewSwimmer(@swimmer_name, @birth_date);
if @expectedSwimmerId <> @actualSwimmerId
raiserror('Test failed: Expected %d, but got %d', 16, 1, @expectedSwimmerId, @actualSwimmerId);
else if not exists (select * from swimmer where swimmer_id = @actualSwimmerId and swimmer_name = @swimmer_name and birth_date = @birth_date)
raiserror('Test failed: New swimmer was not added to the database', 16, 1);
else
print 'Test passed';


