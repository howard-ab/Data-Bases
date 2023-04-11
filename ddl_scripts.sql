-- Data Definition Language
-- Data Bases Project
-- Created by Ховар Абд. Б05-155.
drop table olympiad cascade;
create database diht_db;

create schema if not exists swimming_competition;
set search_path to swimming_competition, public;

drop table if exists swimmer;
create table if not exists swimmer(
    swimmer_id serial not null primary key,
    swimmer_name varchar,
    birth_date date,
    country_nm varchar
);
drop table if exists olympiad;
create table if not exists olympiad(
    olympiad_id serial not null primary key,
    country varchar,
    olymp_date date
);

create table if not exists coach(
    coach_id serial not null primary key,
    name varchar,
    salary numeric
);
drop table medical_staff;
create table if not exists medical_staff(
    med_id serial not null primary key,
    olympiad_id serial not null,
    foreign key (olympiad_id)
        references olympiad(olympiad_id),
    medstaff_name varchar,
    priority varchar
);
drop table health_encounter cascade;
create table if not exists health_encounter(
    med_id serial not null,
    foreign key (med_id)
        references medical_staff(med_id),
    swimmer_id serial not null,
    foreign key (swimmer_id)
        references swimmer(swimmer_id),
    permit boolean,
    checkup_date date
);

create table if not exists team(
    swimmer_id serial not null,
    foreign key (swimmer_id)
        references swimmer(swimmer_id),
    coach_id serial not null,
    foreign key (coach_id)
        references coach(coach_id),
    contruct_nom integer,
    valid_from time,
    valid_to time
);
drop table competition cascade;
create table if not exists competition(
    competition_id serial not null primary key,
    swimmer_id serial not null,
    foreign key (swimmer_id)
        references swimmer(swimmer_id),
    olympiad_id serial not null,
    foreign key (olympiad_id)
        references olympiad(olympiad_id),
    swimmer_name varchar,
    style varchar,
     distance integer,
     distance_time date
);