-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
----------------------------------------- Практическое задание (соединения) -------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Создать схему topic_3:

CREATE SCHEMA topic_3;
SET search_path = topic_3;

-- Создать в этой схеме таблицу department с полями department_nm и location_txt
-- и таблицу salary с полями employee_nm, department_nm и salary

CREATE TABLE IF NOT EXISTS topic_3.salary (
	employee_nm VARCHAR(30),
	department_nm VARCHAR(30),
	salary int
);

CREATE TABLE IF NOT EXISTS topic_3.department (
	department_nm VARCHAR(30),
	location_txt VARCHAR(30)
);

-- Запустить операции вставки, полученные от семинариста

-- table 'salary'
INSERT INTO topic_3.salary VALUES('Ken Sánchez', 'HR', 78);
INSERT INTO topic_3.salary VALUES('TerriLee Duffy', 'HR', 95);
INSERT INTO topic_3.salary VALUES('Roberto Tamburello', 'HR', 382);
INSERT INTO topic_3.salary VALUES('Rob Walters', 'HR', 16);
INSERT INTO topic_3.salary VALUES('Gail Erickson', 'HR', 1079);
INSERT INTO topic_3.salary VALUES('Jossef Gibson', 'HR', 102);
INSERT INTO topic_3.salary VALUES('Dylan Miller', 'HR', 486);
INSERT INTO topic_3.salary VALUES('Diane Margheim', 'HR', 1953);
INSERT INTO topic_3.salary VALUES('Gigi Matthew', 'SALE', 49);
INSERT INTO topic_3.salary VALUES('Michael Raheem', 'SALE', 71);
INSERT INTO topic_3.salary VALUES('Ovidiu Cracium', 'SALE', 94);
INSERT INTO topic_3.salary VALUES('Thierry Hers', 'SALE', 61);
INSERT INTO topic_3.salary VALUES('Janice Galvin', 'SALE', 972);
INSERT INTO topic_3.salary VALUES('Michael Sullivan', 'SALE', 849);
INSERT INTO topic_3.salary VALUES('Sharon Salavaria', 'SALE', 715);
INSERT INTO topic_3.salary VALUES('David Michael', 'SALE', 94);
INSERT INTO topic_3.salary VALUES('Kevin Brown', 'R&D', 891);
INSERT INTO topic_3.salary VALUES('John Wood', 'R&D', 1486);
INSERT INTO topic_3.salary VALUES('Mary Dempsey', 'R&D', 176);
INSERT INTO topic_3.salary VALUES('Wanida Benshoof', 'R&D', 49);
INSERT INTO topic_3.salary VALUES('Terry Eminhizer', 'R&D', 381);
INSERT INTO topic_3.salary VALUES('Sariya Harnpadoungsataya', 'R&D', 946);
INSERT INTO topic_3.salary VALUES('Mary Gibson', 'R&D', 486);
INSERT INTO topic_3.salary VALUES('Jill Williams', 'R&D', 19);
INSERT INTO topic_3.salary VALUES('James Hamilton', 'R&D', 46);
INSERT INTO topic_3.salary VALUES('Peter Krebs', 'R&D', 445);
INSERT INTO topic_3.salary VALUES('Jo Brown', 'R&D', 666) ;
INSERT INTO topic_3.salary VALUES('Guy Gilbert', 'MANAGEMENT', 482);
INSERT INTO topic_3.salary VALUES('Mark McArthur', 'MANAGEMENT', 12);
INSERT INTO topic_3.salary VALUES('Britta Simon', 'MANAGEMENT', 194);
INSERT INTO topic_3.salary VALUES('Margie Shoop', 'MANAGEMENT', 481);
INSERT INTO topic_3.salary VALUES('Rebecca Laszlo', 'MANAGEMENT', 16);
INSERT INTO topic_3.salary VALUES('Annik Stahl', 'MANAGEMENT', 134);
INSERT INTO topic_3.salary VALUES('Suchitra Mohan', 'R&D', 87);
INSERT INTO topic_3.salary VALUES('Brandon Heidepriem', 'R&D', 111) ;
INSERT INTO topic_3.salary VALUES('Jose Lugo', 'R&D', 185);
INSERT INTO topic_3.salary VALUES('Chris Okelberry', 'R&D', 94);
INSERT INTO topic_3.salary VALUES('Kim Abercrombie', 'R&D', 348);
INSERT INTO topic_3.salary VALUES('Ed Dudenhoefer', 'R&D', 68);
INSERT INTO topic_3.salary VALUES('JoLynn Dobney', 'R&D', 346);
INSERT INTO topic_3.salary VALUES('Bryan Baker', 'R&D', 185);
INSERT INTO topic_3.salary VALUES('James Kramer', 'SUPPORT', 965);
INSERT INTO topic_3.salary VALUES('Nancy Anderson', 'SUPPORT', 444);
INSERT INTO topic_3.salary VALUES('Simon Rapier', 'SUPPORT', 133);
INSERT INTO topic_3.salary VALUES('Thomas Michaels', 'SUPPORT', 200);
INSERT INTO topic_3.salary VALUES('Eugene Kogan', 'SUPPORT', 144);
INSERT INTO topic_3.salary VALUES('Andrew Hill', 'SUPPORT', 186);
INSERT INTO topic_3.salary VALUES('Ruth Ellerbrock', 'SUPPORT', 179);
INSERT INTO topic_3.salary VALUES('Barry Johnson', 'HEAD', 10000);
INSERT INTO topic_3.salary VALUES('Sidney Higa', 'HEAD', 1);
INSERT INTO topic_3.salary VALUES('Max Lanson', 'PR', 150);


insert into topic_3.salary values('Jacovlev Atp', 'cheerleaders', 20023131);
insert into topic_3.salary values('Ivanova Vyshmat', 'cheerleaders', 16546550);
insert into topic_3.salary values('Kondratjuk Atp', 'cheerleaders', 150564877);
insert into topic_3.salary values('Starichkov Dushka', 'cheerleaders', 45789657);
insert into topic_3.salary values('Raygorodskiy Discran', 'cheerleaders', 99999999);
insert into topic_3.salary values('Erlich Discrete', 'cheerleaders', 54646550);
insert into topic_3.salary values('Akhtyamov Apt', 'cheerleaders', 654657150);


-- table 'department'
INSERT INTO topic_3.department VALUES('HR', 'Murom');
INSERT INTO topic_3.department VALUES('SUPPORT', 'Saratov');
INSERT INTO topic_3.department VALUES('MANAGEMENT', 'Samara');
INSERT INTO topic_3.department VALUES('HEAD', 'Moscow');
INSERT INTO topic_3.department VALUES('SALE', 'Moscow');
INSERT INTO topic_3.department VALUES('R&D', 'Novosibirsk');

-- я добавил нижнюю строчку
insert into topic_3.department values ('Сheerleaders', 'Moscow');


-- Вывести все значения из таблицы department

SELECT *
FROM topic_3.department;

-- # skipped task
-- Записать в таблицу department новый отдел на ваш выбор. Для нового отдела воспользоваться агрегирующими функциями
-- по зарплате. Посмотреть на полученные результаты и объяснить их.
-- HOMEWORK
-- Придумал себе задачу:
-- Нахожу все отделы (включая новый с новыми данными которых тоже сам добавил) с минимальной зарплатой больше 10р. Т.е. результат - все отделы.
-- код придуманной задачи:
select department_nm
from topic_3.salary
group by department_nm
having min(salary.salary) > 10;


-- Получить максимально полную сводку по полям: Имя сотрудника, Наименование отдела, Город отдела и Сумма зарплаты.
-- HOMEWORK

select *
from topic_3.salary full outer join topic_3.department
on topic_3.salary.department_nm = topic_3.department.department_nm;



-------------------------------------- Практическое задание (подзапросы) ----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Создать таблицу db_instructor_salary с полями name, dt, salary_amt и salary_type

CREATE TABLE topic_3.db_instructor_salary (
    name        VARCHAR(120),
    dt          DATE,
    salary_amt  DECIMAL(12, 2),
    salary_type SMALLINT
);

INSERT INTO topic_3.db_instructor_salary VALUES ('Роздухова Нина', '2019-02-25', 2999.00, 1);
INSERT INTO topic_3.db_instructor_salary VALUES ('Роздухова Нина', '2019-03-05', 5100.00, 1);
INSERT INTO topic_3.db_instructor_salary VALUES ('Роздухова Нина', '2019-03-05', 6800.00, 3);
INSERT INTO topic_3.db_instructor_salary VALUES ('Халяпов Александр', '2019-02-25', 10499.00, 1);
INSERT INTO topic_3.db_instructor_salary VALUES ('Халяпов Александр', '2019-03-05', 13000.00, 1);
INSERT INTO topic_3.db_instructor_salary VALUES ('Меркурьева Надежда', '2019-02-25', 2999.00, 1);
INSERT INTO topic_3.db_instructor_salary VALUES ('Меркурьева Надежда', '2019-02-25', 5800.00, 2);
INSERT INTO topic_3.db_instructor_salary VALUES ('Меркурьева Надежда', '2019-03-05', 6400.00, 1);
INSERT INTO topic_3.db_instructor_salary VALUES ('Меркурьева Надежда', '2019-03-05', 8300.00, 2);

-- #1
-- С помощью аналитической функции SUM найти общий размер выплат по каждому преподавателю за каждое число;
-- выведите также размер каждой выплаты.

select table_1.name, table_1.dt, salary_amt, sum_salary
from db_instructor_salary as table_1
join (
    select name, dt, sum(salary_amt) as sum_salary
    from db_instructor_salary
    group by name, dt
) as table_2
on table_1.name = table_2.name and table_1.dt = table_2.dt
order by sum_salary;

-- #2
-- С помощью аналитической функции SUM и сортировки найти суммарные выплаты по каждому преподавателю
-- за каждое число (по нарастанию).

select table_1.name, table_1.dt, sum_salary
from db_instructor_salary as table_1
join (
    select name, dt, sum(salary_amt) as sum_salary
    from db_instructor_salary
    group by name, dt
) as table_2
on table_1.name = table_2.name and table_1.dt = table_2.dt
order by sum_salary asc;

-- #3
-- С помощью аналитической функции RANK (DENSE_RANK) и подзапроса найти имена преподавателей, которые получили разово
-- минимальную выплату за все время. Перед этим добавьте следующую строку в данные:

INSERT INTO topic_3.db_instructor_salary VALUES ('Роздухова Нина', '2019-02-25', 2999, 1);

with table_1 as (
    select name, rank() over(order by salary_amt) as rank
    from db_instructor_salary
)
select distinct(name)
from table_1
where rank = 1;

-- #4
-- С помощью аналитической функции ROW_NUMBER и подзапроса найти имя преподавателя, который первый
-- получил самую маленькую выплату. Если таких преподавателей несколько, взять первого по сортировке по имени;

with table_1 as (
    select name, row_number() over(order by salary_amt, dt, name) as rank
    from db_instructor_salary
)
select distinct(name)
from table_1
where rank = 1;

-- #5
-- С помощью конструкции DISTINCT ON найти имя преподавателя, который первый получил самую маленькую выплату.
-- Если таких преподавателей несколько, взять первого по сортировке по имени. Можно ли обойтись без конструкции DISTINCT ON?

select min(salary_amt)
from db_instructor_salary;
select distinct on (salary_amt) name, dt, salary_amt
    from db_instructor_salary
    order by salary_amt, dt, name
        limit 1