-- 1. Найти количество пловцов из каждой страны, участвовавших в каждой олимпиаде, включая те олимпиады, в которых не участвовал ни один пловец.
select olympiad.country,
       olympiad.olymp_date,
       swimmer.country_nm,
       count(swimmer.swimmer_id)
from olympiad
left join competition on competition.olympiad_id = olympiad.olympiad_id
left join swimmer on swimmer.swimmer_id = competition.swimmer_id
group by olympiad.country, olympiad.olymp_date, swimmer.country_nm;



-- 2. Найти количество пловцов, родившихся в каждом году, которые участвовали в каком-либо соревновании, а также процент пловцов, родившихся в каждом году, среди всех пловцов.
with total_swimmers as (
    select count(*) as total
    from swimmer
)
select extract(year from birth_date) as birth_year, count(*) as count, (count(*)::float / (select total from total_swimmers) * 100)::numeric(5, 2) as percentage
from swimmer
where swimmer_id in (select swimmer_id from competition)
group by birth_year;



-- 3.Найти список тренеров, которые никогда не тренировали команду в олимпиадах.
select coach.name
from coach
where coach.coach_id not in (
    select coach_id from team
);



-- 4. Найти даты и количество врачей на каждой из олимпиад.
select
    olympiad.olymp_date,
    count(medical_staff.med_id)
from olympiad
left join medical_staff on olympiad.olympiad_id = medical_staff.olympiad_id
group by olympiad.olymp_date;



-- 5.Найти список олимпиад, в которых участвовали пловцы только из России
select distinct
    olympiad.olympiad_id,
    olympiad.country,
    olympiad.olymp_date
from olympiad
join (
    select
        competition.olympiad_id,
        competition.swimmer_id
    from competition
    join swimmer on swimmer.swimmer_id = competition.swimmer_id
    where swimmer.country_nm = 'Russia'
) as russia_competitions on russia_competitions.olympiad_id = olympiad.olympiad_id
group by
    olympiad.olympiad_id,
    olympiad.country,
    olympiad.olymp_date,
    swimmer.country_nm
having count(*) over (partition by olympiad.olympiad_id) = count(distinct swimmer.country_nm);




-- 6.Найти самые быстрые время пловцов по каждому стилю и дистанции.
select competition.style,
       competition.distance,
       competition.swimmer_name,
       competition.distance_time
from competition
join (
    select style, distance, min(distance_time) as min_time
    from competition
    group by style, distance
) as fastest_times on competition.style = fastest_times.style and competition.distance = fastest_times.distance and competition.distance_time = fastest_times.min_time;



-- 7.Получить общее количество золотых медалей, выигранных каждой страной на каждой олимпиаде. Дополнительно отобразить количество золотых медалей, выигранных каждым пловцом на каждой олимпиаде.
with medal_counts as (
    select
        olympiad_id,
        country,
        count(*) filter (where style = 'butterfly' and place = 1) as butterfly_golds,
        count(*) filter (where style = 'backstroke' and place = 1) as backstroke_golds,
        count(*) filter (where style = 'breaststroke' and place = 1) as breaststroke_golds,
        count(*) filter (where style = 'freestyle' and place = 1) as freestyle_golds
    from competition
    join olympiad using (olympiad_id)
    where place = 1
    group by olympiad_id, country
)
select
    olympiad_id,
    country,
    butterfly_golds,
    backstroke_golds,
    breaststroke_golds,
    freestyle_golds,
    count(*) filter (where place = 1) as total_golds
from medal_counts
join competition using (olympiad_id, country)
group by olympiad_id, country, butterfly_golds, backstroke_golds, breaststroke_golds, freestyle_golds;



-- 8. Получить список всех пловцов и их результаты в разных дисциплинах на каждой олимпиаде. Дополнительно отобразить общее количество медалей каждого пловца на всех олимпиадах.
with swimmer_medals as (
    select
        swimmer_id,
        count(*) filter (where place = 1) as golds,
        count(*) filter (where place = 2) as silvers,
        count(*) filter (where place = 3) as bronzes,
        count(*) as total_medals
    from competition
    group by swimmer_id
)
select
    swimmer.swimmer_id,
    swimmer.swimmer_name,
    olympiad.olympiad_id,
    olympiad.country,
    competition.style,
    competition.distance,
    competition.distance_time,
    swimmer_medals.golds,
    swimmer_medals.silvers,
    swimmer_medals.bronzes,
    swimmer_medals.total_medals
from swimmer
join competition on swimmer.swimmer_id = competition.swimmer_id
join olympiad on competition.olympiad_id = olympiad.olympiad_id
join swimmer_medals on swimmer.swimmer_id = swimmer_medals.swimmer_id
order by swimmer.swimmer_id, olympiad.olympiad_id;



-- 9.Вывести список стран, количество медицинских работников которых на олимпийских играх превышает 5:
select
    olympiad.country,
    count(medical_staff.medstaff_name) as medical_staff_count
from olympiad
inner join medical_staff on olympiad.olympiad_id = medical_staff.olympiad_id
group by olympiad.country
having count(medical_staff.medstaff_name) > 5;



-- 10. Вывести имя и зарплату тренера, который работает на олимпийских играх с самым высоким окладом:
select
    name,
    salary
from coach
where salary = (select max(salary) from coach);
