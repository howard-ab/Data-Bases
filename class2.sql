create schema topic_new;
set search_path to topic_new, public;
create table topic_new.salary(
    name varchar,
    dep_name varchar,
    salary numeric
);

select *
from information_schema.tables
where table_name = 'salary' and table_schema = 'topic_2';


INSERT INTO topic_new.salary VALUES('Ken Sánchez', 'HR', 78);
INSERT INTO topic_new.salary VALUES('TerriLee Duffy', 'HR', 95);
INSERT INTO topic_new.salary VALUES('Roberto Tamburello', 'HR', 382);
INSERT INTO topic_new.salary VALUES('Rob Walters', 'HR', 16);
INSERT INTO topic_new.salary VALUES('Gail Erickson', 'HR', 1079);
INSERT INTO topic_new.salary VALUES('Jossef Gibson', 'HR', 102);
INSERT INTO topic_new.salary VALUES('Dylan Miller', 'HR', 486);
INSERT INTO topic_new.salary VALUES('Diane Margheim', 'HR', 1953);
INSERT INTO topic_new.salary VALUES('Gigi Matthew', 'SALE', 49);
INSERT INTO topic_new.salary VALUES('Michael Raheem', 'SALE', 71);
INSERT INTO topic_new.salary VALUES('Ovidiu Cracium', 'SALE', 94);
INSERT INTO topic_new.salary VALUES('Thierry Hers', 'SALE', 61);
INSERT INTO topic_new.salary VALUES('Janice Galvin', 'SALE', 972);
INSERT INTO topic_new.salary VALUES('Michael Sullivan', 'SALE', 849);
INSERT INTO topic_new.salary VALUES('Sharon Salavaria', 'SALE', 715);
INSERT INTO topic_new.salary VALUES('David Michael', 'SALE', 94);
INSERT INTO topic_new.salary VALUES('Kevin Brown', 'R&D', 891);
INSERT INTO topic_new.salary VALUES('John Wood', 'R&D', 1486);
INSERT INTO topic_new.salary VALUES('Mary Dempsey', 'R&D', 176);
INSERT INTO topic_new.salary VALUES('Wanida Benshoof', 'R&D', 49);
INSERT INTO topic_new.salary VALUES('Terry Eminhizer', 'R&D', 381);
INSERT INTO topic_new.salary VALUES('Sariya Harnpadoungsataya', 'R&D', 946);
INSERT INTO topic_new.salary VALUES('Mary Gibson', 'R&D', 486);
INSERT INTO topic_new.salary VALUES('Jill Williams', 'R&D', 19);
INSERT INTO topic_new.salary VALUES('James Hamilton', 'R&D', 46);
INSERT INTO topic_new.salary VALUES('Peter Krebs', 'R&D', 445);
INSERT INTO topic_new.salary VALUES('Jo Brown', 'R&D', 666) ;
INSERT INTO topic_new.salary VALUES('Guy Gilbert', 'MANAGEMENT', 482);
INSERT INTO topic_new.salary VALUES('Mark McArthur', 'MANAGEMENT', 12);
INSERT INTO topic_new.salary VALUES('Britta Simon', 'MANAGEMENT', 194);
INSERT INTO topic_new.salary VALUES('Margie Shoop', 'MANAGEMENT', 481);
INSERT INTO topic_new.salary VALUES('Rebecca Laszlo', 'MANAGEMENT', 16);
INSERT INTO topic_new.salary VALUES('Annik Stahl', 'MANAGEMENT', 134);
INSERT INTO topic_new.salary VALUES('Suchitra Mohan', 'R&D', 87);
INSERT INTO topic_new.salary VALUES('Brandon Heidepriem', 'R&D', 111) ;
INSERT INTO topic_new.salary VALUES('Jose Lugo', 'R&D', 185);
INSERT INTO topic_new.salary VALUES('Chris Okelberry', 'R&D', 94);
INSERT INTO topic_new.salary VALUES('Kim Abercrombie', 'R&D', 348);
INSERT INTO topic_new.salary VALUES('Ed Dudenhoefer', 'R&D', 68);
INSERT INTO topic_new.salary VALUES('JoLynn Dobney', 'R&D', 346);
INSERT INTO topic_new.salary VALUES('Bryan Baker', 'R&D', 185);
INSERT INTO topic_new.salary VALUES('James Kramer', 'SUPPORT', 965);
INSERT INTO topic_new.salary VALUES('Nancy Anderson', 'SUPPORT', 444);
INSERT INTO topic_new.salary VALUES('Simon Rapier', 'SUPPORT', 133);
INSERT INTO topic_new.salary VALUES('Thomas Michaels', 'SUPPORT', 200);
INSERT INTO topic_new.salary VALUES('Eugene Kogan', 'SUPPORT', 144);
INSERT INTO topic_new.salary VALUES('Andrew Hill', 'SUPPORT', 186);
INSERT INTO topic_new.salary VALUES('Ruth Ellerbrock', 'SUPPORT', 179);
INSERT INTO topic_new.salary VALUES('Barry Johnson', 'HEAD', 10000);
INSERT INTO topic_new.salary VALUES('Sidney Higa', 'HEAD', 1);
INSERT INTO topic_new.salary VALUES('Max Lanson', 'PR', 150);

select *
from topic_new.salary;


--25. Найти все отделы со средней зарплатой свыше 300.

select dep_name
from topic_new.salary
group by dep_name
having avg(salary.salary) > 300;

--26. Найти все города с минимальной зарплатой свыше 500.

select dep_name, MIN(salary) as min_salary_by_dept
from topic_new.salary
group by dep_name
having MIN(salary.salary) > 500;

--27. Найти все отделы с числом сотрудников не менее 10 человек.

select dep_name, count(*) as people_count
from topic_new.salary
group by dep_name
having count(*) >= 10;

--28. Вывести список всех сострудников, отсортированный по убыванию зарплаты.

select name, salary
from topic_new.salary
order by salary desc;

--29. Вывести список всех отделов по убыванию средней зарплаты в отделе, а также
-- среднюю, минимальную, максимальную зарплаты и количество человек в
-- отделе.

select dep_name, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary, count(*) as names
from topic_new.salary
group by dep_name
order by avg_salary desc;

-- 30. Подсчитать отклонение максимальной зарплаты по всех отделах от
-- минимальной и средней.

select dep_name,
max(salary) - min(salary) as min_deviation,
max(salary) - avg(salary) as avg_deviation
from topic_new.salary
group by dep_name

-- 31. Для каждого отдела рассчитать отклонепние максимальной зарплаты от
-- средней и минимальной, а также отклонение средней от минимальной.

select dep_name,
max(salary) - min(salary) as min_deviation,
max(salary) - avg(salary) as avg_deviation,
avg(salary) - min(salary) as avg_min_deviation
from topic_new.salary
group by dep_name

-- 32. Вывести отделы по возрастанию фонда оплаты труда.
select dep_name,
sum(salary) as salary_sum
from topic_new.salary
group by dep_name
order by sum(salary.salary)